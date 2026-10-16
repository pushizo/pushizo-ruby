# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "pushizo"
require "minitest/autorun"

# Sıralı yanıtlar döndüren ve istekleri kaydeden sahte taşıma; :network gönderim sonrası ağ hatası,
# :refused bağlantı reddi (istek sunucuya hiç gitmedi) üretir.
class FakeTransport
  Request = Struct.new(:method, :url, :headers, :body, :timeout)

  attr_reader :requests

  def initialize(*responses)
    @responses = responses
    @requests = []
  end

  def call(method, url, headers, body, timeout)
    @requests << Request.new(method, url, headers.dup, body, timeout)
    response = @responses.shift
    raise Errno::ECONNRESET, "bağlantı koptu" if response.nil? || response == :network
    raise Errno::ECONNREFUSED, "bağlantı reddedildi" if response == :refused

    status, body_text, headers_out = response
    [status, { "content-type" => "application/json" }.merge(headers_out || {}), body_text]
  end

  def json(index)
    JSON.parse(@requests[index].body)
  end
end
