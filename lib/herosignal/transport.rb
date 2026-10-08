# frozen_string_literal: true

require "net/http"
require "openssl"
require "uri"

module HeroSignal
  # Net::HTTP taşıyıcısı. Özel taşıyıcı (proxy, test) aynı arayüzü sağlamalıdır:
  #   call(method, uri, headers, body, timeout) => [status (Integer), headers (Hash, küçük harf anahtar), body (String)]
  # Ağ hataları NetworkError olarak yükseltilir.
  class NetHttpTransport
    # Ağ hatası (bağlantı, zaman aşımı, TLS); istemci tarafından yeniden denenir.
    class NetworkError < StandardError; end

    NETWORK_ERRORS = [
      SocketError, IOError, EOFError, SystemCallError, Timeout::Error, OpenSSL::SSL::SSLError,
      Net::OpenTimeout, Net::ReadTimeout, Net::HTTPBadResponse,
    ].freeze

    def call(method, uri, headers, body, timeout)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.open_timeout = timeout
      http.read_timeout = timeout
      http.write_timeout = timeout if http.respond_to?(:write_timeout=)
      request = Net::HTTPGenericRequest.new(method, !body.nil?, true, uri.request_uri, headers)
      request.body = body unless body.nil?
      response = http.start { |conn| conn.request(request) }
      response_headers = {}
      response.each_header { |k, v| response_headers[k.downcase] = v }
      [response.code.to_i, response_headers, response.body.to_s]
    rescue *NETWORK_ERRORS => e
      raise NetworkError, "#{e.class}: #{e.message}"
    end
  end
end
