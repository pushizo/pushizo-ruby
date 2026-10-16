# frozen_string_literal: true

require_relative "lib/pushizo/version"

Gem::Specification.new do |spec|
  spec.name = "pushizo"
  spec.version = Pushizo::VERSION
  spec.authors = ["Pushizo"]
  spec.summary = "Pushizo sunucu SDK'sı"
  spec.description = "Pushizo public API istemcisi: bildirim gönderme, kullanıcı/abonelik yönetimi, " \
                     "segment/şablon/kampanya ve webhook imza doğrulaması (Net::HTTP, bağımlılıksız)."
  spec.homepage = "https://github.com/exec0de/pushizo/tree/main/sdk/ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"
  spec.files = Dir["lib/**/*.rb"] + ["README.md"]
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/exec0de/pushizo/tree/main/sdk/ruby"
  spec.metadata["bug_tracker_uri"] = "https://github.com/exec0de/pushizo/issues"
  spec.metadata["changelog_uri"] = "https://github.com/exec0de/pushizo/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://github.com/exec0de/pushizo/blob/main/docs/sdk/README.md"
end
