# frozen_string_literal: true

require_relative "test_helper"

# sdk/testdata/webhook-signature-vectors.json ortak vektörleri (Node/PHP/Python/Go/Java/.NET ile aynı).
class WebhookTest < Minitest::Test
  VECTORS = JSON.parse(File.read(File.expand_path("../../testdata/webhook-signature-vectors.json", __dir__), encoding: "UTF-8"))["cases"]

  VECTORS.each_with_index do |c, i|
    define_method("test_vector_#{i}") do
      result = HeroSignal::Webhook.verify_signature(
        payload: c["payload"], header: c["header"], secret: c["secrets"], tolerance: c["toleranceSeconds"], now: c["now"]
      )
      assert_equal c["expected"]["ok"], result.ok, c["name"]
      if c["expected"]["ok"]
        assert_equal c["expected"]["timestamp"], result.timestamp
        if c["events"]
          events = HeroSignal::Webhook.construct_events(
            payload: c["payload"].b, header: c["header"], secret: c["secrets"], tolerance: c["toleranceSeconds"], now: c["now"]
          )
          assert_equal c["events"], events.length
          events.each { |e| refute_nil e["type"] }
        end
      else
        assert_equal c["expected"]["reason"], result.reason, c["name"]
        error = assert_raises(HeroSignal::WebhookSignatureError) do
          HeroSignal::Webhook.construct_events(
            payload: c["payload"], header: c["header"], secret: c["secrets"], tolerance: c["toleranceSeconds"], now: c["now"]
          )
        end
        assert_equal c["expected"]["reason"], error.reason
      end
    end
  end

  def test_header_array_uses_first_value
    c = VECTORS.first
    assert HeroSignal::Webhook.verify_signature(payload: c["payload"], header: [c["header"]], secret: c["secrets"].first, now: c["now"]).ok?
  end

  def test_malformed_body
    sig = OpenSSL::HMAC.hexdigest("SHA256", "s", "1800000000.not json")
    error = assert_raises(HeroSignal::WebhookSignatureError) do
      HeroSignal::Webhook.construct_events(payload: "not json", header: "t=1800000000,v1=#{sig}", secret: "s", now: 1_800_000_000)
    end
    assert_equal "malformed_body", error.reason
  end

  def test_default_tolerance_uses_current_time
    ts = Time.now.to_i
    payload = '{"id":"whe_1","type":"x"}'
    sign = ->(t) { "t=#{t},v1=#{OpenSSL::HMAC.hexdigest('SHA256', 's', "#{t}.#{payload}")}" }
    assert HeroSignal::Webhook.verify_signature(payload: payload, header: sign.call(ts), secret: "s").ok
    assert_equal "timestamp_out_of_tolerance",
                 HeroSignal::Webhook.verify_signature(payload: payload, header: sign.call(ts - 400), secret: "s").reason
  end
end
