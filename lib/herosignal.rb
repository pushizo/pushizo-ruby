# frozen_string_literal: true

# HeroSignal Ruby sunucu SDK'sı (Net::HTTP, bağımlılıksız).
#
#   hs = HeroSignal::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…")
#   hs.notifications.create(
#     { target: { include_aliases: { external_id: [user_id] } }, contents: { en: "Shipped" } },
#     idempotency_key: "order-#{order_id}"
#   )
require_relative "herosignal/version"
require_relative "herosignal/errors"
require_relative "herosignal/model"
require_relative "herosignal/file_upload"
require_relative "herosignal/generated/models"
require_relative "herosignal/base_resource"
require_relative "herosignal/generated/resources"
require_relative "herosignal/transport"
require_relative "herosignal/client"
require_relative "herosignal/webhook"

module HeroSignal
  # SDK identity verification için identity_hash = HMAC-SHA256(sdk_secret, external_id) (hex).
  def self.identity_hash(sdk_secret, external_id)
    OpenSSL::HMAC.hexdigest("SHA256", sdk_secret, external_id.to_s)
  end
end
