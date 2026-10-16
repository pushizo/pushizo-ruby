# frozen_string_literal: true

require "erb"
require "json"
require "openssl"
require "securerandom"
require "time"

module Pushizo
  # Pushizo API istemcisi. Kaynak erişimcileri (notifications, users, segments …) api/openapi.yaml'dan üretilir.
  #
  #   hs = Pushizo::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…")
  #   hs.segments.list_all(limit: 50).each { |segment| puts segment.name }
  class Client
    include GeneratedResources

    DEFAULT_BASE_URL = "https://api.pushizo.com"
    BACKOFF = [0.3, 1.0, 3.0].freeze
    NETWORK_ERRORS = [
      IOError, EOFError, SocketError, SystemCallError, Timeout::Error, OpenSSL::SSL::SSLError,
      Net::OpenTimeout, Net::ReadTimeout, Net::HTTPBadResponse
    ].freeze

    # Sunucuda tekrarlanması ek yan etki doğurmayan HTTP metotları; 5xx ve ağ hatalarında serbestçe yeniden denenir.
    IDEMPOTENT_METHODS = %w[GET HEAD OPTIONS PUT DELETE].freeze

    # Bağlantı kurulmadan oluşan hatalar (DNS çözümlenemedi, bağlantı reddi, ağ/sunucu erişilemez, bağlantı zaman
    # aşımı): istek sunucuya hiç gönderilmemiştir.
    NOT_SENT_ERRORS = [
      SocketError, Errno::ECONNREFUSED, Errno::EHOSTUNREACH, Errno::ENETUNREACH, Net::OpenTimeout
    ].freeze

    attr_reader :app_id, :base_url

    # api_key:: hs_live_… API anahtarı (Bearer).
    # app_id:: Çağrılarda app_id: verilmezse kullanılacak varsayılan app.
    # base_url:: API adresi; yerel geliştirmede http://localhost:4000.
    # timeout:: Deneme başına zaman aşımı (sn).
    # max_retries:: 429/5xx ve ağ hatalarında en fazla yeniden deneme.
    # auto_idempotency_key:: Idempotency-Key destekleyen çağrılarda anahtar verilmezse UUID üret.
    # transport:: Özel taşıma (#call); varsayılan NetHttpTransport.
    # sleeper:: Yeniden deneme beklemesi (testlerde değiştirilebilir).
    def initialize(api_key:, app_id: nil, base_url: DEFAULT_BASE_URL, timeout: 30, max_retries: 3,
                   auto_idempotency_key: true, user_agent: nil, transport: nil, sleeper: nil)
      raise ArgumentError, "Pushizo: api_key gerekli." if api_key.nil? || api_key.to_s.empty?

      @api_key = api_key.to_s
      @app_id = app_id
      @base_url = base_url.to_s.sub(%r{/+\z}, "")
      @timeout = timeout
      @max_retries = max_retries
      @auto_idempotency_key = auto_idempotency_key
      @user_agent = user_agent || "pushizo-ruby/#{VERSION}"
      @transport = transport || NetHttpTransport.new
      @sleeper = sleeper || ->(seconds) { sleep(seconds) }
    end

    # API anahtarı inspect çıktısında görünmez.
    def inspect
      "#<#{self.class.name} base_url=#{@base_url.inspect} app_id=#{@app_id.inspect}>"
    end

    # SDK identity verification için identity_hash = HMAC-SHA256(sdk_secret, external_id) (hex).
    def self.identity_hash(sdk_secret, external_id)
      Pushizo.identity_hash(sdk_secret, external_id)
    end

    # Düşük seviyeli istek (SDK'da metodu olmayan uçlar veya format=csv gibi JSON dışı yanıtlar için).
    # path "/v1/…" biçimindedir; {appId} varsa app kimliğiyle doldurulur. JSON yanıt Hash, diğerleri String döner.
    def request(method, path, query: nil, body: nil, app_id: nil, request_options: nil)
      call(method, path, path_params: {}, query: query, body: body, app_id: app_id, request_options: request_options)
    end

    # İç API: üretilmiş kaynakların çağırdığı yürütücü.
    def call(method, path, path_params: {}, query: nil, body: nil, form: nil, app_id: nil, query_app_id: false,
             body_app_id: false, idempotent: false, idempotency_key: nil, response: nil, request_options: nil)
      opts = request_options || {}
      url_path = path.dup
      url_path = url_path.gsub("{appId}", escape(resolve_app_id(app_id))) if url_path.include?("{appId}")
      path_params.each do |name, value|
        raise ArgumentError, "Pushizo: '#{name}' yol parametresi boş olamaz." if value.nil? || value.to_s.empty?

        url_path = url_path.gsub("{#{name}}", escape(value.to_s))
      end

      items = []
      items << ["app_id", resolve_app_id(app_id)] if query_app_id
      (query || {}).each do |key, value|
        next if value.nil?

        Array(value.is_a?(Hash) ? [value] : value).each { |v| items << [key.to_s, scalar(v)] unless v.nil? }
      end
      url = "#{@base_url}#{url_path}"
      url += "?#{items.map { |k, v| "#{escape(k)}=#{escape(v)}" }.join('&')}" unless items.empty?

      key = idempotency_key || opts[:idempotency_key]
      headers = {
        "Authorization" => "Bearer #{@api_key}",
        "Accept" => "application/json",
        "User-Agent" => @user_agent
      }
      payload = nil
      if form
        boundary = "----pushizo#{SecureRandom.hex(16)}"
        payload = multipart(form, boundary)
        headers["Content-Type"] = "multipart/form-data; boundary=#{boundary}"
      elsif !body.nil?
        data = Types.serialize(body)
        if data.is_a?(Hash)
          data = data.merge("app_id" => resolve_app_id(app_id)) if body_app_id && data["app_id"].to_s.empty?
          key ||= data["idempotency_key"] if idempotent && data["idempotency_key"].is_a?(String)
        end
        payload = JSON.generate(data)
        headers["Content-Type"] = "application/json"
      end
      key = SecureRandom.uuid if (key.nil? || key.to_s.empty?) && idempotent && @auto_idempotency_key
      headers["Idempotency-Key"] = key.to_s if key && !key.to_s.empty?
      (opts[:headers] || {}).each { |k, v| headers[k.to_s] = v.to_s }

      raw = send_with_retries(method, url, headers, payload, opts)
      response ? Types.coerce(raw, response) : raw
    end

    # İç API: data / next_cursor / has_more zarfını sayfa sayfa dolaşan Enumerator.
    def paginate(cursor)
      Enumerator.new do |yielder|
        next_cursor = cursor
        loop do
          page = yield(next_cursor)
          data = page.is_a?(BaseModel) ? page["data"] : (page || {})["data"]
          (data || []).each { |item| yielder << item }
          next_cursor = page["next_cursor"]
          break unless page["has_more"] && next_cursor && !next_cursor.to_s.empty?
        end
      end
    end

    private

    def resolve_app_id(app_id)
      id = app_id || @app_id
      raise ArgumentError, "Pushizo: app_id verilmedi (istemci seçeneği veya çağrı parametresi)." if id.nil? || id.to_s.empty?

      id.to_s
    end

    def escape(value)
      ERB::Util.url_encode(value.to_s)
    end

    def scalar(value)
      case value
      when String then value
      when Symbol then value.to_s
      when true, false, Numeric then value.to_s
      else JSON.generate(Types.serialize(value))
      end
    end

    def send_with_retries(method, url, headers, payload, opts)
      timeout = opts[:timeout] || @timeout
      max_retries = opts.key?(:max_retries) ? opts[:max_retries] : @max_retries
      has_key = headers.any? { |k, v| k.to_s.casecmp?("idempotency-key") && !v.to_s.empty? }
      attempt = 0
      loop do
        error = nil
        not_sent = false
        begin
          status, response_headers, response_body = @transport.call(method, url, headers, payload, timeout)
          return parse_body(response_headers, response_body) if status.between?(200, 299)

          error = error_from(status, response_headers, response_body)
        rescue *NETWORK_ERRORS => e
          error = NetworkError.new(0, ErrorCode::NETWORK, e.message.to_s.empty? ? e.class.name : e.message)
          not_sent = NOT_SENT_ERRORS.any? { |klass| e.is_a?(klass) }
        end
        raise error if attempt >= max_retries || !retry?(method, error, has_key, not_sent)

        delay = error.retry_after && error.retry_after.positive? ? error.retry_after : BACKOFF[[attempt, BACKOFF.size - 1].min]
        @sleeper.call(delay)
        attempt += 1
      end
    end

    # Yeniden deneme politikası: 429 her metotta (istek işlenmeden reddedilmiştir); 5xx ve ağ hataları idempotent
    # metotlarda, POST/PATCH'te yalnızca Idempotency-Key varsa ya da istek sunucuya hiç gönderilmediyse. Aksi hâlde
    # sunucu isteği işlemiş olabilir ve tekrar çift kayıt üretebilir.
    def retry?(method, error, has_idempotency_key, not_sent)
      return true if error.status == 429
      return false unless error.retryable?

      IDEMPOTENT_METHODS.include?(method.to_s.upcase) || has_idempotency_key || not_sent
    end

    def parse_body(headers, body)
      return nil if body.nil? || body.empty?

      content_type = headers["content-type"].to_s
      return body unless content_type.empty? || content_type.include?("json")

      JSON.parse(body)
    rescue JSON::ParserError
      body
    end

    def error_from(status, headers, body)
      envelope = begin
        parsed = JSON.parse(body.to_s)
        parsed.is_a?(Hash) && parsed["error"].is_a?(Hash) ? parsed["error"] : {}
      rescue JSON::ParserError
        {}
      end
      details = envelope["details"].is_a?(Hash) ? envelope["details"] : nil
      Error.class_for(status).new(
        status,
        (envelope["code"] || "HTTP_#{status}").to_s,
        (envelope["message"] || "HTTP #{status}").to_s,
        request_id: envelope["request_id"] || headers["x-request-id"],
        details: details,
        retry_after: parse_retry_after(headers["retry-after"])
      )
    end

    # Retry-After: saniye veya HTTP tarihi.
    def parse_retry_after(value)
      return nil if value.nil? || value.to_s.strip.empty?

      text = value.to_s.strip
      if text.match?(/\A\d+(\.\d+)?\z/)
        seconds = text.to_f
        return seconds.positive? ? seconds : nil
      end
      delta = Time.httpdate(text) - Time.now
      delta.positive? ? delta : nil
    rescue ArgumentError
      nil
    end

    def multipart(form, boundary)
      out = +"".b
      form.each do |name, value|
        next if value.nil?

        out << "--#{boundary}\r\n".b
        if value.is_a?(FileUpload) || value.respond_to?(:read)
          file = FileUpload.wrap(value)
          out << "Content-Disposition: form-data; name=\"#{quote(name)}\"; filename=\"#{quote(file.filename)}\"\r\n".b
          out << "Content-Type: #{file.content_type}\r\n\r\n".b
          out << file.content
        else
          out << "Content-Disposition: form-data; name=\"#{quote(name)}\"\r\n\r\n".b
          out << scalar(value).b
        end
        out << "\r\n".b
      end
      out << "--#{boundary}--\r\n".b
      out
    end

    def quote(value)
      value.to_s.gsub("\\", "\\\\\\\\").gsub('"', '\\"').delete("\r\n")
    end
  end
end
