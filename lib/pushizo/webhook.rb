# frozen_string_literal: true

require "json"
require "openssl"

module Pushizo
  # Giden webhook imza doğrulaması (alıcı tarafı).
  #
  # Başlık: Pushizo-Signature: t=<unix>,v1=<hex> — v1 = HMAC-SHA256(secret, "#{t}.#{ham_gövde}").
  # Secret rotasyonunda başlıkta iki v1 bulunabilir; herhangi biri eşleşirse imza geçerlidir.
  #
  #   payload = request.body.read                       # ham gövde (JSON.parse etmeden)
  #   header = request.get_header("HTTP_PUSHIZO_SIGNATURE")
  #   events = Pushizo::Webhook.construct_events(payload, header, ENV.fetch("HS_WEBHOOK_SECRET"))
  #   # Pushizo-Event-Id ile tekrarları ayıklayın; 2xx ile hızlı yanıt verin.
  module Webhook
    SIGNATURE_HEADER = "Pushizo-Signature"
    EVENT_ID_HEADER = "Pushizo-Event-Id"
    # Varsayılan zaman damgası toleransı (sn); daha eski t tekrar (replay) sayılır.
    DEFAULT_TOLERANCE = 300

    # Doğrulama sonucu: ok? ise timestamp, değilse reason doludur.
    Result = Struct.new(:ok, :timestamp, :reason) do
      def ok?
        ok
      end
    end

    module_function

    # İmzayı doğrular. payload HAM istek gövdesidir; secret tek değer veya dizi (rotasyon) olabilir.
    # now test için Unix zamanıdır (sn). Karşılaştırma sabit zamanlıdır.
    def verify_signature(payload, header, secret, tolerance: DEFAULT_TOLERANCE, now: nil)
      raw = header.is_a?(Array) ? header.first : header
      return Result.new(false, nil, "missing_header") if raw.nil? || raw.to_s.empty?

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
      return Result.new(false, nil, "malformed_header") if timestamp.nil? || signatures.empty?

      current = (now || Time.now.to_i).to_i
      return Result.new(false, nil, "timestamp_out_of_tolerance") if (current - timestamp).abs > tolerance

      body = payload.to_s.b
      Array(secret).each do |s|
        expected = OpenSSL::HMAC.digest("SHA256", s.to_s, "#{timestamp}.".b + body)
        return Result.new(true, timestamp, nil) if signatures.any? { |sig| secure_compare(sig, expected) }
      end
      Result.new(false, nil, "signature_mismatch")
    end

    # İmzayı doğrular ve gövdeyi olay listesine (Hash dizisi) çevirir: tekil gövde veya {"events": [...]} batch.
    # Geçersiz imzada WebhookSignatureError fırlatır.
    def construct_events(payload, header, secret, tolerance: DEFAULT_TOLERANCE, now: nil)
      result = verify_signature(payload, header, secret, tolerance: tolerance, now: now)
      raise WebhookSignatureError, result.reason unless result.ok?

      body = begin
        JSON.parse(payload.to_s)
      rescue JSON::ParserError
        raise WebhookSignatureError, "malformed_body"
      end
      raise WebhookSignatureError, "malformed_body" unless body.is_a?(Hash)

      body["events"].is_a?(Array) ? body["events"] : [body]
    end

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
