# Pushizo Ruby SDK

Pushizo public API'si için Ruby sunucu SDK'sı (Ruby 3.0+, `Net::HTTP`; çalışma zamanı bağımlılığı yok).
Modeller ve kaynak metotları `api/openapi.yaml`'dan üretilir (`lib/pushizo/generated/`); kimlik doğrulama,
yeniden deneme, idempotency, sayfalama ve webhook imza doğrulaması el yazımıdır.

## Kurulum

```ruby
# Gemfile
gem "pushizo"
```

## Kullanım

```ruby
require "pushizo"

hs = Pushizo::Client.new(api_key: ENV.fetch("HS_API_KEY"), app_id: "app_…") # yerelde base_url: "http://localhost:4000"

# Bildirim gönder: Idempotency-Key verilmezse otomatik UUID (yeniden denemelerde aynı anahtar)
res = hs.notifications.create(
  {
    target: { include_aliases: { external_id: ["user-42"] } },
    contents: { en: "Your order shipped", tr: "Siparişiniz kargoya verildi" }
  },
  idempotency_key: "order-1001"
)
puts res.id, res.status

# Kullanıcı oluştur/güncelle (Hash veya model nesnesi kabul edilir)
hs.users.upsert(Pushizo::Models::UpsertUserDto.new(external_id: "user-42", tags: { plan: "pro" }))

# Cursor sayfalama: Enumerator, sayfalar tembel yüklenir
hs.segments.list_all(limit: 100).each { |segment| puts segment.name }

# Başka bir app için tek çağrı
hs.apps.get(app_id: "app_diger")

# SDK identity verification
identity_hash = Pushizo.identity_hash(ENV.fetch("HS_SDK_SECRET"), "user-42")
```

Yanıtlar `Pushizo::Models::*` nesneleridir: alanlara snake_case metotla (`msg.status`) veya `msg["status"]` ile
erişilir, `to_h` JSON adlarıyla ham hash döner, bilinmeyen alanlar korunur. Ruby'nin `Object#send` yöntemiyle
çakışmaması için `events.send` → `send_events`, `campaigns.send` → `send_campaign` olarak adlandırılmıştır.
SDK'da metodu olmayan uçlar veya JSON dışı yanıtlar için
`hs.request(:get, "/v1/apps/{appId}/analytics/messages", query: { format: "csv" })` kullanılabilir.

### Ayarlar

| Parametre | Varsayılan | Açıklama |
|-----------|------------|----------|
| `api_key:` | — | `hs_live_…` API anahtarı (Bearer) |
| `app_id:` | `nil` | Çağrıda `app_id:` verilmezse kullanılan app |
| `base_url:` | `https://api.pushizo.com` | API adresi |
| `timeout:` | `30` | Deneme başına zaman aşımı (sn) |
| `max_retries:` | `3` | En fazla yeniden deneme (politika: aşağıda) |
| `auto_idempotency_key:` | `true` | `Idempotency-Key` destekleyen çağrılarda otomatik UUID |
| `transport:` | `NetHttpTransport` | Özel taşıma (`#call(method, url, headers, body, timeout)`) |

Her çağrı `request_options: { timeout: 5, max_retries: 0, headers: { … } }` ile ayrıca ayarlanabilir.

### Hatalar

429 her metotta; 5xx ve ağ hataları GET/HEAD/OPTIONS/PUT/DELETE'te, POST/PATCH'te yalnızca `Idempotency-Key` varsa (otomatik anahtar dahil) veya istek sunucuya hiç gönderilemediyse (bağlantı reddi, DNS hatası, bağlantı zaman aşımı) üstel geri çekilmeyle (0,3 / 1 / 3 sn) yeniden denenir; `Retry-After` başlığına uyulur.
Kalıcı hatalar `Pushizo::Error` alt sınıflarıdır ve `status`, `code` (`HS_…`), `request_id`, `details` taşır:

```ruby
begin
  hs.notifications.get("msg_yok")
rescue Pushizo::NotFoundError
  # 404
rescue Pushizo::InvalidRequestError => e
  # 400/422 — e.code == Pushizo::ErrorCode::NO_RECIPIENTS
rescue Pushizo::Error => e
  # AuthenticationError, PermissionDeniedError, ConflictError, RateLimitError, ServerError, NetworkError
  warn "#{e.status} #{e.code} #{e.message}"
end
```

## Webhook imza doğrulaması

```ruby
# Rails
class PushizoWebhooksController < ActionController::API
  def create
    events = Pushizo::Webhook.construct_events(
      request.raw_post,                               # ham gövde
      request.headers["Pushizo-Signature"],
      ENV.fetch("HS_WEBHOOK_SECRET")                  # rotasyonda [eski, yeni] verilebilir
    )
    events.each { |event| } # tekil veya batch; event["id"] ile tekrarları ayıklayın
    head :no_content
  rescue Pushizo::WebhookSignatureError => e
    render plain: e.reason, status: :bad_request
  end
end
```

Zaman damgası 5 dakikadan eskiyse (`tolerance:`) istek tekrar (replay) sayılır. Yalnızca doğrulama için
`Pushizo::Webhook.verify_signature(...)` `ok?`, `timestamp`, `reason` döner.

## Geliştirme

```bash
rake test        # veya: ruby -Ilib -Itest -e 'Dir["test/test_*.rb"].each { |f| require_relative f }'
node sdk/scripts/generate-server-sdks.mjs --lang ruby    # depo kökünde; generated/ yenilenir
```

`lib/pushizo/generated/` elle düzenlenmez. Webhook testleri `sdk/testdata/webhook-signature-vectors.json`
ortak vektörlerini kullanır.
