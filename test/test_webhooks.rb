# frozen_string_literal: true

require_relative "test_helper"

# Ortak vektörler: sdk/testdata/webhook-signature-vectors.json (Node, PHP, Python, Go, Java, .NET ile aynı).
class TestWebhooks < Minitest::Test
  VECTORS = JSON.parse(File.read(File.expand_path("../../testdata/webhook-signature-vectors.json", __dir__)))

  VECTORS["cases"].each_with_index do |c, i|
    define_method("test_vector_#{i}_#{c['name'].gsub(/[^a-z0-9]+/i, '_')}") do
      secret = c["secrets"].size == 1 ? c["secrets"].first : c["secrets"]
      result = Pushizo::Webhook.verify_signature(c["payload"], c["header"], secret, tolerance: c["toleranceSeconds"], now: c["now"])
      expected = c["expected"]
      assert_equal expected["ok"], result.ok?, c["name"]
      if expected["ok"]
        assert_equal expected["timestamp"], result.timestamp
        events = Pushizo::Webhook.construct_events(c["payload"], c["header"], c["secrets"], tolerance: c["toleranceSeconds"], now: c["now"])
        assert_equal c["events"], events.size if c.key?("events")
      else
        assert_equal expected["reason"], result.reason
        error = assert_raises(Pushizo::WebhookSignatureError) do
          Pushizo::Webhook.construct_events(c["payload"], c["header"], c["secrets"], tolerance: c["toleranceSeconds"], now: c["now"])
        end
        assert_equal expected["reason"], error.reason
      end
    end
  end

  def test_binary_payload_and_header_array
    c = VECTORS["cases"].first
    result = Pushizo::Webhook.verify_signature(c["payload"].b, [c["header"]], c["secrets"], now: c["now"])
    assert result.ok?
  end

  def test_identity_hash_matches_node
    # Node: createHmac('sha256', 'secret').update('user-1').digest('hex')
    assert_equal "1d16fd7e96e8a9681f283b8a251822ffdc71e2a5bda0c5267a044874fa21b82b", Pushizo.identity_hash("secret", "user-1")
    assert_equal Pushizo.identity_hash("secret", "user-1"), Pushizo::Client.identity_hash("secret", "user-1")
  end
end
