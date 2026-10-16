# frozen_string_literal: true

require "net/http"
require "openssl"
require "uri"

module Pushizo
  # Net::HTTP tabanlı varsayılan taşıma. Özel taşıma aynı imzalı #call(method, url, headers, body, timeout)
  # metodu sağlar ve [durum, başlıklar (küçük harf anahtar), gövde] döndürür; ağ hatasında istisna fırlatır.
  class NetHttpTransport
    def call(method, url, headers, body, timeout)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.open_timeout = timeout
      http.read_timeout = timeout
      http.write_timeout = timeout if http.respond_to?(:write_timeout=)
      request = Net::HTTPGenericRequest.new(method.to_s.upcase, !body.nil?, true, uri.request_uri, headers)
      request.body = body unless body.nil?
      response = http.start { |conn| conn.request(request) }
      response_headers = {}
      response.each_header { |k, v| response_headers[k.downcase] = v }
      [response.code.to_i, response_headers, response.body.to_s]
    end
  end
end
