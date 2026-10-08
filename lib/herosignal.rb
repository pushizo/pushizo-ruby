# frozen_string_literal: true

# HeroSignal Ruby sunucu SDK'sı.
#
#   require "herosignal"
#
#   hs = HeroSignal::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…")
#   hs.notifications.create(
#     { target: { include_aliases: { external_id: ["u1"] } }, contents: { en: "Shipped" } },
#     idempotency_key: "order-42"
#   )
require_relative "herosignal/version"
require_relative "herosignal/errors"
require_relative "herosignal/transport"
require_relative "herosignal/generated/resources"
require_relative "herosignal/client"
require_relative "herosignal/webhook"
