# frozen_string_literal: true

require "json"
require "openssl"

module HeroSignal
  # Giden webhook imza doğrulaması (alıcı tarafı).
  #
  # Başlık: "HeroSignal-Signature: t=<unix>,v1=<hex>"; v1 = HMAC-SHA256(secret, "#{t}.#{ham_gövde}").
  # Secret rotasyonunda başlıkta iki v1 bulunabilir; herhangi biri eşleşirse imza geçerlidir. Karşılaştırma sabit
  # zamanlıdır.
  #
  #   # Rails: payload = request.raw_post (HAM gövde; JSON'u yeniden serileştirmeyin)
  #   events = HeroSignal::Webhook.construct_events(
  #     payload: request.raw_post,
  #     header: request.headers[HeroSignal::Webhook::SIGNATURE_HEADER],
  #     secret: ENV.fetch("HS_WEBHOOK_SECRET")
  #   )
  module Webhook
    SIGNATURE_HEADER = "HeroSignal-Signature"
    # Olay kimliği başlığı; tekrar gönderimleri ayıklamak için kullanın.
    EVENT_ID_HEADER = "HeroSignal-Event-Id"
    # Varsayılan zaman damgası toleransı (sn); daha eski t tekrar (replay) sayılır.
    DEFAULT_TOLERANCE_SECONDS = 300

    # Doğrulama sonucu. ok ise timestamp, değilse reason doludur.
    Result = Struct.new(:ok, :timestamp, :reason, keyword_init: true) do
      alias_method :ok?, :ok
    end

    module_function

    # @param payload [String] HAM istek gövdesi
    # @param header [String, Array<String>, nil] HeroSignal-Signature değeri
    # @param secret [String, Array<String>] endpoint secret'ı; rotasyonda eski ve yeni
    # @param tolerance [Integer] sn
    # @param now [Integer, Time, nil] test için şimdiki zaman
    # @return [Result]
    def verify_signature(payload:, header:, secret:, tolerance: DEFAULT_TOLERANCE_SECONDS, now: nil)
      raw = header.is_a?(Array) ? header.first : header
      return Result.new(ok: false, reason: "missing_header") if raw.nil? || raw.to_s.empty?

      timestamp = nil
      signatures = []
      raw.to_s.split(",").each do |part|
        idx = part.index("=")
        next if idx.nil? || idx.zero?

        key = part[0...idx].strip
        value = part[(idx + 1)..].strip
        if key == "t" && value.match?(/\A[0-9]+\z/)
          timestamp = value.to_i
        elsif key == "v1" && value.match?(/\A[0-9a-f]{64}\z/)
          signatures << [value].pack("H*")
        end
      end
      return Result.new(ok: false, reason: "malformed_header") if timestamp.nil? || signatures.empty?

      current = now.nil? ? Time.now.to_i : now.to_i
      return Result.new(ok: false, reason: "timestamp_out_of_tolerance") if (current - timestamp).abs > tolerance

      body = payload.to_s.b
      Array(secret).each do |s|
        expected = OpenSSL::HMAC.digest("SHA256", s.to_s, "#{timestamp}.".b + body)
        return Result.new(ok: true, timestamp: timestamp) if signatures.any? { |sig| secure_compare(sig, expected) }
      end
      Result.new(ok: false, reason: "signature_mismatch")
    end

    # İmzayı doğrular ve gövdeyi olay listesine çevirir (tekil gövde veya {"events" => [...]} batch).
    # @return [Array<Hash>]
    # @raise [HeroSignal::WebhookSignatureError]
    def construct_events(payload:, header:, secret:, tolerance: DEFAULT_TOLERANCE_SECONDS, now: nil)
      result = verify_signature(payload: payload, header: header, secret: secret, tolerance: tolerance, now: now)
      raise WebhookSignatureError, result.reason unless result.ok

      begin
        body = JSON.parse(payload.to_s.dup.force_encoding(Encoding::UTF_8))
      rescue JSON::ParserError
        raise WebhookSignatureError, "malformed_body"
      end
      raise WebhookSignatureError, "malformed_body" unless body.is_a?(Hash)

      body["events"].is_a?(Array) ? body["events"] : [body]
    end

    # Sabit zamanlı bayt karşılaştırması.
    def secure_compare(a, b)
      return false unless a.bytesize == b.bytesize

      if OpenSSL.respond_to?(:fixed_length_secure_compare)
        OpenSSL.fixed_length_secure_compare(a, b)
      else
        result = 0
        a.bytes.zip(b.bytes) { |x, y| result |= x ^ y }
        result.zero?
      end
    end
  end
end
