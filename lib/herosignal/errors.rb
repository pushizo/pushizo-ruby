# frozen_string_literal: true

module HeroSignal
  # API hata zarfındaki error.code değerleri (HS_ önekli katalog).
  module ErrorCode
    VALIDATION_ERROR = "HS_VALIDATION_ERROR"
    BAD_REQUEST = "HS_BAD_REQUEST"
    UNAUTHENTICATED = "HS_UNAUTHENTICATED"
    FORBIDDEN = "HS_FORBIDDEN"
    TENANT_MISMATCH = "HS_TENANT_MISMATCH"
    NOT_FOUND = "HS_NOT_FOUND"
    CONFLICT = "HS_CONFLICT"
    IDEMPOTENCY_CONFLICT = "HS_IDEMPOTENCY_CONFLICT"
    IDEMPOTENCY_IN_PROGRESS = "HS_IDEMPOTENCY_IN_PROGRESS"
    NO_RECIPIENTS = "HS_NO_RECIPIENTS"
    CHANNEL_NOT_CONFIGURED = "HS_CHANNEL_NOT_CONFIGURED"
    CONTENT_INVALID = "HS_CONTENT_INVALID"
    SUBSCRIPTION_INVALID = "HS_SUBSCRIPTION_INVALID"
    UNPROCESSABLE = "HS_UNPROCESSABLE"
    RATE_LIMITED = "HS_RATE_LIMITED"
    QUOTA_EXCEEDED = "HS_QUOTA_EXCEEDED"
    INTERNAL = "HS_INTERNAL"
    NOT_IMPLEMENTED = "HS_NOT_IMPLEMENTED"
    PROVIDER_UNAVAILABLE = "HS_PROVIDER_UNAVAILABLE"
    SERVICE_UNAVAILABLE = "HS_SERVICE_UNAVAILABLE"
    # İstemci tarafı: bağlantı kurulamadı veya zaman aşımı (status 0).
    NETWORK = "NETWORK"
  end

  # API hata zarfından ({"error": {"code", "message", "request_id", "details"}}) türetilen istisna.
  # HTTP durumuna göre alt sınıflar fırlatılır (NotFoundError, RateLimitError …).
  class Error < StandardError
    attr_reader :status, :code, :request_id, :details, :retry_after

    def initialize(status, code, message, request_id: nil, details: nil, retry_after: nil)
      super(message)
      @status = status
      @code = code
      @request_id = request_id
      @details = details
      @retry_after = retry_after
    end

    # 429, 5xx veya ağ hatası: yeniden denenebilir.
    def retryable?
      status.zero? || status == 429 || status >= 500
    end

    def to_s
      suffix = request_id ? " (request_id=#{request_id})" : ""
      "[#{status} #{code}] #{super}#{suffix}"
    end

    # HTTP durumuna karşılık gelen sınıf.
    def self.class_for(status)
      case status
      when 0 then NetworkError
      when 400, 422 then InvalidRequestError
      when 401 then AuthenticationError
      when 403 then PermissionDeniedError
      when 404 then NotFoundError
      when 409 then ConflictError
      when 429 then RateLimitError
      else status >= 500 ? ServerError : Error
      end
    end
  end

  # Bağlantı kurulamadı veya zaman aşımı (status 0).
  class NetworkError < Error; end
  # 400 / 422: istek doğrulanamadı veya işlenemedi (details alan hatalarını içerir).
  class InvalidRequestError < Error; end
  # 401: API anahtarı eksik veya geçersiz.
  class AuthenticationError < Error; end
  # 403: anahtarın kapsamı yetersiz, IP izin listesi dışı veya kaynak başka kiracıya ait.
  class PermissionDeniedError < Error; end
  # 404: kaynak bulunamadı.
  class NotFoundError < Error; end
  # 409: kaynak çakışması veya idempotency anahtarı çakışması.
  class ConflictError < Error; end
  # 429: hız sınırı veya plan kotası aşıldı.
  class RateLimitError < Error; end
  # 5xx: sunucu veya sağlayıcı geçici olarak kullanılamıyor.
  class ServerError < Error; end

  # Webhook imzası geçersiz. reason: missing_header, malformed_header, timestamp_out_of_tolerance,
  # signature_mismatch veya malformed_body.
  class WebhookSignatureError < StandardError
    attr_reader :reason

    def initialize(reason)
      super("HeroSignal webhook imzası geçersiz: #{reason}")
      @reason = reason
    end
  end
end
