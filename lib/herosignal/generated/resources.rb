# Bu dosya api/openapi.yaml'dan sdk/scripts/generate-server-sdks.mjs ile üretilmiştir; elle düzenlemeyin.
# frozen_string_literal: true

module HeroSignal
  # API kaynakları; her metot bir OpenAPI işlemine karşılık gelir.
  module Resources
    # Bildirim gönderme, durum, iptal, teslimatlar ve geçmiş dışa aktarımı.
    class Notifications < HeroSignal::BaseResource
      # Bildirim oluştur (202, asenkron teslimat)
      #
      # POST /v1/notifications
      #
      # Idempotency-Key: idempotency_key:, gövdedeki idempotency_key veya otomatik UUID.
      def create(body, app_id: nil, idempotency_key: nil, request_options: nil)
        @client.call(
          :post, "/v1/notifications",
          path_params: {},
          body: body,
          app_id: app_id,
          body_app_id: true,
          idempotent: true,
          idempotency_key: idempotency_key,
          response: "CreateNotificationResult",
          request_options: request_options
        )
      end

      # Mesaj listesi (app_id zorunlu)
      #
      # GET /v1/notifications
      #
      # @param source Değerler: "campaign", "api", "journey", "test".
      # @param kind Değerler: "campaign", "api", "journey", "test".
      # @param status Değerler: "queued", "processing", "completed", "cancelled", "failed".
      # @param sort Değerler: "created_at", "-created_at".
      def list(limit: nil, cursor: nil, source: nil, kind: nil, status: nil, sort: nil, label: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/notifications",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "source" => source, "kind" => kind, "status" => status, "sort" => sort, "label" => label },
          app_id: app_id,
          query_app_id: true,
          response: "MessageList",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, source: nil, kind: nil, status: nil, sort: nil, label: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, source: source, kind: kind, status: status, sort: sort, label: label, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Kaydedilmemiş hedef için alıcı sayısı (gönderim yapmaz)
      #
      # POST /v1/notifications/estimate
      def estimate(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/notifications/estimate",
          path_params: {},
          body: body,
          app_id: app_id,
          body_app_id: true,
          response: "EstimateAudienceResult",
          request_options: request_options
        )
      end

      # Mesaj durumu ve sayaçları
      #
      # GET /v1/notifications/{messageId}
      def get(message_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/notifications/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          response: "Message",
          request_options: request_options
        )
      end

      # Zamanlanmış/kuyruktaki mesajı iptal et
      #
      # DELETE /v1/notifications/{messageId}
      def cancel(message_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/notifications/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          response: "Message",
          request_options: request_options
        )
      end

      # Abone bazlı teslimat sonuçları (cursor)
      #
      # GET /v1/notifications/{messageId}/deliveries
      #
      # @param status Değerler: "pending", "sent", "delivered", "failed", "bounced", "suppressed", "expired", "cancelled".
      def deliveries(message_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/notifications/{messageId}/deliveries",
          path_params: { "messageId" => message_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          query_app_id: true,
          response: "DeliveryList",
          request_options: request_options
        )
      end

      # deliveries sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def deliveries_all(message_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          deliveries(message_id, limit: limit, status: status, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Bildirim geçmişi CSV işi (teslimatlar; tamamlanınca download_url)
      #
      # GET /v1/notifications/{messageId}/history
      def history(message_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/notifications/{messageId}/history",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          response: "Export",
          request_options: request_options
        )
      end

      # Mesaj olay CSV işi (gönderildi/teslim/açıldı/tıklandı/bounce…; tamamlanınca download_url)
      #
      # POST /v1/notifications/{messageId}/export_events
      def export_events(message_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/notifications/{messageId}/export_events",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          response: "Export",
          request_options: request_options
        )
      end
    end

    # Kullanıcı oluşturma/güncelleme (tag, özellik), arama ve abonelik ekleme.
    class Users < HeroSignal::BaseResource
      # Kullanıcı listesi
      #
      # GET /v1/apps/{appId}/users
      #
      # @param sort Değerler: "last_active_at", "-last_active_at".
      def list(limit: nil, cursor: nil, sort: nil, q: nil, tag: nil, last_active_after: nil, last_active_before: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "sort" => sort, "q" => q, "tag" => tag, "last_active_after" => last_active_after, "last_active_before" => last_active_before },
          app_id: app_id,
          response: "UserList",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, sort: nil, q: nil, tag: nil, last_active_after: nil, last_active_before: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, sort: sort, q: q, tag: tag, last_active_after: last_active_after, last_active_before: last_active_before, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Kullanıcı oluştur/güncelle (external_id ile, isteğe bağlı aboneliklerle)
      #
      # POST /v1/apps/{appId}/users
      #
      # Idempotency-Key: idempotency_key:, gövdedeki idempotency_key veya otomatik UUID.
      def upsert(body, app_id: nil, idempotency_key: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/users",
          path_params: {},
          body: body,
          app_id: app_id,
          idempotent: true,
          idempotency_key: idempotency_key,
          response: "UserDetail",
          request_options: request_options
        )
      end

      # Segment tanımı ile kullanıcı arama
      #
      # POST /v1/apps/{appId}/users/search
      def search(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/users/search",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "UserList",
          request_options: request_options
        )
      end

      # Alias ile kullanıcı (hs_id, external_id veya özel etiket)
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}
      def get_by_alias(label, value, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "UserDetail",
          request_options: request_options
        )
      end

      # Tag/property merge-patch ve deltas
      #
      # PATCH /v1/apps/{appId}/users/by/{label}/{value}
      def update(label, value, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          response: "UserDetail",
          request_options: request_options
        )
      end

      # Kullanıcıyı sil (abonelikler silinir, olaylar anonimleşir)
      #
      # DELETE /v1/apps/{appId}/users/by/{label}/{value}
      def delete(label, value, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Kullanıcının tüm kimlikleri (hs_id, external_id, özel alias'lar)
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}/identity
      def get_identity(label, value, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}/identity",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "UserIdentity",
          request_options: request_options
        )
      end

      # Kullanıcı verisini dışa aktar (KVKK/GDPR taşınabilirlik): profil, alias, abonelik, son olaylar
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}/export
      def export(label, value, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}/export",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "UserExport",
          request_options: request_options
        )
      end

      # Kullanıcıya abonelik ekle
      #
      # POST /v1/apps/{appId}/users/by/{label}/{value}/subscriptions
      def add_subscription(label, value, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/users/by/{label}/{value}/subscriptions",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          response: "Subscription",
          request_options: request_options
        )
      end
    end

    # Kullanıcı kimlikleri (alias): ekleme ve kaldırma.
    class Aliases < HeroSignal::BaseResource
      # Alias ekle
      #
      # PATCH /v1/apps/{appId}/users/by/{label}/{value}/identity
      def add(label, value, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/users/by/{label}/{value}/identity",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          response: "UserDetail",
          request_options: request_options
        )
      end

      # Alias kaldır
      #
      # DELETE /v1/apps/{appId}/users/by/{label}/{value}/identity/{aliasLabel}
      def delete(label, value, alias_label, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/users/by/{label}/{value}/identity/{aliasLabel}",
          path_params: { "label" => label, "value" => value, "aliasLabel" => alias_label },
          app_id: app_id,
          response: "UserDetail",
          request_options: request_options
        )
      end
    end

    # Abonelik (cihaz/e-posta/SMS) okuma, güncelleme, silme ve sahip atama.
    class Subscriptions < HeroSignal::BaseResource
      # Abonelik detayı
      #
      # GET /v1/apps/{appId}/subscriptions/{subscriptionId}
      def get(subscription_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          response: "Subscription",
          request_options: request_options
        )
      end

      # Abonelik güncelle
      #
      # PATCH /v1/apps/{appId}/subscriptions/{subscriptionId}
      def update(subscription_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          body: body,
          app_id: app_id,
          response: "Subscription",
          request_options: request_options
        )
      end

      # Aboneliği sil
      #
      # DELETE /v1/apps/{appId}/subscriptions/{subscriptionId}
      def delete(subscription_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Aboneliğin sahibi kullanıcının kimlikleri
      #
      # GET /v1/apps/{appId}/subscriptions/{subscriptionId}/user/identity
      def get_user_identity(subscription_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/subscriptions/{subscriptionId}/user/identity",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          response: "UserIdentity",
          request_options: request_options
        )
      end

      # Token ile abonelik güncelle (token_type: ios_push, android_push, web_push, email, sms veya eski sağlayıcı adları iOSPush, AndroidPush, ChromePush, FirefoxPush, SafariPush, Email, SMS)
      #
      # PATCH /v1/apps/{appId}/subscriptions_by_token/{tokenType}/{token}
      def update_by_token(token_type, token, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/subscriptions_by_token/{tokenType}/{token}",
          path_params: { "tokenType" => token_type, "token" => token },
          body: body,
          app_id: app_id,
          response: "Subscription",
          request_options: request_options
        )
      end

      # Aboneliği external_id ile kullanıcıya bağla
      #
      # POST /v1/apps/{appId}/subscriptions/{subscriptionId}/owner
      def set_owner(subscription_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/subscriptions/{subscriptionId}/owner",
          path_params: { "subscriptionId" => subscription_id },
          body: body,
          app_id: app_id,
          response: "Subscription",
          request_options: request_options
        )
      end
    end

    # Özel olay gönderimi ve olay tanımları.
    class Events < HeroSignal::BaseResource
      # Toplu olay gönder (en fazla 500)
      #
      # POST /v1/apps/{appId}/events
      def send_events(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/events",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "EventsAccepted",
          request_options: request_options
        )
      end

      # Olay tanımları
      #
      # GET /v1/apps/{appId}/events/definitions
      def list_definitions(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/events/definitions",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor },
          app_id: app_id,
          response: "EventDefinitionList",
          request_options: request_options
        )
      end

      # list_definitions sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_definitions_all(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list_definitions(limit: limit, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Olay detayı
      #
      # GET /v1/apps/{appId}/events/definitions/{name}
      def get_definition(name, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/events/definitions/{name}",
          path_params: { "name" => name },
          app_id: app_id,
          response: "EventDefinitionDetail",
          request_options: request_options
        )
      end

      # Görünen ad / dönüşüm işareti
      #
      # PATCH /v1/apps/{appId}/events/definitions/{name}
      def update_definition(name, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/events/definitions/{name}",
          path_params: { "name" => name },
          body: body,
          app_id: app_id,
          response: "EventDefinition",
          request_options: request_options
        )
      end
    end

    # Segment yönetimi, önizleme ve kitle tahmini.
    class Segments < HeroSignal::BaseResource
      # Segment listesi
      #
      # GET /v1/apps/{appId}/segments
      def list(limit: nil, cursor: nil, q: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/segments",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q },
          app_id: app_id,
          response: "SegmentPage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, q: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, q: q, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Segment oluştur
      #
      # POST /v1/apps/{appId}/segments
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/segments",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "Segment",
          request_options: request_options
        )
      end

      # Tanım ile sayım ve örnek kullanıcılar
      #
      # POST /v1/apps/{appId}/segments/preview
      def preview(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/segments/preview",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "SegmentPreview",
          request_options: request_options
        )
      end

      # Segment detayı
      #
      # GET /v1/apps/{appId}/segments/{segmentId}
      def get(segment_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          response: "Segment",
          request_options: request_options
        )
      end

      # Segment güncelle
      #
      # PATCH /v1/apps/{appId}/segments/{segmentId}
      def update(segment_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          body: body,
          app_id: app_id,
          response: "Segment",
          request_options: request_options
        )
      end

      # Segment sil
      #
      # DELETE /v1/apps/{appId}/segments/{segmentId}
      def delete(segment_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Segmenti kullanan kampanyalar
      #
      # GET /v1/apps/{appId}/segments/{segmentId}/campaigns
      def used_by(segment_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/segments/{segmentId}/campaigns",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          response: "SegmentCampaigns",
          request_options: request_options
        )
      end

      # Tahmini sayım
      #
      # POST /v1/apps/{appId}/segments/{segmentId}/estimate
      #
      # @param force true: önbelleği atla, tam sayım Değerler: "true", "false".
      def estimate(segment_id, force: nil, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/segments/{segmentId}/estimate",
          path_params: { "segmentId" => segment_id },
          query: { "force" => force },
          app_id: app_id,
          response: "SegmentEstimate",
          request_options: request_options
        )
      end
    end

    # Şablon yönetimi, sürümler ve önizleme.
    class Templates < HeroSignal::BaseResource
      # Şablon listesi
      #
      # GET /v1/apps/{appId}/templates
      #
      # @param channel Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      def list(limit: nil, cursor: nil, q: nil, channel: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/templates",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q, "channel" => channel },
          app_id: app_id,
          response: "TemplatePage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, q: nil, channel: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, q: q, channel: channel, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Şablon oluştur
      #
      # POST /v1/apps/{appId}/templates
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/templates",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "Template",
          request_options: request_options
        )
      end

      # Şablon detayı
      #
      # GET /v1/apps/{appId}/templates/{templateId}
      def get(template_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          response: "Template",
          request_options: request_options
        )
      end

      # Şablon güncelle
      #
      # PATCH /v1/apps/{appId}/templates/{templateId}
      def update(template_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          response: "Template",
          request_options: request_options
        )
      end

      # Şablon sil
      #
      # DELETE /v1/apps/{appId}/templates/{templateId}
      def delete(template_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Şablon analitiği
      #
      # GET /v1/apps/{appId}/templates/{templateId}/stats
      def stats(template_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/templates/{templateId}/stats",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          response: "TemplateStats",
          request_options: request_options
        )
      end

      # Şablonu aynı organizasyondaki başka bir app'e kopyala
      #
      # POST /v1/apps/{appId}/templates/{templateId}/copy_to_app
      def copy_to_app(template_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/templates/{templateId}/copy_to_app",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          response: "Template",
          request_options: request_options
        )
      end

      # Sürüm geçmişi
      #
      # GET /v1/apps/{appId}/templates/{templateId}/versions
      def versions(template_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/templates/{templateId}/versions",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          response: "TemplateVersionList",
          request_options: request_options
        )
      end

      # Şablonu örnek verilerle render et
      #
      # POST /v1/apps/{appId}/templates/{templateId}/render
      def render(template_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/templates/{templateId}/render",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          response: "RenderPreview",
          request_options: request_options
        )
      end
    end

    # Kampanya yaşam döngüsü (zamanlama, gönderim, duraklatma, onay) ve istatistikler.
    class Campaigns < HeroSignal::BaseResource
      # Kampanya listesi
      #
      # GET /v1/apps/{appId}/campaigns
      #
      # @param status Değerler: "draft", "scheduled", "running", "paused", "completed", "cancelled", "failed".
      # @param type Değerler: "one_time", "scheduled", "recurring", "automated", "transactional".
      # @param channel Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      def list(limit: nil, cursor: nil, q: nil, status: nil, type: nil, channel: nil, label: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q, "status" => status, "type" => type, "channel" => channel, "label" => label },
          app_id: app_id,
          response: "CampaignPage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, q: nil, status: nil, type: nil, channel: nil, label: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, q: q, status: status, type: type, channel: channel, label: label, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Kampanya oluştur
      #
      # POST /v1/apps/{appId}/campaigns
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Kampanya detayı
      #
      # GET /v1/apps/{appId}/campaigns/{campaignId}
      def get(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Kampanya güncelle
      #
      # PATCH /v1/apps/{appId}/campaigns/{campaignId}
      def update(campaign_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          body: body,
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Kampanya sil
      #
      # DELETE /v1/apps/{appId}/campaigns/{campaignId}
      def delete(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Zamanla
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/schedule
      def schedule(campaign_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/schedule",
          path_params: { "campaignId" => campaign_id },
          body: body,
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Hemen gönder
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/send
      def send_campaign(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/send",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Duraklat
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/pause
      def pause(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/pause",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Sürdür
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/resume
      def resume(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/resume",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # İptal
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/cancel
      def cancel(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/cancel",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Çoğalt
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/duplicate
      def duplicate(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/duplicate",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Onayla
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/approve
      def approve(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/approve",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # İstatistikler
      #
      # GET /v1/apps/{appId}/campaigns/{campaignId}/stats
      def stats(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns/{campaignId}/stats",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "CampaignStats",
          request_options: request_options
        )
      end

      # A/B varyant karşılaştırması
      #
      # GET /v1/apps/{appId}/campaigns/{campaignId}/variants/stats
      def variant_stats(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns/{campaignId}/variants/stats",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "CampaignVariantStats",
          request_options: request_options
        )
      end

      # A/B kazananını seç
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/winner
      def select_winner(campaign_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/winner",
          path_params: { "campaignId" => campaign_id },
          body: body,
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Abone bazlı teslimatlar
      #
      # GET /v1/apps/{appId}/campaigns/{campaignId}/deliveries
      #
      # @param status Değerler: "pending", "sent", "delivered", "failed", "bounced", "suppressed", "expired", "cancelled".
      def deliveries(campaign_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns/{campaignId}/deliveries",
          path_params: { "campaignId" => campaign_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          response: "DeliveryList",
          request_options: request_options
        )
      end

      # deliveries sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def deliveries_all(campaign_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          deliveries(campaign_id, limit: limit, status: status, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Başarısız teslimatlara yeniden gönder
      #
      # POST /v1/apps/{appId}/campaigns/{campaignId}/resend-failed
      def resend_failed(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/campaigns/{campaignId}/resend-failed",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "Campaign",
          request_options: request_options
        )
      end

      # Kampanya çalıştırmaları
      #
      # GET /v1/apps/{appId}/campaigns/{campaignId}/messages
      def messages(campaign_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/campaigns/{campaignId}/messages",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          response: "MessageList",
          request_options: request_options
        )
      end
    end

    # Uygulama içi (in-app) mesaj yönetimi ve durum değişiklikleri.
    class InAppMessages < HeroSignal::BaseResource
      # In-app mesajlar (durum filtresi; istatistik dahil)
      #
      # GET /v1/apps/{appId}/in-app-messages
      #
      # @param status Değerler: "draft", "active", "paused", "archived".
      def list(limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/in-app-messages",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          response: "InAppMessagePage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, status: status, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # In-app mesaj oluştur (taslak)
      #
      # POST /v1/apps/{appId}/in-app-messages
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/in-app-messages",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end

      # In-app mesaj detayı ve istatistikleri
      #
      # GET /v1/apps/{appId}/in-app-messages/{messageId}
      def get(message_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end

      # In-app mesajı düzenle
      #
      # PATCH /v1/apps/{appId}/in-app-messages/{messageId}
      def update(message_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end

      # In-app mesajı sil
      #
      # DELETE /v1/apps/{appId}/in-app-messages/{messageId}
      def delete(message_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Yayınla / duraklat / arşivle
      #
      # POST /v1/apps/{appId}/in-app-messages/{messageId}/status
      def status(message_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/in-app-messages/{messageId}/status",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end

      # A/B kazananını elle seç
      #
      # POST /v1/apps/{appId}/in-app-messages/{messageId}/winner
      def select_winner(message_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/in-app-messages/{messageId}/winner",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end

      # A/B kazananını elle seç
      #
      # POST /v1/apps/{appId}/in-app-messages/{messageId}/winner
      #
      # @deprecated #select_winner kullanın; bu ad geriye dönük uyumluluk için korunur.
      def winner(message_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/in-app-messages/{messageId}/winner",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          response: "InAppMessage",
          request_options: request_options
        )
      end
    end

    # Kullanıcı bildirim kutusu (inbox): listeleme, okundu işaretleme ve arşivleme.
    class Inbox < HeroSignal::BaseResource
      # Kullanıcının bildirim kutusu (okunmamış sayısı dahil)
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}/inbox
      #
      # @param include_archived Değerler: "true", "false".
      def list(label, value, limit: nil, cursor: nil, include_archived: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}/inbox",
          path_params: { "label" => label, "value" => value },
          query: { "limit" => limit, "cursor" => cursor, "include_archived" => include_archived },
          app_id: app_id,
          response: "InboxPage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(label, value, limit: nil, cursor: nil, include_archived: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(label, value, limit: limit, include_archived: include_archived, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Tümünü okundu işaretle
      #
      # POST /v1/apps/{appId}/users/by/{label}/{value}/inbox/read-all
      def read_all(label, value, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/users/by/{label}/{value}/inbox/read-all",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "InboxReadAllResult",
          request_options: request_options
        )
      end

      # Okundu işaretle
      #
      # POST /v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}/read
      def read(label, value, item_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}/read",
          path_params: { "label" => label, "value" => value, "itemId" => item_id },
          app_id: app_id,
          response: "InboxItem",
          request_options: request_options
        )
      end

      # Kutudan kaldır (arşivle)
      #
      # DELETE /v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}
      def archive(label, value, item_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}",
          path_params: { "label" => label, "value" => value, "itemId" => item_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end
    end

    # E-posta/SMS gönderim engeli (suppression) listesi.
    class Suppressions < HeroSignal::BaseResource
      # Suppression list (e-posta/SMS gönderilmeyecek adresler; kanal/neden/değer filtresi)
      #
      # GET /v1/apps/{appId}/suppressions
      #
      # @param channel Değerler: "email", "sms".
      # @param reason Değerler: "bounce", "complaint", "manual", "unsubscribe_link", "stop".
      def list(limit: nil, cursor: nil, channel: nil, reason: nil, value: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/suppressions",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "channel" => channel, "reason" => reason, "value" => value },
          app_id: app_id,
          response: "SuppressionPage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, channel: nil, reason: nil, value: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, channel: channel, reason: reason, value: value, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Adres ekle (manuel engel; değer saklanmaz, özet + maskeli gösterim)
      #
      # POST /v1/apps/{appId}/suppressions
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/suppressions",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "Suppression",
          request_options: request_options
        )
      end

      # Kaydı kaldır (adres yeniden gönderim alabilir)
      #
      # DELETE /v1/apps/{appId}/suppressions/{suppressionId}
      def delete(suppression_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/suppressions/{suppressionId}",
          path_params: { "suppressionId" => suppression_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end
    end

    # Veri dışa aktarma işleri.
    class Exports < HeroSignal::BaseResource
      # Export işi başlat
      #
      # POST /v1/apps/{appId}/exports
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/exports",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "Export",
          request_options: request_options
        )
      end

      # Export işleri
      #
      # GET /v1/apps/{appId}/exports
      def list(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/exports",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor },
          app_id: app_id,
          response: "ExportList",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Export durumu (download_url)
      #
      # GET /v1/apps/{appId}/exports/{exportId}
      def get(export_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/exports/{exportId}",
          path_params: { "exportId" => export_id },
          app_id: app_id,
          response: "Export",
          request_options: request_options
        )
      end
    end

    # Veri içe aktarma işleri (CSV, multipart).
    class Imports < HeroSignal::BaseResource
      # Import işi başlat (multipart: type, file)
      #
      # POST /v1/apps/{appId}/imports
      #
      # @param type Değerler: "eski sağlayıcı_players", "csv_users".
      # @param file CSV dosyası (UTF-8, en fazla 50 MB)
      def create(type:, file:, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/imports",
          path_params: {},
          form: { "type" => type, "file" => file },
          app_id: app_id,
          response: "Import",
          request_options: request_options
        )
      end

      # Import işleri
      #
      # GET /v1/apps/{appId}/imports
      def list(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/imports",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor },
          app_id: app_id,
          response: "ImportList",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Import durumu
      #
      # GET /v1/apps/{appId}/imports/{importId}
      def get(import_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/imports/{importId}",
          path_params: { "importId" => import_id },
          app_id: app_id,
          response: "Import",
          request_options: request_options
        )
      end
    end

    # Giden webhook uç noktaları, teslimatlar ve yeniden gönderim.
    class Webhooks < HeroSignal::BaseResource
      # Webhook endpoint'leri
      #
      # GET /v1/apps/{appId}/webhooks
      def list(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/webhooks",
          path_params: {},
          app_id: app_id,
          response: "WebhookList",
          request_options: request_options
        )
      end

      # Endpoint oluştur (secret yalnızca bu yanıtta döner)
      #
      # POST /v1/apps/{appId}/webhooks
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/webhooks",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "WebhookWithSecret",
          request_options: request_options
        )
      end

      # Endpoint detayı
      #
      # GET /v1/apps/{appId}/webhooks/{webhookId}
      def get(webhook_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          response: "Webhook",
          request_options: request_options
        )
      end

      # Endpoint güncelle (URL, olaylar, batch, başlıklar, etkinleştir/durdur)
      #
      # PATCH /v1/apps/{appId}/webhooks/{webhookId}
      def update(webhook_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          body: body,
          app_id: app_id,
          response: "Webhook",
          request_options: request_options
        )
      end

      # Endpoint sil
      #
      # DELETE /v1/apps/{appId}/webhooks/{webhookId}
      def delete(webhook_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Secret rotasyonu (eski secret 24 saat ikinci imza olarak gönderilir)
      #
      # POST /v1/apps/{appId}/webhooks/{webhookId}/rotate-secret
      def rotate_secret(webhook_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/webhooks/{webhookId}/rotate-secret",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          response: "WebhookWithSecret",
          request_options: request_options
        )
      end

      # Test olayı gönder (anında, sonuç döner)
      #
      # POST /v1/apps/{appId}/webhooks/{webhookId}/test
      def test(webhook_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/webhooks/{webhookId}/test",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          response: "WebhookDeliveryDetail",
          request_options: request_options
        )
      end

      # Teslim geçmişi (cursor; durum/olay türü filtresi)
      #
      # GET /v1/apps/{appId}/webhooks/{webhookId}/deliveries
      #
      # @param status Değerler: "pending", "success", "failed", "dead".
      def deliveries(webhook_id, limit: nil, cursor: nil, status: nil, event_type: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/webhooks/{webhookId}/deliveries",
          path_params: { "webhookId" => webhook_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status, "event_type" => event_type },
          app_id: app_id,
          response: "WebhookDeliveryPage",
          request_options: request_options
        )
      end

      # deliveries sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def deliveries_all(webhook_id, limit: nil, cursor: nil, status: nil, event_type: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          deliveries(webhook_id, limit: limit, status: status, event_type: event_type, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Teslimi yeniden gönder (aynı olay kimliğiyle)
      #
      # POST /v1/apps/{appId}/webhooks/deliveries/{deliveryId}/replay
      def replay(delivery_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/webhooks/deliveries/{deliveryId}/replay",
          path_params: { "deliveryId" => delivery_id },
          app_id: app_id,
          response: "WebhookDeliveryDetail",
          request_options: request_options
        )
      end
    end

    # Kanal (APNs, FCM, Web Push, e-posta, SMS) yapılandırması ve doğrulaması.
    class Channels < HeroSignal::BaseResource
      # Kanal yapılandırmaları
      #
      # GET /v1/apps/{appId}/channels
      def list(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/channels",
          path_params: {},
          app_id: app_id,
          response: "ChannelList",
          request_options: request_options
        )
      end

      # Kimlik bilgisi yükle (APNs p8, FCM servis hesabı, VAPID, mock)
      #
      # PUT /v1/apps/{appId}/channels/{channel}
      def upsert(channel, body, app_id: nil, request_options: nil)
        @client.call(
          :put, "/v1/apps/{appId}/channels/{channel}",
          path_params: { "channel" => channel },
          body: body,
          app_id: app_id,
          response: "ChannelConfig",
          request_options: request_options
        )
      end

      # Sağlayıcıya test bağlantısı
      #
      # POST /v1/apps/{appId}/channels/{channel}/validate
      def validate(channel, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/channels/{channel}/validate",
          path_params: { "channel" => channel },
          app_id: app_id,
          response: "ChannelValidation",
          request_options: request_options
        )
      end
    end

    # Analitik raporları.
    class Analytics < HeroSignal::BaseResource
      # Genel bakış KPI
      #
      # GET /v1/apps/{appId}/analytics/overview
      #
      # @param range Değerler: "7d", "30d".
      def overview(range: nil, from: nil, to: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/overview",
          path_params: {},
          query: { "range" => range, "from" => from, "to" => to },
          app_id: app_id,
          response: "OverviewStats",
          request_options: request_options
        )
      end

      # Teslimat raporu
      #
      # GET /v1/apps/{appId}/analytics/messages
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      # @param group_by Değerler: "day", "channel", "campaign".
      def messages(from: nil, to: nil, compare: nil, format: nil, group_by: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/messages",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "group_by" => group_by },
          app_id: app_id,
          response: "MessagesReport",
          request_options: request_options
        )
      end

      # Abonelik büyümesi
      #
      # GET /v1/apps/{appId}/analytics/subscriptions
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      def subscriptions(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/subscriptions",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          response: "SubscriptionsReport",
          request_options: request_options
        )
      end

      # Olay hacmi
      #
      # GET /v1/apps/{appId}/analytics/events
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      # @param group_by Değerler: "day", "name".
      def events(from: nil, to: nil, compare: nil, format: nil, name: nil, group_by: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/events",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "name" => name, "group_by" => group_by },
          app_id: app_id,
          response: "EventsReport",
          request_options: request_options
        )
      end

      # Dönüşüm/atribüsyon
      #
      # GET /v1/apps/{appId}/analytics/conversions
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      def conversions(from: nil, to: nil, compare: nil, format: nil, campaign_id: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/conversions",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "campaign_id" => campaign_id },
          app_id: app_id,
          response: "ConversionsReport",
          request_options: request_options
        )
      end

      # Funnel
      #
      # POST /v1/apps/{appId}/analytics/funnels
      def funnel(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/analytics/funnels",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "FunnelReport",
          request_options: request_options
        )
      end

      # Sağlayıcı sağlığı
      #
      # GET /v1/apps/{appId}/analytics/providers
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      def providers(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/providers",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          response: "ProvidersReport",
          request_options: request_options
        )
      end

      # Retention kohortu
      #
      # GET /v1/apps/{appId}/analytics/retention
      #
      # @param format Değerler: "json", "csv".
      def retention(weeks: nil, format: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/retention",
          path_params: {},
          query: { "weeks" => weeks, "format" => format },
          app_id: app_id,
          response: "RetentionReport",
          request_options: request_options
        )
      end

      # Etkileşim ısı haritası
      #
      # GET /v1/apps/{appId}/analytics/engagement
      #
      # @param compare Değerler: "true", "false".
      # @param format Değerler: "json", "csv".
      def engagement(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/analytics/engagement",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          response: "EngagementReport",
          request_options: request_options
        )
      end
    end

    # App listesi ve ayarları.
    class Apps < HeroSignal::BaseResource
      # App listesi (org geneli admin anahtarı)
      #
      # GET /v1/apps
      def list(request_options: nil)
        @client.call(
          :get, "/v1/apps",
          path_params: {},
          response: "AppList",
          request_options: request_options
        )
      end

      # App oluştur (org geneli admin anahtarı)
      #
      # POST /v1/apps
      def create(body, request_options: nil)
        @client.call(
          :post, "/v1/apps",
          path_params: {},
          body: body,
          response: "App",
          request_options: request_options
        )
      end

      # App detayı
      #
      # GET /v1/apps/{appId}
      def get(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}",
          path_params: {},
          app_id: app_id,
          response: "App",
          request_options: request_options
        )
      end

      # App ayarlarını güncelle
      #
      # PATCH /v1/apps/{appId}
      def update(body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "App",
          request_options: request_options
        )
      end
    end

    # App API anahtarları: oluşturma, kapsam/IP izin listesi güncelleme, rotasyon ve iptal.
    class ApiKeys < HeroSignal::BaseResource
      # App'e bağlı API anahtarları
      #
      # GET /v1/apps/{appId}/api-keys
      def list(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/api-keys",
          path_params: {},
          app_id: app_id,
          response: "ApiKeyList",
          request_options: request_options
        )
      end

      # App'e bağlı API anahtarı oluştur (ham anahtar yalnızca bu yanıtta)
      #
      # POST /v1/apps/{appId}/api-keys
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/api-keys",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "CreatedApiKey",
          request_options: request_options
        )
      end

      # Anahtarı güncelle (ad, kapsam, IP izin listesi, bitiş)
      #
      # PATCH /v1/apps/{appId}/api-keys/{keyId}
      def update(key_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/api-keys/{keyId}",
          path_params: { "keyId" => key_id },
          body: body,
          app_id: app_id,
          response: "ApiKey",
          request_options: request_options
        )
      end

      # Anahtarı iptal et
      #
      # DELETE /v1/apps/{appId}/api-keys/{keyId}
      def revoke(key_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/api-keys/{keyId}",
          path_params: { "keyId" => key_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Anahtarı döndür (eski değer anında geçersiz)
      #
      # POST /v1/apps/{appId}/api-keys/{keyId}/rotate
      def rotate(key_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/api-keys/{keyId}/rotate",
          path_params: { "keyId" => key_id },
          app_id: app_id,
          response: "CreatedApiKey",
          request_options: request_options
        )
      end
    end

    # Organizasyon, üyeler ve denetim kayıtları.
    class Organization < HeroSignal::BaseResource
      # Anahtarın ait olduğu organizasyon (org geneli admin anahtarı)
      #
      # GET /v1/organization
      def get(request_options: nil)
        @client.call(
          :get, "/v1/organization",
          path_params: {},
          response: "Org",
          request_options: request_options
        )
      end

      # Organizasyon üyeleri (org geneli admin anahtarı)
      #
      # GET /v1/organization/members
      def members(request_options: nil)
        @client.call(
          :get, "/v1/organization/members",
          path_params: {},
          response: "MemberList",
          request_options: request_options
        )
      end

      # Audit log (org geneli admin anahtarı; action/actor/app/tarih filtreleri, cursor)
      #
      # GET /v1/organization/audit-logs
      def audit_logs(limit: nil, cursor: nil, action: nil, actor_id: nil, app_id_param: nil, from: nil, to: nil, request_options: nil)
        @client.call(
          :get, "/v1/organization/audit-logs",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "action" => action, "actor_id" => actor_id, "app_id" => app_id_param, "from" => from, "to" => to },
          response: "AuditPage",
          request_options: request_options
        )
      end

      # audit_logs sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def audit_logs_all(limit: nil, cursor: nil, action: nil, actor_id: nil, app_id_param: nil, from: nil, to: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          audit_logs(limit: limit, action: action, actor_id: actor_id, app_id_param: app_id_param, from: from, to: to, request_options: request_options, cursor: cursor_value)
        end
      end

      # Organizasyon kullanımı ve plan kotaları (org geneli anahtar)
      #
      # GET /v1/organization/usage
      def usage(days: nil, request_options: nil)
        @client.call(
          :get, "/v1/organization/usage",
          path_params: {},
          query: { "days" => days },
          response: "UsageReport",
          request_options: request_options
        )
      end
    end

    # categories kaynağı.
    class Categories < HeroSignal::BaseResource
      # Mesaj kategorileri
      #
      # GET /v1/apps/{appId}/categories
      def list(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/categories",
          path_params: {},
          app_id: app_id,
          response: "MessageCategoryList",
          request_options: request_options
        )
      end

      # Kategori oluştur
      #
      # POST /v1/apps/{appId}/categories
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/categories",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "MessageCategory",
          request_options: request_options
        )
      end

      # Kategori güncelle
      #
      # PATCH /v1/apps/{appId}/categories/{categoryId}
      def update(category_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/categories/{categoryId}",
          path_params: { "categoryId" => category_id },
          body: body,
          app_id: app_id,
          response: "MessageCategory",
          request_options: request_options
        )
      end

      # Kategori sil
      #
      # DELETE /v1/apps/{appId}/categories/{categoryId}
      def delete(category_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/categories/{categoryId}",
          path_params: { "categoryId" => category_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end
    end

    # identityKeys kaynağı.
    class IdentityKeys < HeroSignal::BaseResource
      # SDK kimlik doğrulama (JWT) genel anahtarları
      #
      # GET /v1/apps/{appId}/identity-keys
      def list(app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/identity-keys",
          path_params: {},
          app_id: app_id,
          response: "IdentityKeyList",
          request_options: request_options
        )
      end

      # Genel anahtar ekle (ES256)
      #
      # POST /v1/apps/{appId}/identity-keys
      #
      # SDK JWT identity verification için ES256 (EC P-256) genel anahtarı ekler; özel anahtar gönderilmez. Belirteç sunucunuzda imzalanır (`sub` = external_id, `aud` = app_id, `exp` ≤ 24 saat) ve SDK isteklerinde `Authorization: Bearer <jwt>` başlığıyla taşınır. Kip app ayarında `identity_verification_mode` ile seçilir.
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/identity-keys",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "IdentityKey",
          request_options: request_options
        )
      end

      # Genel anahtarı iptal et
      #
      # DELETE /v1/apps/{appId}/identity-keys/{keyId}
      def revoke(key_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/identity-keys/{keyId}",
          path_params: { "keyId" => key_id },
          app_id: app_id,
          response: "IdentityKey",
          request_options: request_options
        )
      end
    end

    # journeys kaynağı.
    class Journeys < HeroSignal::BaseResource
      # Journey listesi
      #
      # GET /v1/apps/{appId}/journeys
      #
      # @param status Değerler: "draft", "active", "paused", "archived".
      def list(limit: nil, cursor: nil, status: nil, q: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "status" => status, "q" => q },
          app_id: app_id,
          response: "JourneyPage",
          request_options: request_options
        )
      end

      # list sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def list_all(limit: nil, cursor: nil, status: nil, q: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          list(limit: limit, status: status, q: q, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Journey oluştur (taslak)
      #
      # POST /v1/apps/{appId}/journeys
      def create(body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys",
          path_params: {},
          body: body,
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Journey detayı
      #
      # GET /v1/apps/{appId}/journeys/{journeyId}
      def get(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys/{journeyId}",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Ad / açıklama
      #
      # PATCH /v1/apps/{appId}/journeys/{journeyId}
      def update(journey_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/journeys/{journeyId}",
          path_params: { "journeyId" => journey_id },
          body: body,
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Hiç yayınlanmamış journey'i sil
      #
      # DELETE /v1/apps/{appId}/journeys/{journeyId}
      def delete(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/journeys/{journeyId}",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "Ok",
          request_options: request_options
        )
      end

      # Taslağı kaydet
      #
      # PUT /v1/apps/{appId}/journeys/{journeyId}/draft
      def save_draft(journey_id, body, app_id: nil, request_options: nil)
        @client.call(
          :put, "/v1/apps/{appId}/journeys/{journeyId}/draft",
          path_params: { "journeyId" => journey_id },
          body: body,
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Taslaktaki düğümü güncelle
      #
      # PATCH /v1/apps/{appId}/journeys/{journeyId}/nodes/{nodeId}
      def update_node(journey_id, node_id, body, app_id: nil, request_options: nil)
        @client.call(
          :patch, "/v1/apps/{appId}/journeys/{journeyId}/nodes/{nodeId}",
          path_params: { "journeyId" => journey_id, "nodeId" => node_id },
          body: body,
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Sürümler
      #
      # GET /v1/apps/{appId}/journeys/{journeyId}/versions
      def versions(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys/{journeyId}/versions",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyVersionList",
          request_options: request_options
        )
      end

      # Yayınla
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/publish
      def publish(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/publish",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyPublishResult",
          request_options: request_options
        )
      end

      # Duraklat
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/pause
      def pause(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/pause",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Devam ettir
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/resume
      def resume(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/resume",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Arşivle
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/archive
      def archive(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/archive",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Kopyala
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/duplicate
      def duplicate(journey_id, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/duplicate",
          path_params: { "journeyId" => journey_id },
          app_id: app_id,
          response: "JourneyDetail",
          request_options: request_options
        )
      end

      # Düğüm bazlı istatistik
      #
      # GET /v1/apps/{appId}/journeys/{journeyId}/stats
      #
      # @param all_versions Değerler: "true", "false".
      def stats(journey_id, version: nil, all_versions: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys/{journeyId}/stats",
          path_params: { "journeyId" => journey_id },
          query: { "version" => version, "all_versions" => all_versions },
          app_id: app_id,
          response: "JourneyStats",
          request_options: request_options
        )
      end

      # Run listesi
      #
      # GET /v1/apps/{appId}/journeys/{journeyId}/runs
      #
      # @param status Değerler: "active", "waiting", "completed", "exited", "failed".
      def runs(journey_id, limit: nil, cursor: nil, status: nil, user_id: nil, version: nil, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys/{journeyId}/runs",
          path_params: { "journeyId" => journey_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status, "user_id" => user_id, "version" => version },
          app_id: app_id,
          response: "JourneyRunPage",
          request_options: request_options
        )
      end

      # runs sonuçlarını next_cursor ile tüm sayfalar boyunca tek tek dolaşan Enumerator döndürür (sayfalar tembel yüklenir).
      def runs_all(journey_id, limit: nil, cursor: nil, status: nil, user_id: nil, version: nil, app_id: nil, request_options: nil)
        @client.paginate(cursor) do |cursor_value|
          runs(journey_id, limit: limit, status: status, user_id: user_id, version: version, app_id: app_id, request_options: request_options, cursor: cursor_value)
        end
      end

      # Kullanıcıyı journey'e sok (external_id, user_id veya alias; context Liquid custom_data)
      #
      # POST /v1/apps/{appId}/journeys/{journeyId}/runs
      def trigger(journey_id, body, app_id: nil, request_options: nil)
        @client.call(
          :post, "/v1/apps/{appId}/journeys/{journeyId}/runs",
          path_params: { "journeyId" => journey_id },
          body: body,
          app_id: app_id,
          response: "JourneyTriggerResult",
          request_options: request_options
        )
      end

      # Run detayı ve adımlar
      #
      # GET /v1/apps/{appId}/journeys/{journeyId}/runs/{runId}
      def run(journey_id, run_id, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/journeys/{journeyId}/runs/{runId}",
          path_params: { "journeyId" => journey_id, "runId" => run_id },
          app_id: app_id,
          response: "JourneyRunDetail",
          request_options: request_options
        )
      end

      # Run'ı sonlandır
      #
      # DELETE /v1/apps/{appId}/journeys/{journeyId}/runs/{runId}
      def exit_run(journey_id, run_id, app_id: nil, request_options: nil)
        @client.call(
          :delete, "/v1/apps/{appId}/journeys/{journeyId}/runs/{runId}",
          path_params: { "journeyId" => journey_id, "runId" => run_id },
          app_id: app_id,
          response: "JourneyRunDetail",
          request_options: request_options
        )
      end

      # Kullanıcının journey run'ları
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}/journeys
      def list_for_user(label, value, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}/journeys",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "UserJourneyRuns",
          request_options: request_options
        )
      end
    end

    # preferences kaynağı.
    class Preferences < HeroSignal::BaseResource
      # Kullanıcının tercihleri (alias ile)
      #
      # GET /v1/apps/{appId}/users/by/{label}/{value}/preferences
      def get(label, value, app_id: nil, request_options: nil)
        @client.call(
          :get, "/v1/apps/{appId}/users/by/{label}/{value}/preferences",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          response: "UserPreferences",
          request_options: request_options
        )
      end

      # Kullanıcı tercihlerini yaz (alias ile)
      #
      # PUT /v1/apps/{appId}/users/by/{label}/{value}/preferences
      def set(label, value, body, app_id: nil, request_options: nil)
        @client.call(
          :put, "/v1/apps/{appId}/users/by/{label}/{value}/preferences",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          response: "UserPreferences",
          request_options: request_options
        )
      end
    end
  end

  # İstemciye kaynak erişimcilerini ekleyen üretilmiş modül.
  module GeneratedResources
    # SDK'nın üretildiği OpenAPI sözleşmesinin sürümü.
    API_VERSION = "0.1.0"

    RESOURCE_NAMES = %i[notifications users aliases subscriptions events segments templates campaigns in_app_messages inbox suppressions exports imports webhooks channels analytics apps api_keys organization categories identity_keys journeys preferences].freeze

    # Bildirim gönderme, durum, iptal, teslimatlar ve geçmiş dışa aktarımı.
    def notifications
      @notifications ||= HeroSignal::Resources::Notifications.new(self)
    end

    # Kullanıcı oluşturma/güncelleme (tag, özellik), arama ve abonelik ekleme.
    def users
      @users ||= HeroSignal::Resources::Users.new(self)
    end

    # Kullanıcı kimlikleri (alias): ekleme ve kaldırma.
    def aliases
      @aliases ||= HeroSignal::Resources::Aliases.new(self)
    end

    # Abonelik (cihaz/e-posta/SMS) okuma, güncelleme, silme ve sahip atama.
    def subscriptions
      @subscriptions ||= HeroSignal::Resources::Subscriptions.new(self)
    end

    # Özel olay gönderimi ve olay tanımları.
    def events
      @events ||= HeroSignal::Resources::Events.new(self)
    end

    # Segment yönetimi, önizleme ve kitle tahmini.
    def segments
      @segments ||= HeroSignal::Resources::Segments.new(self)
    end

    # Şablon yönetimi, sürümler ve önizleme.
    def templates
      @templates ||= HeroSignal::Resources::Templates.new(self)
    end

    # Kampanya yaşam döngüsü (zamanlama, gönderim, duraklatma, onay) ve istatistikler.
    def campaigns
      @campaigns ||= HeroSignal::Resources::Campaigns.new(self)
    end

    # Uygulama içi (in-app) mesaj yönetimi ve durum değişiklikleri.
    def in_app_messages
      @in_app_messages ||= HeroSignal::Resources::InAppMessages.new(self)
    end

    # Kullanıcı bildirim kutusu (inbox): listeleme, okundu işaretleme ve arşivleme.
    def inbox
      @inbox ||= HeroSignal::Resources::Inbox.new(self)
    end

    # E-posta/SMS gönderim engeli (suppression) listesi.
    def suppressions
      @suppressions ||= HeroSignal::Resources::Suppressions.new(self)
    end

    # Veri dışa aktarma işleri.
    def exports
      @exports ||= HeroSignal::Resources::Exports.new(self)
    end

    # Veri içe aktarma işleri (CSV, multipart).
    def imports
      @imports ||= HeroSignal::Resources::Imports.new(self)
    end

    # Giden webhook uç noktaları, teslimatlar ve yeniden gönderim.
    def webhooks
      @webhooks ||= HeroSignal::Resources::Webhooks.new(self)
    end

    # Kanal (APNs, FCM, Web Push, e-posta, SMS) yapılandırması ve doğrulaması.
    def channels
      @channels ||= HeroSignal::Resources::Channels.new(self)
    end

    # Analitik raporları.
    def analytics
      @analytics ||= HeroSignal::Resources::Analytics.new(self)
    end

    # App listesi ve ayarları.
    def apps
      @apps ||= HeroSignal::Resources::Apps.new(self)
    end

    # App API anahtarları: oluşturma, kapsam/IP izin listesi güncelleme, rotasyon ve iptal.
    def api_keys
      @api_keys ||= HeroSignal::Resources::ApiKeys.new(self)
    end

    # Organizasyon, üyeler ve denetim kayıtları.
    def organization
      @organization ||= HeroSignal::Resources::Organization.new(self)
    end

    def categories
      @categories ||= HeroSignal::Resources::Categories.new(self)
    end

    def identity_keys
      @identity_keys ||= HeroSignal::Resources::IdentityKeys.new(self)
    end

    def journeys
      @journeys ||= HeroSignal::Resources::Journeys.new(self)
    end

    def preferences
      @preferences ||= HeroSignal::Resources::Preferences.new(self)
    end
  end
end
