# frozen_string_literal: true

require "base64"
require "json"
require "openssl"

module Pushizo
  # SDK JWT identity verification belirteci (ES256; ADR-0023 §9): sub = external_id, aud = app_id, ömür en çok
  # 24 saat. Uygulamanız belirteci kendi sunucusundan alır ve istemci SDK'sının login(external_id, jwt) çağrısına verir.
  module IdentityToken
    MAX_LIFETIME_SECONDS = 86_400

    module_function

    def create(private_key_pem, kid:, app_id:, external_id:, expires_in: 3600, now: nil)
      raise ArgumentError, "expires_in 1…86400 aralığında olmalı" unless expires_in.is_a?(Integer) && expires_in.between?(1, MAX_LIFETIME_SECONDS)

      key = OpenSSL::PKey.read(private_key_pem)
      raise ArgumentError, "ES256 için P-256 EC özel anahtarı gerekli" unless key.is_a?(OpenSSL::PKey::EC) && key.group.curve_name == "prime256v1"

      iat = (now || Time.now).to_i
      header = b64url(JSON.generate({ alg: "ES256", typ: "JWT", kid: kid }))
      payload = b64url(JSON.generate({ sub: external_id, aud: app_id, iat: iat, exp: iat + expires_in }))
      signing_input = "#{header}.#{payload}"
      der = key.sign(OpenSSL::Digest.new("SHA256"), signing_input)
      # JWS ES256 imzası DER değil r||s (her biri 32 bayt).
      r, s = OpenSSL::ASN1.decode(der).value.map { |i| i.value.to_s(2).rjust(32, "\0".b) }
      "#{signing_input}.#{b64url(r + s)}"
    end

    def b64url(data)
      Base64.urlsafe_encode64(data, padding: false)
    end
  end

  # Kısayol: Pushizo.identity_token(pem, kid:, app_id:, external_id:).
  def self.identity_token(private_key_pem, **kwargs)
    IdentityToken.create(private_key_pem, **kwargs)
  end
end
