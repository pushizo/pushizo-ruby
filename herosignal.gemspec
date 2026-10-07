# frozen_string_literal: true

require_relative "lib/herosignal/version"

Gem::Specification.new do |spec|
  spec.name = "herosignal"
  spec.version = HeroSignal::VERSION
  spec.authors = ["HeroSignal"]
  spec.summary = "HeroSignal sunucu SDK'sı"
  spec.description = "HeroSignal public API istemcisi: bildirim gönderme, kullanıcı/abonelik yönetimi, " \
                     "segment/şablon/kampanya ve webhook imza doğrulaması (Net::HTTP, bağımlılıksız)."
  spec.homepage = "https://herosignal.dev"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"
  spec.files = Dir["lib/**/*.rb"] + ["README.md"]
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
