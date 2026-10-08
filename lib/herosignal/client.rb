# frozen_string_literal: true

require "json"
require "openssl"
require "securerandom"
require "time"
require "uri"

module HeroSignal
  # HeroSignal sunucu SDK istemcisi.
  #
  # Kaynaklar (+notifications+, +users+, +segments+, +templates+, +campaigns+ …) api/openapi.yaml'dan üretilir;
  # HTTP katmanı (kimlik doğrulama, yeniden deneme, idempotency, hata eşleme, sayfalama) el yazımıdır.
  # Yanıtlar JSON'dan çözülmüş Hash/Array'dir (anahtarlar String).
  class Client
    DEFAULT_BASE_URL = "https://api.herosignal.dev"
    DEFAULT_TIMEOUT = 30
    DEFAULT_MAX_RETRIES = 3
    # Retry-After yoksa denemeler arası bekleme (sn; Node/PHP/Python/Go/Java/.NET ile aynı).
    BACKOFF_SECONDS = [0.3, 1.0, 3.0].freeze

    attr_reader :api_key, :app_id, :base_url, :timeout, :max_retries, :auto_idempotency_key, :user_agent

    Generated::RESOURCES.each_key { |name| attr_reader name }

    # @param api_key [String] +hs_live_…+ API anahtarı (Bearer)
    # @param app_id [String, nil] çağrılarda +app_id+ verilmezse kullanılacak varsayılan app
    # @param base_url [String] API adresi; yerel geliştirmede "http://localhost:4000"
    # @param timeout [Numeric] deneme başına zaman aşımı (sn)
    # @param max_retries [Integer] 429/5xx ve ağ hatalarında en fazla yeniden deneme
    # @param auto_idempotency_key [Boolean] Idempotency-Key destekleyen çağrılarda anahtar yoksa UUID üret
    # @param user_agent [String, nil] User-Agent başlığı
    # @param transport [#call, nil] özel HTTP taşıyıcısı (bkz. NetHttpTransport)
    # @param sleeper [#call] yeniden deneme beklemesi (testlerde değiştirilebilir)
    # @param clock [#call] şimdiki zaman (Retry-After tarihleri için)
    def initialize(api_key:, app_id: nil, base_url: DEFAULT_BASE_URL, timeout: DEFAULT_TIMEOUT,
                   max_retries: DEFAULT_MAX_RETRIES, auto_idempotency_key: true, user_agent: nil,
                   transport: nil, sleeper: ->(seconds) { sleep(seconds) }, clock: -> { Time.now })
      raise ArgumentError, "HeroSignal: api_key gerekli." if api_key.nil? || api_key.to_s.empty?

      @api_key = api_key.to_s
      @app_id = app_id
      @base_url = base_url.to_s.sub(%r{/+\z}, "")
      @timeout = timeout
      @max_retries = max_retries
      @auto_idempotency_key = auto_idempotency_key
      @user_agent = user_agent || "herosignal-ruby/#{VERSION}"
      @transport = transport || NetHttpTransport.new
      @sleeper = sleeper
      @clock = clock
      Generated::RESOURCES.each { |name, klass| instance_variable_set(:"@#{name}", klass.new(self)) }
    end

    # SDK identity verification için identity_hash = HMAC-SHA256(sdk_secret, external_id) (hex).
    def self.identity_hash(sdk_secret, external_id)
      OpenSSL::HMAC.hexdigest("SHA256", sdk_secret.to_s, external_id.to_s)
    end

    # Düşük seviyeli istek (SDK'da henüz metodu olmayan uçlar veya format=csv gibi JSON dışı yanıtlar için).
    # JSON yanıtlar çözülür, diğer içerik tipleri String döner; boş gövdede nil.
    def request(method, path, query: nil, body: nil, request_options: nil)
      send_request(method.to_s.upcase, path, query_pairs(query || {}), body, nil, nil, nil, request_options || {})
    end

    # Üretilmiş kaynakların kullandığı iç API (doğrudan çağırmayın).
    # @api private
    def _call(method, path, path_params:, query: nil, body: nil, form: nil, files: nil, app_id: nil,
              path_app_id: false, query_app_id: false, body_app_id: false, idempotent: false,
              idempotency_key: nil, request_options: nil)
      opts = request_options || {}
      url_path = path.dup
      url_path = url_path.gsub("{appId}", escape_path(resolve_app_id(app_id))) if path_app_id
      path_params.each do |name, value|
        raise ArgumentError, "HeroSignal: '#{name}' yol parametresi boş olamaz." if value.nil? || value.to_s.empty?

        url_path = url_path.gsub("{#{name}}", escape_path(value.to_s))
      end

      pairs = []
      pairs << ["app_id", resolve_app_id(app_id)] if query_app_id
      pairs.concat(query_pairs(query || {}))

      if body_app_id && body.is_a?(Hash) && blank?(fetch_key(body, "app_id"))
        body = body.merge("app_id" => resolve_app_id(app_id))
      end

      key = idempotency_key || opts[:idempotency_key]
      key = fetch_key(body, "idempotency_key") if blank?(key) && body.is_a?(Hash) && fetch_key(body, "idempotency_key").is_a?(String)
      key = SecureRandom.uuid if blank?(key) && idempotent && auto_idempotency_key

      send_request(method, url_path, pairs, body, form, files, key, opts)
    end

    # +data+ / +next_cursor+ / +has_more+ zarfını sayfa sayfa dolaşan tembel Enumerator.
    # @api private
    def _paginate(cursor, &fetch)
      Enumerator.new do |yielder|
        next_cursor = cursor
        loop do
          page = fetch.call(next_cursor) || {}
          (page["data"] || []).each { |item| yielder << item }
          next_cursor = page["next_cursor"]
          break if !page["has_more"] || blank?(next_cursor)
        end
      end
    end

    private

    def resolve_app_id(app_id)
      resolved = blank?(app_id) ? @app_id : app_id
      raise ArgumentError, "HeroSignal: app_id verilmedi (istemci seçeneği veya çağrı parametresi)." if blank?(resolved)

      resolved.to_s
    end

    def blank?(value)
      value.nil? || (value.respond_to?(:empty?) && value.empty?)
    end

    def fetch_key(hash, key)
      return nil unless hash.is_a?(Hash)

      hash.key?(key) ? hash[key] : hash[key.to_sym]
    end

    def escape_path(value)
      URI.encode_www_form_component(value).gsub("+", "%20")
    end

    # Sorgu değerleri: nil atlanır, diziler tekrarlanan anahtar, bool "true"/"false", karmaşık değerler JSON.
    def query_pairs(query)
      query.each_with_object([]) do |(key, value), out|
        next if value.nil?

        values = value.is_a?(Array) ? value : [value]
        values.each { |v| out << [key.to_s, scalar(v)] unless v.nil? }
      end
    end

    def scalar(value)
      case value
      when String then value
      when Symbol, Integer, Float, TrueClass, FalseClass then value.to_s
      else JSON.generate(value)
      end
    end

    def send_request(method, path, pairs, body, form, files, idempotency_key, opts)
      headers = {
        "Authorization" => "Bearer #{@api_key}",
        "Accept" => "application/json",
        "User-Agent" => @user_agent,
      }
      payload = nil
      if files
        boundary = "----herosignal#{SecureRandom.hex(16)}"
        payload = encode_multipart(form || {}, files, boundary)
        headers["Content-Type"] = "multipart/form-data; boundary=#{boundary}"
      elsif !body.nil?
        payload = JSON.generate(body)
        headers["Content-Type"] = "application/json"
      end
      headers["Idempotency-Key"] = idempotency_key.to_s unless blank?(idempotency_key)
      (opts[:headers] || {}).each { |k, v| headers[k.to_s] = v.to_s }

      query = pairs.empty? ? "" : "?#{URI.encode_www_form(pairs)}"
      uri = URI.parse("#{@base_url}#{path}#{query}")
      timeout = opts.fetch(:timeout, @timeout)
      max_retries = opts.fetch(:max_retries, @max_retries)
      attempt = 0
      loop do
        response_headers = nil
        begin
          status, response_headers, response_body = @transport.call(method, uri, headers, payload, timeout)
          return parse_body(response_headers, response_body) if status >= 200 && status < 300

          error = error_from(status, response_headers, response_body)
        rescue NetHttpTransport::NetworkError => e
          error = Error.new(0, "NETWORK", e.message)
        end
        raise error if !error.retryable? || attempt >= max_retries

        @sleeper.call(retry_delay(response_headers, attempt))
        attempt += 1
      end
    end

    def parse_body(headers, body)
      return nil if body.nil? || body.empty?

      content_type = headers["content-type"].to_s
      return JSON.parse(body) if content_type.empty? || content_type.include?("json")

      body
    end

    def error_from(status, headers, body)
      envelope = {}
      begin
        parsed = JSON.parse(body.to_s)
        envelope = parsed["error"] if parsed.is_a?(Hash) && parsed["error"].is_a?(Hash)
      rescue JSON::ParserError
        envelope = {}
      end
      details = envelope["details"]
      Error.new(
        status,
        blank?(envelope["code"]) ? "HTTP_#{status}" : envelope["code"].to_s,
        blank?(envelope["message"]) ? "HTTP #{status}" : envelope["message"].to_s,
        request_id: blank?(envelope["request_id"]) ? headers["x-request-id"] : envelope["request_id"],
        details: details.is_a?(Hash) ? details : nil
      )
    end

    # Retry-After (saniye veya HTTP tarihi) varsa ona uyar; yoksa 0.3 / 1 / 3 sn.
    def retry_delay(headers, attempt)
      header = headers && headers["retry-after"].to_s.strip
      if header && !header.empty?
        if header.match?(/\A\d+(\.\d+)?\z/)
          seconds = header.to_f
          return seconds if seconds.positive?
        else
          begin
            delta = Time.httpdate(header) - @clock.call
            return delta if delta.positive?
          rescue ArgumentError
            # Geçersiz tarih: varsayılan geri çekilme kullanılır.
            nil
          end
        end
      end
      BACKOFF_SECONDS[[attempt, BACKOFF_SECONDS.length - 1].min]
    end

    def encode_multipart(form, files, boundary)
      out = +""
      out.force_encoding(Encoding::BINARY)
      form.each do |name, value|
        next if value.nil?

        out << "--#{boundary}\r\nContent-Disposition: form-data; name=\"#{quote(name)}\"\r\n\r\n".b
        out << scalar(value).to_s.b << "\r\n".b
      end
      files.each do |name, value|
        next if value.nil?

        filename, content, content_type = normalize_file(value)
        out << "--#{boundary}\r\nContent-Disposition: form-data; name=\"#{quote(name)}\"; filename=\"#{quote(filename)}\"\r\n".b
        out << "Content-Type: #{content_type}\r\n\r\n".b
        out << content.b << "\r\n".b
      end
      out << "--#{boundary}--\r\n".b
      out
    end

    def quote(text)
      text.to_s.gsub("\\", "\\\\\\\\").gsub('"', '\\"').delete("\r\n")
    end

    # Dosya girdisi: IO, String (içerik), [ad, içerik] veya [ad, içerik, içerik_tipi]. Akış bir kez okunur ki yeniden
    # denemeler aynı içeriği göndersin.
    def normalize_file(value)
      filename = nil
      content_type = nil
      raw = value
      if value.is_a?(Array)
        filename, raw, content_type = value
      end
      if raw.respond_to?(:read)
        filename ||= File.basename(raw.path) if raw.respond_to?(:path) && raw.path
        raw = raw.read
      end
      filename ||= "upload"
      content_type ||= filename.to_s.downcase.end_with?(".csv") ? "text/csv" : "application/octet-stream"
      [filename.to_s, raw.to_s, content_type]
    end
  end
end
