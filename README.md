# herosignal (Ruby)

HeroSignal sunucu SDK'sı: bildirim gönderme, kullanıcı/abonelik yönetimi, segment/şablon/kampanya, analitik ve webhook imza doğrulaması. API anahtarı yalnızca sunucuda kullanılır.

## Kurulum
```
gem "herosignal"
```

## Kullanım
```ruby
hs = HeroSignal::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…")
hs.notifications.create(
  { target: { include_aliases: { external_id: ["u1"] } }, contents: { en: "Shipped" } },
  idempotency_key: "order-42"
)
```

- Kimlik doğrulama (Bearer API anahtarı), zaman aşımı, 429/5xx/ağ hatalarında üstel geri çekilmeli yeniden deneme (`Retry-After`'a uyar), otomatik `Idempotency-Key`, hata tipi (status, code, message, request_id), cursor sayfalama ve `HeroSignal-Signature` webhook doğrulaması (sabit zamanlı, tolerans, secret rotasyonu).
- Kaynaklar ve modeller `api/openapi.yaml`'dan `node sdk/scripts/generate-server-sdks.mjs` ile üretilir; üretilmiş dosyaları elle düzenlemeyin.

Ayrıntılı rehber: [docs/sdk/ruby.md](../../docs/sdk/ruby.md)

## Test
```
bundle install && bundle exec rake test
```
