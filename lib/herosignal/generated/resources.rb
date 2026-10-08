# frozen_string_literal: true

# Bu dosya api/openapi.yaml'dan sdk/scripts/generate-server-sdks.mjs ile üretilmiştir; elle düzenlemeyin.

module HeroSignal
  # OpenAPI'den üretilen kaynaklar; her metot bir API işlemine karşılık gelir.
  module Generated
    # SDK'nın üretildiği OpenAPI sözleşmesinin sürümü.
    API_VERSION = "0.1.0"

    # Bildirim gönderme, durum, iptal, teslimatlar ve geçmiş dışa aktarımı.
    class NotificationsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Bildirim oluştur (202, asenkron teslimat)
      #
      # +POST /v1/notifications+
      #
      # @param body [Hash] İstek gövdesi (CreateNotificationDto).
      # @option body [String] :app_id
      # @option body [String] :idempotency_key
      # @option body [Hash] :target Zorunlu.
      # @option body [Hash{String => String}] :headings
      # @option body [Hash{String => String}] :contents
      # @option body [Hash{String => String}] :subtitle
      # @option body [String] :url
      # @option body [String] :app_url
      # @option body [Hash{String => String}] :data
      # @option body [Array<Hash>] :buttons
      # @option body [String] :big_picture
      # @option body [Hash{String => String}] :ios_attachments
      # @option body [String] :ios_sound
      # @option body [String] :ios_badge_type Değerler: "None", "SetTo", "Increase".
      # @option body [Integer] :ios_badge_count
      # @option body [String] :ios_interruption_level Değerler: "passive", "active", "time-sensitive", "critical".
      # @option body [String] :ios_category
      # @option body [String] :android_channel_id
      # @option body [String] :android_group
      # @option body [String] :android_sound
      # @option body [String] :chrome_web_icon
      # @option body [String] :chrome_web_image
      # @option body [String] :chrome_web_badge
      # @option body [String] :web_push_topic
      # @option body [String] :name
      # @option body [String] :small_icon
      # @option body [String] :large_icon
      # @option body [String] :android_accent_color
      # @option body [Integer] :android_visibility Değerler: 1, 0, -1.
      # @option body [Array<Hash>] :web_buttons
      # @option body [Boolean] :require_interaction
      # @option body [Float] :ios_relevance_score
      # @option body [String] :thread_id
      # @option body [String] :target_content_identifier
      # @option body [Integer] :throttle_rate_per_minute
      # @option body [Array<String>] :sms_media_urls
      # @option body [Boolean] :content_available
      # @option body [Boolean] :mutable_content
      # @option body [String] :collapse_id
      # @option body [Integer] :priority Değerler: 5, 10.
      # @option body [Integer] :ttl
      # @option body [String] :send_after
      # @option body [String] :delayed_option Değerler: "timezone", "optimized".
      # @option body [String] :delivery_time_of_day
      # @option body [String] :template_id
      # @option body [Hash{String => Object}] :custom_data
      # @option body [String] :email_subject
      # @option body [String] :email_body
      # @option body [String] :email_mjml
      # @option body [String] :email_preheader
      # @option body [String] :email_from_name
      # @option body [String] :email_from_address
      # @option body [String] :email_reply_to_address
      # @option body [Boolean] :disable_email_click_tracking
      # @option body [String] :sms_from
      # @option body [Boolean] :disable_sms_link_shortening
      # @option body [Boolean] :add_to_inbox
      # @option body [Integer] :inbox_ttl
      # @option body [Boolean] :frequency_cap_exempt
      # @option body [Boolean] :quiet_hours_exempt
      # @option body [Boolean] :one_per_user
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param idempotency_key [String, nil] Idempotency-Key başlığı (boşsa otomatik UUID).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] CreateNotificationResult
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, idempotency_key: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/notifications",
          path_params: {},
          body: body,
          app_id: app_id,
          body_app_id: true,
          idempotent: true,
          idempotency_key: idempotency_key,
          request_options: request_options
        )
      end

      # Mesaj listesi (app_id zorunlu)
      #
      # +GET /v1/notifications+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param source [String, nil] "source" sorgu parametresi. Değerler: "campaign", "api", "journey", "test".
      # @param kind [String, nil] "kind" sorgu parametresi. Değerler: "campaign", "api", "journey", "test".
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "queued", "processing", "completed", "cancelled", "failed".
      # @param sort [String, nil] "sort" sorgu parametresi. Değerler: "created_at", "-created_at".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] MessageList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, source: nil, kind: nil, status: nil, sort: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/notifications",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "source" => source, "kind" => kind, "status" => status, "sort" => sort },
          app_id: app_id,
          query_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, source: nil, kind: nil, status: nil, sort: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, source: source, kind: kind, status: status, sort: sort, app_id: app_id, request_options: request_options)
        end
      end

      # Kaydedilmemiş hedef için alıcı sayımı (kanal kırılımıyla; gönderim yapmaz)
      #
      # +POST /v1/notifications/estimate+
      #
      # @param body [Hash] İstek gövdesi (EstimateRecipientsDto).
      # @option body [String] :app_id
      # @option body [Hash] :target Zorunlu.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] RecipientEstimate
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def estimate(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/notifications/estimate",
          path_params: {},
          body: body,
          app_id: app_id,
          body_app_id: true,
          request_options: request_options
        )
      end

      # Mesaj durumu ve sayaçları
      #
      # +GET /v1/notifications/{messageId}+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Message
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(message_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/notifications/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          request_options: request_options
        )
      end

      # Zamanlanmış/kuyruktaki mesajı iptal et
      #
      # +DELETE /v1/notifications/{messageId}+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Message
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def cancel(message_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/notifications/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          query_app_id: true,
          request_options: request_options
        )
      end

      # Abone bazlı teslimat sonuçları (cursor)
      #
      # +GET /v1/notifications/{messageId}/deliveries+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "pending", "sent", "delivered", "failed", "bounced", "suppressed", "expired", "cancelled".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] DeliveryList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def deliveries(message_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/notifications/{messageId}/deliveries",
          path_params: { "messageId" => message_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          query_app_id: true,
          request_options: request_options
        )
      end

      # +deliveries+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def deliveries_all(message_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          deliveries(message_id, limit: limit, cursor: next_cursor, status: status, app_id: app_id, request_options: request_options)
        end
      end

      # Bildirim geçmişi CSV işi (teslimatlar; tamamlanınca download_url)
      #
      # +GET /v1/notifications/{messageId}/history+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Export
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def history(message_id, request_options: nil)
        @client._call(
          "GET",
          "/v1/notifications/{messageId}/history",
          path_params: { "messageId" => message_id },
          request_options: request_options
        )
      end

      # Mesaj olayları CSV işi (teslim, açılma, tıklama, bounce…; tamamlanınca download_url)
      #
      # +POST /v1/notifications/{messageId}/export-events+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Export
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def export_events(message_id, request_options: nil)
        @client._call(
          "POST",
          "/v1/notifications/{messageId}/export-events",
          path_params: { "messageId" => message_id },
          request_options: request_options
        )
      end
    end

    # Kullanıcı oluşturma/güncelleme (tag, özellik), arama ve abonelik ekleme.
    class UsersResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Kullanıcı listesi
      #
      # +GET /v1/apps/{appId}/users+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param sort [String, nil] "sort" sorgu parametresi. Değerler: "last_active_at", "-last_active_at".
      # @param q [String, nil] "q" sorgu parametresi.
      # @param tag [String, nil] "tag" sorgu parametresi.
      # @param last_active_after [String, nil] "last_active_after" sorgu parametresi.
      # @param last_active_before [String, nil] "last_active_before" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, sort: nil, q: nil, tag: nil, last_active_after: nil, last_active_before: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/users",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "sort" => sort, "q" => q, "tag" => tag, "last_active_after" => last_active_after, "last_active_before" => last_active_before },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, sort: nil, q: nil, tag: nil, last_active_after: nil, last_active_before: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, sort: sort, q: q, tag: tag, last_active_after: last_active_after, last_active_before: last_active_before, app_id: app_id, request_options: request_options)
        end
      end

      # Kullanıcı oluştur/güncelle (external_id ile, isteğe bağlı aboneliklerle)
      #
      # +POST /v1/apps/{appId}/users+
      #
      # @param body [Hash] İstek gövdesi (UpsertUserDto).
      # @option body [Object] :identity
      # @option body [String] :external_id
      # @option body [Hash{String => Object}] :properties
      # @option body [Hash{String => String}] :tags
      # @option body [Array<Hash>] :subscriptions
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param idempotency_key [String, nil] Idempotency-Key başlığı (boşsa otomatik UUID).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def upsert(body, app_id: nil, idempotency_key: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/users",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          idempotent: true,
          idempotency_key: idempotency_key,
          request_options: request_options
        )
      end

      # Segment tanımı ile kullanıcı arama
      #
      # +POST /v1/apps/{appId}/users/search+
      #
      # @param body [Hash] İstek gövdesi (UsersSearchBody).
      # @option body [Hash] :definition Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      # @option body [Integer] :limit
      # @option body [String] :cursor
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def search(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/users/search",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Alias ile kullanıcı (hs_id, external_id veya özel etiket)
      #
      # +GET /v1/apps/{appId}/users/by/{label}/{value}+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get_by_alias(label, value, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Tag/property merge-patch ve deltas
      #
      # +PATCH /v1/apps/{appId}/users/by/{label}/{value}+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param body [Hash] İstek gövdesi (PatchUserDto).
      # @option body [Hash{String => Object}] :properties
      # @option body [Hash{String => String}] :tags
      # @option body [Hash] :deltas
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(label, value, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kullanıcıyı sil (abonelikler silinir, olaylar anonimleşir)
      #
      # +DELETE /v1/apps/{appId}/users/by/{label}/{value}+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(label, value, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/users/by/{label}/{value}",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kullanıcının tüm kimlikleri (hs_id, external_id, alias'lar)
      #
      # +GET /v1/apps/{appId}/users/by/{label}/{value}/identity+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserIdentity
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get_identity(label, value, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/users/by/{label}/{value}/identity",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kullanıcıya abonelik ekle
      #
      # +POST /v1/apps/{appId}/users/by/{label}/{value}/subscriptions+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param body [Hash] İstek gövdesi (AddSubscriptionDto).
      # @option body [String] :channel Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @option body [String] :token Zorunlu.
      # @option body [Hash] :device
      # @option body [String] :status Değerler: "subscribed", "unsubscribed".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Subscription
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def add_subscription(label, value, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/users/by/{label}/{value}/subscriptions",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kullanıcı verisini dışa aktar (KVKK/GDPR veri taşınabilirliği): profil, alias, abonelik, son olaylar
      #
      # +GET /v1/apps/{appId}/users/by/{label}/{value}/export+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserExport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def export_user(label, value, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/users/by/{label}/{value}/export",
          path_params: { "label" => label, "value" => value },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kullanıcının bildirim kutusu
      #
      # +GET /v1/apps/{appId}/users/by/{label}/{value}/inbox+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param include_archived [String, nil] "include_archived" sorgu parametresi. Değerler: "true", "false".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InboxPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list_inbox(label, value, limit: nil, cursor: nil, include_archived: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/users/by/{label}/{value}/inbox",
          path_params: { "label" => label, "value" => value },
          query: { "limit" => limit, "cursor" => cursor, "include_archived" => include_archived },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list_inbox+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_inbox_all(label, value, limit: nil, cursor: nil, include_archived: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list_inbox(label, value, limit: limit, cursor: next_cursor, include_archived: include_archived, app_id: app_id, request_options: request_options)
        end
      end

      # Bildirim kutusu öğesini okundu işaretle
      #
      # +POST /v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}/read+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param item_id [String] {itemId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InboxItem
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def read_inbox_item(label, value, item_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}/read",
          path_params: { "label" => label, "value" => value, "itemId" => item_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Bildirim kutusu öğesini kaldır (arşivle)
      #
      # +DELETE /v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param item_id [String] {itemId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def archive_inbox_item(label, value, item_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/users/by/{label}/{value}/inbox/{itemId}",
          path_params: { "label" => label, "value" => value, "itemId" => item_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Kullanıcı kimlikleri (alias): ekleme ve kaldırma.
    class AliasesResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Alias ekle
      #
      # +PATCH /v1/apps/{appId}/users/by/{label}/{value}/identity+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param body [Hash] İstek gövdesi (AddAliasDto).
      # @option body [Hash{String => String}] :identity Zorunlu.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def add(label, value, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/users/by/{label}/{value}/identity",
          path_params: { "label" => label, "value" => value },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Alias kaldır
      #
      # +DELETE /v1/apps/{appId}/users/by/{label}/{value}/identity/{aliasLabel}+
      #
      # @param label [String] {label} yol parametresi.
      # @param value [String] {value} yol parametresi.
      # @param alias_label [String] {aliasLabel} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(label, value, alias_label, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/users/by/{label}/{value}/identity/{aliasLabel}",
          path_params: { "label" => label, "value" => value, "aliasLabel" => alias_label },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Abonelik (cihaz/e-posta/SMS) okuma, güncelleme, silme ve sahip atama.
    class SubscriptionsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Aboneliğin sahibi kullanıcının kimlikleri
      #
      # +GET /v1/apps/{appId}/subscriptions/{subscriptionId}/user/identity+
      #
      # @param subscription_id [String] {subscriptionId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] UserIdentity
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def subscription_identity(subscription_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/subscriptions/{subscriptionId}/user/identity",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Aboneliği kanal + token ile güncelle (APNs/FCM token, e-posta, E.164 telefon)
      #
      # +PATCH /v1/apps/{appId}/subscriptions/by-token/{channel}/{token}+
      #
      # @param channel [String] {channel} yol parametresi.
      # @param token [String] {token} yol parametresi.
      # @param body [Hash] İstek gövdesi (PatchSubscriptionDto).
      # @option body [String] :token
      # @option body [Hash] :device
      # @option body [String] :status Değerler: "subscribed", "unsubscribed".
      # @option body [Boolean] :test_device
      # @option body [String] :test_device_name
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Subscription
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def patch_subscription_by_token(channel, token, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/subscriptions/by-token/{channel}/{token}",
          path_params: { "channel" => channel, "token" => token },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Abonelik detayı
      #
      # +GET /v1/apps/{appId}/subscriptions/{subscriptionId}+
      #
      # @param subscription_id [String] {subscriptionId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Subscription
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(subscription_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Abonelik güncelle
      #
      # +PATCH /v1/apps/{appId}/subscriptions/{subscriptionId}+
      #
      # @param subscription_id [String] {subscriptionId} yol parametresi.
      # @param body [Hash] İstek gövdesi (PatchSubscriptionDto).
      # @option body [String] :token
      # @option body [Hash] :device
      # @option body [String] :status Değerler: "subscribed", "unsubscribed".
      # @option body [Boolean] :test_device
      # @option body [String] :test_device_name
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Subscription
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(subscription_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Aboneliği sil
      #
      # +DELETE /v1/apps/{appId}/subscriptions/{subscriptionId}+
      #
      # @param subscription_id [String] {subscriptionId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(subscription_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/subscriptions/{subscriptionId}",
          path_params: { "subscriptionId" => subscription_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Aboneliği external_id ile kullanıcıya bağla
      #
      # +POST /v1/apps/{appId}/subscriptions/{subscriptionId}/owner+
      #
      # @param subscription_id [String] {subscriptionId} yol parametresi.
      # @param body [Hash] İstek gövdesi (SetOwnerDto).
      # @option body [String] :external_id Zorunlu.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Subscription
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def set_owner(subscription_id, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/subscriptions/{subscriptionId}/owner",
          path_params: { "subscriptionId" => subscription_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Özel olay gönderimi ve olay tanımları.
    class EventsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Toplu olay gönder (en fazla 500)
      #
      # +POST /v1/apps/{appId}/events+
      #
      # @param body [Hash] İstek gövdesi (ApiEventsDto).
      # @option body [Array<Hash>] :events Zorunlu.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EventsAccepted
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def send(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/events",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Olay tanımları
      #
      # +GET /v1/apps/{appId}/events/definitions+
      #
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EventDefinitionList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list_definitions(app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/events/definitions",
          path_params: {},
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Olay detayı
      #
      # +GET /v1/apps/{appId}/events/definitions/{name}+
      #
      # @param name [String] {name} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EventDefinitionDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get_definition(name, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/events/definitions/{name}",
          path_params: { "name" => name },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Görünen ad / dönüşüm işareti
      #
      # +PATCH /v1/apps/{appId}/events/definitions/{name}+
      #
      # @param name [String] {name} yol parametresi.
      # @param body [Hash] İstek gövdesi (PatchEventDefinitionDto).
      # @option body [String] :display_name
      # @option body [Boolean] :is_conversion
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EventDefinition
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update_definition(name, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/events/definitions/{name}",
          path_params: { "name" => name },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Segment yönetimi, önizleme ve kitle tahmini.
    class SegmentsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Segment listesi
      #
      # +GET /v1/apps/{appId}/segments+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param q [String, nil] "q" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SegmentPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, q: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/segments",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, q: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, q: q, app_id: app_id, request_options: request_options)
        end
      end

      # Segment oluştur
      #
      # +POST /v1/apps/{appId}/segments+
      #
      # @param body [Hash] İstek gövdesi (SegmentsCreateBody).
      # @option body [String] :name Zorunlu.
      # @option body [String] :description
      # @option body [Hash] :definition Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      # @option body [Boolean] :is_dynamic
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Segment
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/segments",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Tanım ile sayım ve örnek kullanıcılar
      #
      # +POST /v1/apps/{appId}/segments/preview+
      #
      # @param body [Hash] İstek gövdesi (SegmentsPreviewBody).
      # @option body [Hash] :definition Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      # @option body [Integer] :limit
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SegmentPreview
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def preview(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/segments/preview",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Segment detayı
      #
      # +GET /v1/apps/{appId}/segments/{segmentId}+
      #
      # @param segment_id [String] {segmentId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Segment
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(segment_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Segment güncelle
      #
      # +PATCH /v1/apps/{appId}/segments/{segmentId}+
      #
      # @param segment_id [String] {segmentId} yol parametresi.
      # @param body [Hash] İstek gövdesi (SegmentsUpdateBody).
      # @option body [String] :name
      # @option body [String] :description
      # @option body [Hash] :definition Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      # @option body [Boolean] :is_dynamic
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Segment
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(segment_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Segment sil
      #
      # +DELETE /v1/apps/{appId}/segments/{segmentId}+
      #
      # @param segment_id [String] {segmentId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(segment_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/segments/{segmentId}",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Segmenti kullanan kampanyalar
      #
      # +GET /v1/apps/{appId}/segments/{segmentId}/campaigns+
      #
      # @param segment_id [String] {segmentId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SegmentCampaigns
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def used_by(segment_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/segments/{segmentId}/campaigns",
          path_params: { "segmentId" => segment_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Tahmini sayım
      #
      # +POST /v1/apps/{appId}/segments/{segmentId}/estimate+
      #
      # @param segment_id [String] {segmentId} yol parametresi.
      # @param force [String] "force" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SegmentEstimate
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def estimate(segment_id, force:, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/segments/{segmentId}/estimate",
          path_params: { "segmentId" => segment_id },
          query: { "force" => force },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Şablon yönetimi, sürümler ve önizleme.
    class TemplatesResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Şablon listesi
      #
      # +GET /v1/apps/{appId}/templates+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param q [String, nil] "q" sorgu parametresi.
      # @param channel [String, nil] "channel" sorgu parametresi. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] TemplatePage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, q: nil, channel: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/templates",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q, "channel" => channel },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, q: nil, channel: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, q: q, channel: channel, app_id: app_id, request_options: request_options)
        end
      end

      # Şablon oluştur
      #
      # +POST /v1/apps/{appId}/templates+
      #
      # @param body [Hash] İstek gövdesi (CreateTemplateDto).
      # @option body [String] :name Zorunlu.
      # @option body [String] :channel Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @option body [Array<String>] :tags
      # @option body [Hash] :content Zorunlu.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Template
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/templates",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Şablon detayı
      #
      # +GET /v1/apps/{appId}/templates/{templateId}+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Template
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(template_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Şablon güncelle
      #
      # +PATCH /v1/apps/{appId}/templates/{templateId}+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param body [Hash] İstek gövdesi (UpdateTemplateDto).
      # @option body [String] :name
      # @option body [String] :channel Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @option body [Array<String>] :tags
      # @option body [Hash] :content
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Template
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(template_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Şablon sil
      #
      # +DELETE /v1/apps/{appId}/templates/{templateId}+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(template_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/templates/{templateId}",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Sürüm geçmişi
      #
      # +GET /v1/apps/{appId}/templates/{templateId}/versions+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] TemplateVersionList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def versions(template_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/templates/{templateId}/versions",
          path_params: { "templateId" => template_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Şablonu aynı organizasyondaki başka bir app'e kopyala (org anahtarı gerekir)
      #
      # +POST /v1/apps/{appId}/templates/{templateId}/copy+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param body [Hash] İstek gövdesi (CopyTemplateDto).
      # @option body [String] :target_app_id Zorunlu.
      # @option body [String] :name
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Template
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def copy(template_id, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/templates/{templateId}/copy",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Şablonu örnek verilerle render et
      #
      # +POST /v1/apps/{appId}/templates/{templateId}/render+
      #
      # @param template_id [String] {templateId} yol parametresi.
      # @param body [Hash] İstek gövdesi (RenderTemplateDto).
      # @option body [String] :channel Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @option body [String] :language
      # @option body [Hash] :user
      # @option body [Hash{String => Object}] :custom_data
      # @option body [Hash] :content
      # @option body [Integer] :version
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] RenderPreview
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def render(template_id, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/templates/{templateId}/render",
          path_params: { "templateId" => template_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Kampanya yaşam döngüsü (zamanlama, gönderim, duraklatma, onay) ve istatistikler.
    class CampaignsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Kampanya listesi
      #
      # +GET /v1/apps/{appId}/campaigns+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param q [String, nil] "q" sorgu parametresi.
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "draft", "scheduled", "running", "paused", "completed", "cancelled", "failed".
      # @param type [String, nil] "type" sorgu parametresi. Değerler: "one_time", "scheduled", "recurring", "automated", "transactional".
      # @param channel [String, nil] "channel" sorgu parametresi. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] CampaignPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, q: nil, status: nil, type: nil, channel: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/campaigns",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "q" => q, "status" => status, "type" => type, "channel" => channel },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, q: nil, status: nil, type: nil, channel: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, q: q, status: status, type: type, channel: channel, app_id: app_id, request_options: request_options)
        end
      end

      # Kampanya oluştur
      #
      # +POST /v1/apps/{appId}/campaigns+
      #
      # @param body [Hash] İstek gövdesi (CampaignsCreateBody).
      # @option body [String] :name
      # @option body [String] :type Değerler: "one_time", "scheduled", "recurring".
      # @option body [Hash] :audience
      # @option body [Hash{String => Object}] :content messages.content ile aynı şema (headings, contents, url, buttons…)
      # @option body [String] :template_id
      # @option body [Integer] :template_version
      # @option body [Hash] :delivery
      # @option body [Hash] :recurrence
      # @option body [String] :send_at
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kampanya detayı
      #
      # +GET /v1/apps/{appId}/campaigns/{campaignId}+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kampanya güncelle
      #
      # +PATCH /v1/apps/{appId}/campaigns/{campaignId}+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param body [Hash] İstek gövdesi (CampaignsUpdateBody).
      # @option body [String] :name
      # @option body [String] :type Değerler: "one_time", "scheduled", "recurring".
      # @option body [Hash] :audience
      # @option body [Hash{String => Object}] :content messages.content ile aynı şema (headings, contents, url, buttons…)
      # @option body [String] :template_id
      # @option body [Integer] :template_version
      # @option body [Hash] :delivery
      # @option body [Hash] :recurrence
      # @option body [String] :send_at
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(campaign_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kampanya sil
      #
      # +DELETE /v1/apps/{appId}/campaigns/{campaignId}+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/campaigns/{campaignId}",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Zamanla
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/schedule+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param body [Hash] İstek gövdesi (ScheduleCampaignDto).
      # @option body [String] :send_at
      # @option body [Hash] :recurrence
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def schedule(campaign_id, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/schedule",
          path_params: { "campaignId" => campaign_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Hemen gönder
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/send+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def send(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/send",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Duraklat
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/pause+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def pause(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/pause",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Sürdür
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/resume+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def resume(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/resume",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # İptal
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/cancel+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def cancel(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/cancel",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Çoğalt
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/duplicate+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def duplicate(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/duplicate",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Onayla
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/approve+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def approve(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/approve",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # İstatistikler
      #
      # +GET /v1/apps/{appId}/campaigns/{campaignId}/stats+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] CampaignStats
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def stats(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/campaigns/{campaignId}/stats",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Abone bazlı teslimatlar
      #
      # +GET /v1/apps/{appId}/campaigns/{campaignId}/deliveries+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "pending", "sent", "delivered", "failed", "bounced", "suppressed", "expired", "cancelled".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] DeliveryList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def deliveries(campaign_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/campaigns/{campaignId}/deliveries",
          path_params: { "campaignId" => campaign_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +deliveries+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def deliveries_all(campaign_id, limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          deliveries(campaign_id, limit: limit, cursor: next_cursor, status: status, app_id: app_id, request_options: request_options)
        end
      end

      # Başarısız teslimatlara yeniden gönder
      #
      # +POST /v1/apps/{appId}/campaigns/{campaignId}/resend-failed+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Campaign
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def resend_failed(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/campaigns/{campaignId}/resend-failed",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kampanya çalıştırmaları
      #
      # +GET /v1/apps/{appId}/campaigns/{campaignId}/messages+
      #
      # @param campaign_id [String] {campaignId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] MessageList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def messages(campaign_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/campaigns/{campaignId}/messages",
          path_params: { "campaignId" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # E-posta/SMS gönderim engeli (suppression) listesi.
    class SuppressionsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Suppression list (e-posta/SMS gönderilmeyecek adresler; kanal/neden/değer filtresi)
      #
      # +GET /v1/apps/{appId}/suppressions+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param channel [String, nil] "channel" sorgu parametresi. Değerler: "email", "sms".
      # @param reason [String, nil] "reason" sorgu parametresi. Değerler: "bounce", "complaint", "manual", "unsubscribe_link", "stop".
      # @param value [String, nil] "value" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SuppressionPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, channel: nil, reason: nil, value: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/suppressions",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "channel" => channel, "reason" => reason, "value" => value },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, channel: nil, reason: nil, value: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, channel: channel, reason: reason, value: value, app_id: app_id, request_options: request_options)
        end
      end

      # Adres ekle (manuel engel; değer saklanmaz, özet + maskeli gösterim)
      #
      # +POST /v1/apps/{appId}/suppressions+
      #
      # @param body [Hash] İstek gövdesi (CreateSuppressionDto).
      # @option body [String] :channel Zorunlu. Değerler: "email", "sms".
      # @option body [String] :value Zorunlu.
      # @option body [String] :reason Değerler: "manual", "bounce", "complaint", "unsubscribe_link", "stop".
      # @option body [String] :expires_at
      # @option body [String] :note
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Suppression
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/suppressions",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kaydı kaldır (adres yeniden gönderim alabilir)
      #
      # +DELETE /v1/apps/{appId}/suppressions/{suppressionId}+
      #
      # @param suppression_id [String] {suppressionId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(suppression_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/suppressions/{suppressionId}",
          path_params: { "suppressionId" => suppression_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Veri dışa aktarma işleri.
    class ExportsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Export işi başlat
      #
      # +POST /v1/apps/{appId}/exports+
      #
      # @param body [Hash] İstek gövdesi (CreateExportDto).
      # @option body [String] :type Zorunlu. Değerler: "users", "subscriptions", "events", "deliveries", "message_events".
      # @option body [Hash] :filters
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Export
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/exports",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Export işleri
      #
      # +GET /v1/apps/{appId}/exports+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ExportList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/exports",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, app_id: app_id, request_options: request_options)
        end
      end

      # Export durumu (download_url)
      #
      # +GET /v1/apps/{appId}/exports/{exportId}+
      #
      # @param export_id [String] {exportId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Export
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(export_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/exports/{exportId}",
          path_params: { "exportId" => export_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Veri içe aktarma işleri (CSV, multipart).
    class ImportsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Import işi başlat (multipart: type, file)
      #
      # +POST /v1/apps/{appId}/imports+
      #
      # @param type [String] Zorunlu. Değerler: "eski sağlayıcı_players", "csv_users".
      # @param file [IO, String, Array(String, IO), Array(String, String, String)] Zorunlu. CSV dosyası (UTF-8, en fazla 50 MB)
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Import
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(type, file, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/imports",
          path_params: {},
          form: { "type" => type },
          files: { "file" => file },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Import işleri
      #
      # +GET /v1/apps/{appId}/imports+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ImportList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/imports",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, app_id: app_id, request_options: request_options)
        end
      end

      # Import durumu
      #
      # +GET /v1/apps/{appId}/imports/{importId}+
      #
      # @param import_id [String] {importId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Import
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(import_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/imports/{importId}",
          path_params: { "importId" => import_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Giden webhook uç noktaları, teslimatlar ve yeniden gönderim.
    class WebhooksResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Webhook endpoint'leri
      #
      # +GET /v1/apps/{appId}/webhooks+
      #
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/webhooks",
          path_params: {},
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Endpoint oluştur (secret yalnızca bu yanıtta döner)
      #
      # +POST /v1/apps/{appId}/webhooks+
      #
      # @param body [Hash] İstek gövdesi (CreateWebhookDto).
      # @option body [String] :url Zorunlu.
      # @option body [String] :description
      # @option body [Array<String>] :events Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed".
      # @option body [Hash] :event_filters
      # @option body [Boolean] :batch
      # @option body [Hash{String => String}] :headers
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookWithSecret
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/webhooks",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Endpoint detayı
      #
      # +GET /v1/apps/{appId}/webhooks/{webhookId}+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Webhook
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(webhook_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Endpoint güncelle (URL, olaylar, batch, başlıklar, etkinleştir/durdur)
      #
      # +PATCH /v1/apps/{appId}/webhooks/{webhookId}+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param body [Hash] İstek gövdesi (UpdateWebhookDto).
      # @option body [String] :url
      # @option body [String] :description
      # @option body [Array<String>] :events Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed".
      # @option body [Hash] :event_filters
      # @option body [Boolean] :batch
      # @option body [Hash{String => String}] :headers
      # @option body [String] :status Değerler: "active", "disabled".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Webhook
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(webhook_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Endpoint sil
      #
      # +DELETE /v1/apps/{appId}/webhooks/{webhookId}+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(webhook_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/webhooks/{webhookId}",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Secret rotasyonu (eski secret 24 saat ikinci imza olarak gönderilir)
      #
      # +POST /v1/apps/{appId}/webhooks/{webhookId}/rotate-secret+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookWithSecret
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def rotate_secret(webhook_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/webhooks/{webhookId}/rotate-secret",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Test olayı gönder (anında, sonuç döner)
      #
      # +POST /v1/apps/{appId}/webhooks/{webhookId}/test+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookDeliveryDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def test(webhook_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/webhooks/{webhookId}/test",
          path_params: { "webhookId" => webhook_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Teslim geçmişi (cursor; durum/olay türü filtresi)
      #
      # +GET /v1/apps/{appId}/webhooks/{webhookId}/deliveries+
      #
      # @param webhook_id [String] {webhookId} yol parametresi.
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "pending", "success", "failed", "dead".
      # @param event_type [String, nil] "event_type" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookDeliveryPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def deliveries(webhook_id, limit: nil, cursor: nil, status: nil, event_type: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/webhooks/{webhookId}/deliveries",
          path_params: { "webhookId" => webhook_id },
          query: { "limit" => limit, "cursor" => cursor, "status" => status, "event_type" => event_type },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +deliveries+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def deliveries_all(webhook_id, limit: nil, cursor: nil, status: nil, event_type: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          deliveries(webhook_id, limit: limit, cursor: next_cursor, status: status, event_type: event_type, app_id: app_id, request_options: request_options)
        end
      end

      # Teslimi yeniden gönder (aynı olay kimliğiyle)
      #
      # +POST /v1/apps/{appId}/webhooks/deliveries/{deliveryId}/replay+
      #
      # @param delivery_id [String] {deliveryId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] WebhookDeliveryDetail
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def replay(delivery_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/webhooks/deliveries/{deliveryId}/replay",
          path_params: { "deliveryId" => delivery_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Kanal (APNs, FCM, Web Push, e-posta, SMS) yapılandırması ve doğrulaması.
    class ChannelsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Kanal yapılandırmaları
      #
      # +GET /v1/apps/{appId}/channels+
      #
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ChannelList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/channels",
          path_params: {},
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Kimlik bilgisi yükle (APNs p8, FCM servis hesabı, VAPID, mock)
      #
      # +PUT /v1/apps/{appId}/channels/{channel}+
      #
      # @param channel [String] {channel} yol parametresi.
      # @param body [Object] İstek gövdesi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ChannelConfig
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def upsert(channel, body, app_id: nil, request_options: nil)
        @client._call(
          "PUT",
          "/v1/apps/{appId}/channels/{channel}",
          path_params: { "channel" => channel },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Sağlayıcıya test bağlantısı
      #
      # +POST /v1/apps/{appId}/channels/{channel}/validate+
      #
      # @param channel [String] {channel} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ChannelValidation
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def validate(channel, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/channels/{channel}/validate",
          path_params: { "channel" => channel },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Analitik raporları.
    class AnalyticsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Genel bakış KPI
      #
      # +GET /v1/apps/{appId}/analytics/overview+
      #
      # @param range [String, nil] "range" sorgu parametresi. Değerler: "7d", "30d".
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] OverviewStats
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def overview(range: nil, from: nil, to: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/overview",
          path_params: {},
          query: { "range" => range, "from" => from, "to" => to },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Teslimat raporu
      #
      # +GET /v1/apps/{appId}/analytics/messages+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param group_by [String, nil] "group_by" sorgu parametresi. Değerler: "day", "channel", "campaign".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] MessagesReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def messages(from: nil, to: nil, compare: nil, format: nil, group_by: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/messages",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "group_by" => group_by },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Abonelik büyümesi
      #
      # +GET /v1/apps/{appId}/analytics/subscriptions+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] SubscriptionsReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def subscriptions(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/subscriptions",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Olay hacmi
      #
      # +GET /v1/apps/{appId}/analytics/events+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param name [String, nil] "name" sorgu parametresi.
      # @param group_by [String, nil] "group_by" sorgu parametresi. Değerler: "day", "name".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EventsReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def events(from: nil, to: nil, compare: nil, format: nil, name: nil, group_by: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/events",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "name" => name, "group_by" => group_by },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Dönüşüm/atribüsyon
      #
      # +GET /v1/apps/{appId}/analytics/conversions+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param campaign_id [String, nil] "campaign_id" sorgu parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ConversionsReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def conversions(from: nil, to: nil, compare: nil, format: nil, campaign_id: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/conversions",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format, "campaign_id" => campaign_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Funnel
      #
      # +POST /v1/apps/{appId}/analytics/funnels+
      #
      # @param body [Hash] İstek gövdesi (FunnelBodyDto).
      # @option body [Array<Hash>] :steps Zorunlu.
      # @option body [String] :from
      # @option body [String] :to
      # @option body [Integer] :window_hours
      # @option body [Boolean] :compare
      # @option body [String] :format Değerler: "json", "csv".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] FunnelReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def funnel(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/analytics/funnels",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Sağlayıcı sağlığı
      #
      # +GET /v1/apps/{appId}/analytics/providers+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ProvidersReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def providers(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/providers",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Etkileşim ısı haritası
      #
      # +GET /v1/apps/{appId}/analytics/engagement+
      #
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param compare [String, nil] "compare" sorgu parametresi. Değerler: "true", "false".
      # @param format [String, nil] "format" sorgu parametresi. Değerler: "json", "csv".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] EngagementReport
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def engagement(from: nil, to: nil, compare: nil, format: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/analytics/engagement",
          path_params: {},
          query: { "from" => from, "to" => to, "compare" => compare, "format" => format },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # App listesi ve ayarları.
    class AppsResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # App listesi (org geneli admin anahtarı)
      #
      # +GET /v1/apps+
      #
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] AppList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(request_options: nil)
        @client._call(
          "GET",
          "/v1/apps",
          path_params: {},
          request_options: request_options
        )
      end

      # App oluştur (org geneli admin anahtarı)
      #
      # +POST /v1/apps+
      #
      # @param body [Hash] İstek gövdesi (CreateAppDto).
      # @option body [String] :name Zorunlu.
      # @option body [String] :slug
      # @option body [Hash] :platform_flags
      # @option body [String] :default_language
      # @option body [String] :timezone
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] App
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps",
          path_params: {},
          body: body,
          request_options: request_options
        )
      end

      # App detayı
      #
      # +GET /v1/apps/{appId}+
      #
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] App
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}",
          path_params: {},
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # App ayarlarını güncelle
      #
      # +PATCH /v1/apps/{appId}+
      #
      # @param body [Hash] İstek gövdesi (UpdateAppDto).
      # @option body [String] :name
      # @option body [Hash] :platform_flags
      # @option body [String] :icon_url
      # @option body [String] :default_language
      # @option body [String] :timezone
      # @option body [Hash] :settings
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] App
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # Organizasyon, üyeler ve denetim kayıtları.
    class OrganizationResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # Anahtarın ait olduğu organizasyon (org geneli admin anahtarı)
      #
      # +GET /v1/organization+
      #
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Org
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(request_options: nil)
        @client._call(
          "GET",
          "/v1/organization",
          path_params: {},
          request_options: request_options
        )
      end

      # Organizasyon üyeleri (org geneli admin anahtarı)
      #
      # +GET /v1/organization/members+
      #
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] MemberList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def members(request_options: nil)
        @client._call(
          "GET",
          "/v1/organization/members",
          path_params: {},
          request_options: request_options
        )
      end

      # Audit log (org geneli admin anahtarı; action/actor/app/tarih filtreleri, cursor)
      #
      # +GET /v1/organization/audit-logs+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param action [String, nil] "action" sorgu parametresi.
      # @param actor_id [String, nil] "actor_id" sorgu parametresi.
      # @param app_id_ [String, nil] "app_id" sorgu parametresi.
      # @param from [String, nil] "from" sorgu parametresi.
      # @param to [String, nil] "to" sorgu parametresi.
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] AuditPage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def audit_logs(limit: nil, cursor: nil, action: nil, actor_id: nil, app_id_: nil, from: nil, to: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/organization/audit-logs",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "action" => action, "actor_id" => actor_id, "app_id" => app_id_, "from" => from, "to" => to },
          request_options: request_options
        )
      end

      # +audit_logs+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def audit_logs_all(limit: nil, cursor: nil, action: nil, actor_id: nil, app_id_: nil, from: nil, to: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          audit_logs(limit: limit, cursor: next_cursor, action: action, actor_id: actor_id, app_id_: app_id_, from: from, to: to, request_options: request_options)
        end
      end
    end

    # apiKeys kaynağı.
    class ApiKeysResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # App'e bağlı API anahtarları
      #
      # +GET /v1/apps/{appId}/api-keys+
      #
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ApiKeyList
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/api-keys",
          path_params: {},
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # App'e bağlı API anahtarı oluştur (ham anahtar yalnızca bu yanıtta)
      #
      # +POST /v1/apps/{appId}/api-keys+
      #
      # @param body [Hash] İstek gövdesi (CreateAppApiKeyDto).
      # @option body [String] :name Zorunlu.
      # @option body [Array<String>] :scopes Zorunlu. Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read".
      # @option body [String] :environment Değerler: "live", "test".
      # @option body [String] :expires_at
      # @option body [Array<String>] :ip_allowlist
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] CreatedApiKey
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/api-keys",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Anahtarı güncelle (ad, kapsam, IP izin listesi, bitiş)
      #
      # +PATCH /v1/apps/{appId}/api-keys/{keyId}+
      #
      # @param key_id [String] {keyId} yol parametresi.
      # @param body [Hash] İstek gövdesi (UpdateApiKeyDto).
      # @option body [String] :name
      # @option body [Array<String>] :scopes Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read".
      # @option body [Array<String>] :ip_allowlist
      # @option body [String] :expires_at
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] ApiKey
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(key_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/api-keys/{keyId}",
          path_params: { "keyId" => key_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Anahtarı iptal et
      #
      # +DELETE /v1/apps/{appId}/api-keys/{keyId}+
      #
      # @param key_id [String] {keyId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def revoke(key_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/api-keys/{keyId}",
          path_params: { "keyId" => key_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Anahtarı döndür (eski değer anında geçersiz)
      #
      # +POST /v1/apps/{appId}/api-keys/{keyId}/rotate+
      #
      # @param key_id [String] {keyId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] CreatedApiKey
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def rotate(key_id, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/api-keys/{keyId}/rotate",
          path_params: { "keyId" => key_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # inAppMessages kaynağı.
    class InAppMessagesResource
      # @param client [HeroSignal::Client]
      def initialize(client)
        @client = client
      end

      # In-app mesajlar (durum filtresi; istatistik dahil)
      #
      # +GET /v1/apps/{appId}/in-app-messages+
      #
      # @param limit [Integer, nil] "limit" sorgu parametresi.
      # @param cursor [String, nil] "cursor" sorgu parametresi.
      # @param status [String, nil] "status" sorgu parametresi. Değerler: "draft", "active", "paused", "archived".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InAppMessagePage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def list(limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/in-app-messages",
          path_params: {},
          query: { "limit" => limit, "cursor" => cursor, "status" => status },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # +list+ sonuçlarını +next_cursor+ ile tüm sayfalar boyunca tek tek dolaşır (tembel Enumerator).
      #
      # @return [Enumerator<Hash>]
      def list_all(limit: nil, cursor: nil, status: nil, app_id: nil, request_options: nil)
        @client._paginate(cursor) do |next_cursor|
          list(limit: limit, cursor: next_cursor, status: status, app_id: app_id, request_options: request_options)
        end
      end

      # In-app mesaj oluştur (taslak)
      #
      # +POST /v1/apps/{appId}/in-app-messages+
      #
      # @param body [Hash] İstek gövdesi (CreateInAppDto).
      # @option body [String] :name Zorunlu.
      # @option body [Array<Object>] :triggers Zorunlu.
      # @option body [Hash] :display Zorunlu.
      # @option body [Hash] :audience
      # @option body [Hash] :frequency
      # @option body [Integer] :priority
      # @option body [String] :start_at
      # @option body [String] :end_at
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InAppMessage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def create(body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/in-app-messages",
          path_params: {},
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # In-app mesaj detayı
      #
      # +GET /v1/apps/{appId}/in-app-messages/{messageId}+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InAppMessage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def get(message_id, app_id: nil, request_options: nil)
        @client._call(
          "GET",
          "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # In-app mesajı düzenle
      #
      # +PATCH /v1/apps/{appId}/in-app-messages/{messageId}+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param body [Hash] İstek gövdesi (UpdateInAppDto).
      # @option body [String] :name
      # @option body [Array<Object>] :triggers
      # @option body [Hash] :display
      # @option body [Hash] :audience
      # @option body [Hash] :frequency
      # @option body [Integer] :priority
      # @option body [String] :start_at
      # @option body [String] :end_at
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InAppMessage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def update(message_id, body, app_id: nil, request_options: nil)
        @client._call(
          "PATCH",
          "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # In-app mesajı sil (gösterim kayıtlarıyla birlikte)
      #
      # +DELETE /v1/apps/{appId}/in-app-messages/{messageId}+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] Ok
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def delete(message_id, app_id: nil, request_options: nil)
        @client._call(
          "DELETE",
          "/v1/apps/{appId}/in-app-messages/{messageId}",
          path_params: { "messageId" => message_id },
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end

      # Yayınla / duraklat / arşivle
      #
      # +POST /v1/apps/{appId}/in-app-messages/{messageId}/status+
      #
      # @param message_id [String] {messageId} yol parametresi.
      # @param body [Hash] İstek gövdesi (InAppStatusDto).
      # @option body [String] :status Zorunlu. Değerler: "draft", "active", "paused", "archived".
      # @param app_id [String, nil] App kimliği (boşsa istemcinin varsayılanı).
      # @param request_options [Hash, nil] Çağrı seçenekleri (:timeout, :max_retries, :headers, :idempotency_key).
      # @return [Hash] InAppMessage
      # @raise [HeroSignal::Error] API veya ağ hatasında.
      def status(message_id, body, app_id: nil, request_options: nil)
        @client._call(
          "POST",
          "/v1/apps/{appId}/in-app-messages/{messageId}/status",
          path_params: { "messageId" => message_id },
          body: body,
          app_id: app_id,
          path_app_id: true,
          request_options: request_options
        )
      end
    end

    # İstemci özellik adı => kaynak sınıfı.
    RESOURCES = {
      notifications: NotificationsResource,
      users: UsersResource,
      aliases: AliasesResource,
      subscriptions: SubscriptionsResource,
      events: EventsResource,
      segments: SegmentsResource,
      templates: TemplatesResource,
      campaigns: CampaignsResource,
      suppressions: SuppressionsResource,
      exports: ExportsResource,
      imports: ImportsResource,
      webhooks: WebhooksResource,
      channels: ChannelsResource,
      analytics: AnalyticsResource,
      apps: AppsResource,
      organization: OrganizationResource,
      api_keys: ApiKeysResource,
      in_app_messages: InAppMessagesResource,
    }.freeze
  end
end
