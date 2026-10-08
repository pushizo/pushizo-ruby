# frozen_string_literal: true

module HeroSignal
  # API hata zarfından ({"error" => {"code", "message", "request_id", "details"}}) türetilen hata.
  # Ağ hatalarında (bağlantı, zaman aşımı) +status+ 0 ve +code+ "NETWORK" olur.
  class Error < StandardError
    # @return [Integer] HTTP durum kodu (ağ hatasında 0)
    attr_reader :status
    # @return [String] makine tarafından okunur hata kodu
    attr_reader :code
    # @return [String, nil] destek talepleri için istek kimliği
    attr_reader :request_id
    # @return [Hash, nil] alan bazlı ek bilgiler
    attr_reader :details

    def initialize(status, code, message, request_id: nil, details: nil)
      super(message)
      @status = status
      @code = code
      @request_id = request_id
      @details = details
    end

    # 429, 5xx veya ağ hatası: yeniden denenebilir.
    def retryable?
      status.zero? || status == 429 || status >= 500
    end

    def inspect
      suffix = request_id ? " request_id=#{request_id}" : ""
      "#<#{self.class.name} [#{status} #{code}] #{message}#{suffix}>"
    end
  end

  # Webhook imzası veya gövdesi geçersiz. +reason+: "missing_header", "malformed_header",
  # "timestamp_out_of_tolerance", "signature_mismatch" veya "malformed_body".
  class WebhookSignatureError < StandardError
    # @return [String]
    attr_reader :reason

    def initialize(reason)
      super("HeroSignal webhook imzası geçersiz: #{reason}")
      @reason = reason
    end
  end
end
