# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "herosignal"
require "minitest/autorun"
require "json"

# Sıradaki yanıtları dönen ve istekleri kaydeden sahte taşıyıcı.
class FakeTransport
  Recorded = Struct.new(:method, :uri, :headers, :body, :timeout, keyword_init: true) do
    def query
      URI.decode_www_form(uri.query.to_s).each_with_object(Hash.new { |h, k| h[k] = [] }) { |(k, v), h| h[k] << v }
    end
  end

  attr_reader :requests, :sleeps

  def initialize
    @responses = []
    @requests = []
    @sleeps = []
  end

  def json(status, body, headers = {})
    @responses << [status, { "content-type" => "application/json" }.merge(headers), JSON.generate(body)]
    self
  end

  def raw(status, body, content_type, headers = {})
    @responses << [status, { "content-type" => content_type }.merge(headers), body]
    self
  end

  def network_error(message = "boom")
    @responses << HeroSignal::NetHttpTransport::NetworkError.new(message)
    self
  end

  def call(method, uri, headers, body, timeout)
    @requests << Recorded.new(method: method, uri: uri, headers: headers, body: body, timeout: timeout)
    raise "beklenmeyen istek: #{method} #{uri}" if @responses.empty?

    nxt = @responses.shift
    raise nxt if nxt.is_a?(Exception)

    nxt
  end

  def client(**opts)
    defaults = {
      api_key: "hs_live_test",
      app_id: "app_default",
      base_url: "https://api.test",
      transport: self,
      sleeper: ->(s) { @sleeps << s },
      clock: -> { Time.utc(2030, 1, 1, 0, 0, 0) },
    }
    HeroSignal::Client.new(**defaults.merge(opts))
  end
end
