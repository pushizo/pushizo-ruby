# frozen_string_literal: true

require "socket"
require_relative "test_helper"

class TestClient < Minitest::Test
  def setup
    @slept = []
  end

  def client(transport, **opts)
    HeroSignal::Client.new(api_key: "hs_live_test", app_id: "app_1", base_url: "https://api.test/",
                           transport: transport, sleeper: ->(s) { @slept << s }, **opts)
  end

  def test_create_notification_sends_auth_app_and_idempotency_key
    t = FakeTransport.new([202, '{"id":"msg_1","status":"queued"}'])
    res = client(t).notifications.create({ target: { include_aliases: { external_id: ["u1"] } }, contents: { tr: "Merhaba" } })
    assert_instance_of HeroSignal::Models::CreateNotificationResult, res
    assert_equal "msg_1", res.id
    assert_equal "msg_1", res["id"]
    r = t.requests.first
    assert_equal :post, r.method
    assert_equal "https://api.test/v1/notifications", r.url
    assert_equal "Bearer hs_live_test", r.headers["Authorization"]
    assert r.headers["User-Agent"].start_with?("herosignal-ruby/")
    assert_match(/\A[0-9a-f-]{36}\z/, r.headers["Idempotency-Key"])
    body = t.json(0)
    assert_equal "app_1", body["app_id"]
    assert_equal "Merhaba", body["contents"]["tr"]
    assert_equal ["u1"], body["target"]["include_aliases"]["external_id"]
  end

  def test_model_body_explicit_and_body_idempotency_key
    t = FakeTransport.new([202, '{"id":"m"}'], [202, '{"id":"m"}'])
    hs = client(t)
    dto = HeroSignal::Models::CreateNotificationDto.new(contents: { "en" => "x" })
    hs.notifications.create(dto, idempotency_key: "order-1")
    assert_nil dto.app_id, "çağıranın nesnesi değiştirilmez"
    hs.notifications.create({ "contents" => { "en" => "x" }, "idempotency_key" => "order-2" }, app_id: "app_2")
    assert_equal "order-1", t.requests[0].headers["Idempotency-Key"]
    assert_equal "order-2", t.requests[1].headers["Idempotency-Key"]
    assert_equal "app_2", t.json(1)["app_id"]
  end

  def test_no_idempotency_key_when_disabled_or_unsupported
    t = FakeTransport.new([202, '{"id":"m"}'], [200, '{"accepted":1}'])
    hs = client(t, auto_idempotency_key: false)
    hs.notifications.create({ contents: { en: "x" } })
    hs.events.send_events({ events: [{ name: "purchase", external_id: "u1" }] })
    assert_nil t.requests[0].headers["Idempotency-Key"]
    assert_nil t.requests[1].headers["Idempotency-Key"]
  end

  def test_query_and_path_encoding
    t = FakeTransport.new([200, '{"data":[]}'], [200, '{"id":"usr_1","aliases":[{"label":"external_id","value":"u1"}]}'])
    hs = client(t)
    hs.notifications.list(limit: 10, status: "completed")
    assert_equal "https://api.test/v1/notifications?app_id=app_1&limit=10&status=completed", t.requests[0].url
    user = hs.users.get_by_alias("crm id", "a/b", app_id: "app 2")
    assert_equal "https://api.test/v1/apps/app%202/users/by/crm%20id/a%2Fb", t.requests[1].url
    assert_equal "usr_1", user.id
  end

  def test_missing_app_id
    hs = HeroSignal::Client.new(api_key: "k", transport: FakeTransport.new)
    assert_raises(ArgumentError) { hs.apps.get }
    assert_raises(ArgumentError) { HeroSignal::Client.new(api_key: "") }
    refute_includes hs.inspect, "k\""
  end

  def test_retry_after_backoff_and_stable_idempotency_key
    t = FakeTransport.new(
      [429, '{"error":{"code":"HS_RATE_LIMITED","message":"yavaş"}}', { "retry-after" => "2" }],
      [503, '{"error":{"code":"HS_SERVICE_UNAVAILABLE","message":"x"}}'],
      :network,
      [202, '{"id":"msg_1"}']
    )
    res = client(t).notifications.create({ contents: { en: "x" } })
    assert_equal "msg_1", res.id
    assert_equal [2.0, 1.0, 3.0], @slept
    assert_equal 1, t.requests.map { |r| r.headers["Idempotency-Key"] }.uniq.size
  end

  def test_typed_errors_and_no_retry_on_4xx
    t = FakeTransport.new(
      [404, '{"error":{"code":"HS_NOT_FOUND","message":"yok","request_id":"req_1","details":{"id":"x"}}}'],
      [422, '{"error":{"code":"HS_NO_RECIPIENTS","message":"boş"}}'],
      [401, '{"error":{"code":"HS_UNAUTHENTICATED","message":"anahtar"}}']
    )
    hs = client(t)
    err = assert_raises(HeroSignal::NotFoundError) { hs.notifications.get("msg_x") }
    assert_kind_of HeroSignal::Error, err
    assert_equal [404, HeroSignal::ErrorCode::NOT_FOUND, "req_1", { "id" => "x" }], [err.status, err.code, err.request_id, err.details]
    refute err.retryable?
    invalid = assert_raises(HeroSignal::InvalidRequestError) { hs.segments.get("seg_1") }
    assert_equal HeroSignal::ErrorCode::NO_RECIPIENTS, invalid.code
    assert_raises(HeroSignal::AuthenticationError) { hs.apps.list }
    assert_empty @slept
    assert_equal 3, t.requests.size
  end

  def test_retries_exhausted
    t = FakeTransport.new([500, "{}"], [500, "{}"], [500, "{}"], [500, "{}"])
    err = assert_raises(HeroSignal::ServerError) { client(t).apps.list }
    assert_equal "HTTP_500", err.code
    assert_equal 4, t.requests.size
    assert_equal [0.3, 1.0, 3.0], @slept

    net = assert_raises(HeroSignal::NetworkError) { client(FakeTransport.new(:network, :network), max_retries: 1).apps.list }
    assert_equal 0, net.status
    assert_equal HeroSignal::ErrorCode::NETWORK, net.code

    assert_raises(HeroSignal::RateLimitError) do
      client(FakeTransport.new([429, "{}"])).apps.list(request_options: { max_retries: 0 })
    end
  end

  def test_pagination_iterates_all_pages
    t = FakeTransport.new(
      [200, '{"data":[{"id":"s1"},{"id":"s2"}],"next_cursor":"c2","has_more":true}'],
      [200, '{"data":[{"id":"s3"}],"next_cursor":null,"has_more":false}']
    )
    segments = client(t).segments.list_all(limit: 2)
    assert_instance_of Enumerator, segments
    assert_equal %w[s1 s2 s3], segments.map(&:id)
    assert_equal "https://api.test/v1/apps/app_1/segments?limit=2", t.requests[0].url
    assert_equal "https://api.test/v1/apps/app_1/segments?limit=2&cursor=c2", t.requests[1].url
  end

  def test_multipart_import
    t = FakeTransport.new([202, '{"id":"imp_1"}'])
    client(t).imports.create(type: "csv_users", file: HeroSignal::FileUpload.new("external_id\nu1\n", filename: "users.csv"))
    r = t.requests.first
    assert r.headers["Content-Type"].start_with?("multipart/form-data; boundary=")
    assert_includes r.body, "name=\"type\"\r\n\r\ncsv_users"
    assert_includes r.body, "filename=\"users.csv\""
    assert_includes r.body, "Content-Type: text/csv"
    assert_includes r.body, "external_id\nu1\n"
  end

  def test_models_nested_coercion_and_unknown_fields
    t = FakeTransport.new([200, '{"data":[{"id":"msg_1","status":"queued","yeni_alan":1}],"has_more":false,"next_cursor":null}'])
    page = client(t).notifications.list
    msg = page.data.first
    assert_instance_of HeroSignal::Models::Message, msg
    assert_equal "queued", msg.status
    assert_equal 1, msg["yeni_alan"]
    assert_equal false, page.has_more
  end

  def test_default_net_http_transport_against_local_server
    server = TCPServer.new("127.0.0.1", 0)
    port = server.addr[1]
    seen = Queue.new
    thread = Thread.new do
      conn = server.accept
      request_line = conn.gets
      headers = {}
      while (line = conn.gets) && line != "\r\n"
        k, v = line.split(":", 2)
        headers[k.downcase] = v.strip
      end
      seen << [request_line.strip, headers["authorization"]]
      body = '{"data":[{"id":"app_1","name":"Demo"}]}'
      conn.write("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nContent-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}")
      conn.close
    end
    hs = HeroSignal::Client.new(api_key: "hs_live_x", base_url: "http://127.0.0.1:#{port}")
    apps = hs.apps.list
    assert_equal "Demo", apps.data.first.name
    assert_equal ["GET /v1/apps HTTP/1.1", "Bearer hs_live_x"], seen.pop
  ensure
    thread&.join(2)
    server&.close
  end
end
