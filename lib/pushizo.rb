# frozen_string_literal: true

# Pushizo Ruby sunucu SDK'sı (Net::HTTP, bağımlılıksız).
#
#   hs = Pushizo::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…")
#   hs.notifications.create(
#     { target: { include_aliases: { external_id: [user_id] } }, contents: { en: "Shipped" } },
#     idempotency_key: "order-#{order_id}"
#   )
require_relative "pushizo/version"
require_relative "pushizo/errors"
require_relative "pushizo/model"
require_relative "pushizo/file_upload"
require_relative "pushizo/generated/models"
require_relative "pushizo/base_resource"
require_relative "pushizo/generated/resources"
require_relative "pushizo/transport"
require_relative "pushizo/client"
require_relative "pushizo/webhook"
require_relative "pushizo/identity_token"

module Pushizo
  # SDK identity verification için identity_hash = HMAC-SHA256(sdk_secret, external_id) (hex).
  def self.identity_hash(sdk_secret, external_id)
    OpenSSL::HMAC.hexdigest("SHA256", sdk_secret, external_id.to_s)
  end
end
