# frozen_string_literal: true

require_relative "test_helper"

# SDK JWT identity verification belirteci (ES256).
class TestIdentityToken < Minitest::Test
  def decode(part)
    Base64.urlsafe_decode64(part + ("=" * ((4 - (part.length % 4)) % 4)))
  end

  def test_baslik_talepler_ve_imza
    key = OpenSSL::PKey::EC.generate("prime256v1")
    token = Pushizo.identity_token(key.private_to_pem, kid: "main", app_id: "app_1", external_id: "kullanici-1", expires_in: 600, now: Time.at(1_800_000_000))
    header, payload, sig = token.split(".")
    assert_equal({ "alg" => "ES256", "typ" => "JWT", "kid" => "main" }, JSON.parse(decode(header)))
    assert_equal({ "sub" => "kullanici-1", "aud" => "app_1", "iat" => 1_800_000_000, "exp" => 1_800_000_600 }, JSON.parse(decode(payload)))
    raw = decode(sig)
    assert_equal 64, raw.bytesize
    der = OpenSSL::ASN1::Sequence.new([OpenSSL::ASN1::Integer.new(OpenSSL::BN.new(raw[0, 32], 2)), OpenSSL::ASN1::Integer.new(OpenSSL::BN.new(raw[32, 32], 2))]).to_der
    assert key.verify(OpenSSL::Digest.new("SHA256"), der, "#{header}.#{payload}")
  end

  def test_omur_siniri
    key = OpenSSL::PKey::EC.generate("prime256v1")
    assert_raises(ArgumentError) { Pushizo::IdentityToken.create(key.private_to_pem, kid: "k", app_id: "a", external_id: "e", expires_in: 90_000) }
  end
end
