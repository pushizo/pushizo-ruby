# frozen_string_literal: true

require_relative "test_helper"

# İstemci davranışı: kimlik doğrulama, app kapsamı, idempotency, yeniden deneme, hata eşleme, sayfalama.
class ClientTest < Minitest::Test
  NOTIFICATION = { target: { include_aliases: { external_id: ["u1"] } }, contents: { en: "Hi" } }.freeze

  def setup
    @fake = FakeTransport.new
  end

  def test_requires_api_key
    assert_raises(ArgumentError) { HeroSignal::Client.new(api_key: "") }
  end

  def test_create_notification_headers_body_and_idempotency_reuse
    @fake.json(503, { error: { code: "UNAVAILABLE", message: "x" } }).json(202, { id: "msg_1" })
    result = @fake.client.notifications.create(NOTIFICATION)
    assert_equal({ "id" => "msg_1" }, result)
    assert_equal 2, @fake.requests.length
    r = @fake.requests.first
    assert_equal "POST", r.method
    assert_equal "https://api.test/v1/notifications", r.uri.to_s
    assert_equal "Bearer hs_live_test", r.headers["Authorization"]
    assert_equal "application/json", r.headers["Content-Type"]
    assert r.headers["User-Agent"].start_with?("herosignal-ruby/")
    assert_equal "app_default", JSON.parse(r.body)["app_id"]
    key = r.headers["Idempotency-Key"]
    assert_match(/\A\h{8}-\h{4}-4\h{3}-\h{4}-\h{12}\z/, key)
    assert_equal key, @fake.requests[1].headers["Idempotency-Key"]
    assert_equal [0.3], @fake.sleeps
  end

  def test_idempotency_explicit_body_disabled_and_non_idempotent
    4.times { @fake.json(202, {}) }
    hs = @fake.client
    hs.notifications.create(NOTIFICATION, idempotency_key: "order-1")
    hs.notifications.create(NOTIFICATION.merge(idempotency_key: "order-2"))
    @fake.client(auto_idempotency_key: false).notifications.create(NOTIFICATION)
    hs.suppressions.create({ channel: "email", value: "a@b.c" })
    assert_equal "order-1", @fake.requests[0].headers["Idempotency-Key"]
    assert_equal "order-2", @fake.requests[1].headers["Idempotency-Key"]
    assert_nil @fake.requests[2].headers["Idempotency-Key"]
    assert_nil @fake.requests[3].headers["Idempotency-Key"]
  end

  def test_app_id_path_query_and_override
    @fake.json(200, { id: "seg_1" }).json(200, { data: [], has_more: false })
    hs = @fake.client
    hs.segments.get("seg/1", app_id: "app_other")
    assert_equal "/v1/apps/app_other/segments/seg%2F1", @fake.requests[0].uri.path
    hs.notifications.list(limit: 10, status: "completed")
    q = @fake.requests[1].query
    assert_equal ["app_default"], q["app_id"]
    assert_equal ["10"], q["limit"]
    assert_equal ["completed"], q["status"]
    refute q.key?("cursor")
  end

  def test_missing_app_id_and_empty_path_param
    assert_raises(ArgumentError) { @fake.client(app_id: nil).segments.list }
    assert_raises(ArgumentError) { @fake.client.segments.get("") }
    assert_empty @fake.requests
  end

  def test_retry_backoff_and_retry_after
    @fake.json(500, {}).json(429, {}, "retry-after" => "2").json(502, {}).json(200, { data: [] })
    @fake.client.apps.list
    assert_equal [0.3, 2.0, 3.0], @fake.sleeps
  end

  def test_retry_after_http_date
    @fake.json(429, {}, "retry-after" => "Tue, 01 Jan 2030 00:00:10 GMT").json(200, {})
    @fake.client.apps.list
    assert_equal [10.0], @fake.sleeps
  end

  def test_retries_exhausted
    @fake.json(503, { error: { code: "UNAVAILABLE", message: "down", request_id: "req_1" } })
         .json(503, { error: { code: "UNAVAILABLE", message: "down", request_id: "req_2" } })
    error = assert_raises(HeroSignal::Error) { @fake.client(max_retries: 1).apps.list }
    assert_equal 503, error.status
    assert_equal "UNAVAILABLE", error.code
    assert_equal "req_2", error.request_id
    assert error.retryable?
    assert_equal 2, @fake.requests.length
    assert_equal 1, @fake.sleeps.length
  end

  def test_client_error_mapped_and_not_retried
    @fake.json(422, { error: { code: "VALIDATION_FAILED", message: "bad", request_id: "req_1", details: { field: "x" } } })
         .raw(404, "not found", "text/plain", "x-request-id" => "req_h")
    hs = @fake.client
    error = assert_raises(HeroSignal::Error) { hs.apps.list }
    assert_equal [422, "VALIDATION_FAILED", "bad", "req_1", { "field" => "x" }],
                 [error.status, error.code, error.message, error.request_id, error.details]
    refute error.retryable?
    assert_includes error.inspect, "req_1"
    error2 = assert_raises(HeroSignal::Error) { hs.apps.get }
    assert_equal ["HTTP_404", "req_h"], [error2.code, error2.request_id]
    assert_equal 2, @fake.requests.length
  end

  def test_network_error_retried_then_fails
    @fake.network_error.network_error
    error = assert_raises(HeroSignal::Error) { @fake.client(max_retries: 1).apps.list }
    assert_equal [0, "NETWORK"], [error.status, error.code]
    assert error.retryable?
    assert_equal [0.3], @fake.sleeps
  end

  def test_request_options_override
    @fake.json(500, {})
    assert_raises(HeroSignal::Error) do
      @fake.client.apps.list(request_options: { max_retries: 0, timeout: 5, headers: { "X-Trace" => "t1" } })
    end
    assert_equal 1, @fake.requests.length
    assert_equal "t1", @fake.requests[0].headers["X-Trace"]
    assert_equal 5, @fake.requests[0].timeout
  end

  def test_pagination
    @fake.json(200, { data: [{ id: "s1" }, { id: "s2" }], next_cursor: "c2", has_more: true })
         .json(200, { data: [{ id: "s3" }], next_cursor: nil, has_more: false })
    ids = @fake.client.segments.list_all(limit: 2).map { |s| s["id"] }
    assert_equal %w[s1 s2 s3], ids
    refute @fake.requests[0].query.key?("cursor")
    assert_equal ["c2"], @fake.requests[1].query["cursor"]
    assert_equal ["2"], @fake.requests[1].query["limit"]
  end

  def test_pagination_is_lazy
    @fake.json(200, { data: [{ id: "s1" }], next_cursor: "c2", has_more: true })
    first = @fake.client.segments.list_all.first
    assert_equal "s1", first["id"]
    assert_equal 1, @fake.requests.length
  end

  def test_multipart_upload
    @fake.json(201, { id: "imp_1" })
    @fake.client.imports.create("csv_users", ["users.csv", "external_id\nu1\n"])
    r = @fake.requests[0]
    assert_equal "/v1/apps/app_default/imports", r.uri.path
    assert r.headers["Content-Type"].start_with?("multipart/form-data; boundary=")
    assert_includes r.body, 'name="type"'
    assert_includes r.body, "csv_users"
    assert_includes r.body, 'filename="users.csv"'
    assert_includes r.body, "Content-Type: text/csv"
    assert_includes r.body, "external_id"
  end

  def test_raw_request_and_query_encoding
    @fake.raw(200, "a,b\n1,2\n", "text/csv").raw(204, "", "application/json")
    hs = @fake.client
    csv = hs.request("GET", "/v1/custom", query: { format: "csv", b: [1, 2], flag: true, skip: nil, obj: { x: 1 } })
    assert_equal "a,b\n1,2\n", csv
    q = @fake.requests[0].query
    assert_equal %w[1 2], q["b"]
    assert_equal ["true"], q["flag"]
    assert_equal ['{"x":1}'], q["obj"]
    refute q.key?("skip")
    assert_nil hs.request("DELETE", "/v1/x")
  end

  def test_identity_hash
    assert_equal OpenSSL::HMAC.hexdigest("SHA256", "secret", "user-1"), HeroSignal::Client.identity_hash("secret", "user-1")
  end

  def test_resources_present
    hs = @fake.client
    %i[notifications users subscriptions segments templates campaigns webhooks].each do |name|
      assert hs.respond_to?(name), name.to_s
    end
  end
end
