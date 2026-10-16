# Bu dosya api/openapi.yaml'dan sdk/scripts/generate-server-sdks.mjs ile üretilmiştir; elle düzenlemeyin.
# frozen_string_literal: true

module Pushizo
  # API şemalarının model sınıfları (hash tabanlı; bilinmeyen alanlar korunur).
  module Models
    # AddAliasDto şeması.
    class AddAliasDto < Pushizo::BaseModel
      # Zorunlu.
      field "identity", :identity, [:map, :string]
    end

    # AddSubscriptionDto şeması.
    class AddSubscriptionDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "token", :token, :string
      field "device", :device, "AddSubscriptionDtoDevice"
      # Değerler: "subscribed", "unsubscribed".
      field "status", :status, :string
      field "opt_in", :opt_in, "AddSubscriptionDtoOptIn"
    end

    # AddSubscriptionDtoDevice şeması.
    class AddSubscriptionDtoDevice < Pushizo::BaseModel
      field "model", :model, :string
      field "os", :os, :string
      field "os_version", :os_version, :string
      field "app_version", :app_version, :string
      field "sdk_version", :sdk_version, :string
      field "sdk_platform", :sdk_platform, :string
      field "carrier", :carrier, :string
      field "locale", :locale, :string
      field "timezone", :timezone, :string
      field "push_capable", :push_capable, :boolean
      # Değerler: "sandbox", "production".
      field "push_environment", :push_environment, :string
    end

    # AddSubscriptionDtoOptIn şeması.
    class AddSubscriptionDtoOptIn < Pushizo::BaseModel
      # Zorunlu.
      field "source", :source, :string
      field "at", :at, :string
    end

    # ApiEventsDto şeması.
    class ApiEventsDto < Pushizo::BaseModel
      # Zorunlu.
      field "events", :events, [:array, "ApiEventsDtoEventsItem"]
    end

    # ApiEventsDtoEventsItem şeması.
    class ApiEventsDtoEventsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "properties", :properties, [:map, :any]
      field "value", :value, :number
      field "occurred_at", :occurred_at, :string
      field "event_id", :event_id, :string
      field "subscription_id", :subscription_id, :string
      field "external_id", :external_id, :string
    end

    # ApiKey şeması.
    class ApiKey < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "prefix", :prefix, :string
      # Zorunlu.
      field "scopes", :scopes, [:array, :string]
      # Zorunlu.
      field "last_used_at", :last_used_at, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "revoked_at", :revoked_at, :string
      # Zorunlu.
      field "ip_allowlist", :ip_allowlist, [:array, :string]
      # Zorunlu.
      field "rotated_at", :rotated_at, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ApiKeyList şeması.
    class ApiKeyList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ApiKey"]
    end

    # App şeması.
    class App < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "platform_flags", :platform_flags, "AppPlatformFlags"
      # Zorunlu.
      field "icon_url", :icon_url, :string
      # Zorunlu.
      field "default_language", :default_language, :string
      # Zorunlu.
      field "timezone", :timezone, :string
      # Zorunlu.
      field "settings", :settings, "AppSettings"
      # Zorunlu. Değerler: "hmac", "jwt", "both".
      field "identity_verification_mode", :identity_verification_mode, :string
      # Zorunlu. Değerler: "active", "suspended", "deleted".
      field "status", :status, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AppList şeması.
    class AppList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "App"]
    end

    # AppPlatformFlags şeması.
    class AppPlatformFlags < Pushizo::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # AppSettings şeması.
    class AppSettings < Pushizo::BaseModel
      field "quietHours", :quiet_hours, "AppSettingsQuietHours"
      field "frequencyCap", :frequency_cap, "AppSettingsFrequencyCap"
      field "frequencyCaps", :frequency_caps, [:array, "AppSettingsFrequencyCapsItem"]
      field "inApp", :in_app, "AppSettingsInApp"
      field "androidChannels", :android_channels, [:array, "AppSettingsAndroidChannelsItem"]
      field "sms", :sms, "AppSettingsSms"
      field "preferenceCenter", :preference_center, "AppSettingsPreferenceCenter"
      field "defaultTtlSeconds", :default_ttl_seconds, :integer
      field "identityVerificationRequired", :identity_verification_required, :boolean
      field "allowedOrigins", :allowed_origins, [:array, :string]
      field "campaignApprovalRequired", :campaign_approval_required, :boolean
      field "webPush", :web_push, "AppSettingsWebPush"
      field "onboarding", :onboarding, "AppSettingsOnboarding"
      field "sdkSetup", :sdk_setup, "AppSettingsSdkSetup"
    end

    # AppSettingsAndroidChannelsItem şeması.
    class AppSettingsAndroidChannelsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu. Değerler: "low", "default", "high", "urgent".
      field "importance", :importance, :string
      field "sound", :sound, :string
      field "vibration", :vibration, :boolean
      field "group", :group, :string
    end

    # AppSettingsFrequencyCap şeması.
    class AppSettingsFrequencyCap < Pushizo::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "windowHours", :window_hours, :integer
    end

    # AppSettingsFrequencyCapsItem şeması.
    class AppSettingsFrequencyCapsItem < Pushizo::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "window", :window, "AppSettingsFrequencyCapsItemWindow"
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
    end

    # AppSettingsFrequencyCapsItemWindow şeması.
    class AppSettingsFrequencyCapsItemWindow < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :integer
      # Zorunlu. Değerler: "minutes", "hours", "days", "weeks".
      field "unit", :unit, :string
    end

    # AppSettingsInApp şeması.
    class AppSettingsInApp < Pushizo::BaseModel
      field "minIntervalSeconds", :min_interval_seconds, :integer
    end

    # AppSettingsOnboarding şeması.
    class AppSettingsOnboarding < Pushizo::BaseModel
      # Zorunlu.
      field "step", :step, :integer
      field "simulation", :simulation, :boolean
      field "completed_at", :completed_at, :string
      field "version", :version, :integer
      # Değerler: "ios", "android", "huawei", "web".
      field "platforms", :platforms, [:array, :string]
      # Değerler: "native", "flutter", "react-native", "unity", "capacitor", "cordova", "maui".
      field "framework", :framework, :string
      # Değerler: "code", "wordpress".
      field "web_integration", :web_integration, :string
    end

    # AppSettingsPreferenceCenter şeması.
    class AppSettingsPreferenceCenter < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "brandName", :brand_name, :string
      field "logoUrl", :logo_url, :string
      field "accentColor", :accent_color, :string
      field "customUnsubscribeUrl", :custom_unsubscribe_url, :string
      field "texts", :texts, [:map, "AppSettingsPreferenceCenterTextsValue"]
    end

    # AppSettingsPreferenceCenterTextsValue şeması.
    class AppSettingsPreferenceCenterTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "unsubscribeAll", :unsubscribe_all, :string
      field "saved", :saved, :string
    end

    # AppSettingsQuietHours şeması.
    class AppSettingsQuietHours < Pushizo::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
      # Zorunlu. Değerler: "user", "app".
      field "timezoneMode", :timezone_mode, :string
    end

    # AppSettingsSdkSetup şeması.
    class AppSettingsSdkSetup < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "platform", :platform, :string
      # Zorunlu.
      field "step", :step, :string
      # Zorunlu.
      field "furthest", :furthest, :string
      field "variant", :variant, :string
      field "detectedSubscriptionId", :detected_subscription_id, :string
      field "testMessageId", :test_message_id, :string
      field "completedAt", :completed_at, :string
    end

    # AppSettingsSms şeması.
    class AppSettingsSms < Pushizo::BaseModel
      field "helpReply", :help_reply, :string
      field "stopReply", :stop_reply, :string
      field "autoReply", :auto_reply, :boolean
    end

    # AppSettingsWebPush şeması.
    class AppSettingsWebPush < Pushizo::BaseModel
      field "serviceWorkerPath", :service_worker_path, :string
      field "serviceWorkerScope", :service_worker_scope, :string
      field "prompt", :prompt, "AppSettingsWebPushPrompt"
      field "welcomeNotification", :welcome_notification, "AppSettingsWebPushWelcomeNotification"
      field "clickBehavior", :click_behavior, "AppSettingsWebPushClickBehavior"
      field "customLink", :custom_link, "AppSettingsWebPushCustomLink"
      field "promptBackoffDays", :prompt_backoff_days, [:array, :integer]
    end

    # AppSettingsWebPushClickBehavior şeması.
    class AppSettingsWebPushClickBehavior < Pushizo::BaseModel
      # Zorunlu. Değerler: "exact", "origin".
      field "match", :match, :string
      # Zorunlu. Değerler: "navigate", "focus".
      field "action", :action, :string
    end

    # AppSettingsWebPushCustomLink şeması.
    class AppSettingsWebPushCustomLink < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "button", "link".
      field "style", :style, :string
      # Zorunlu. Değerler: "small", "medium", "large".
      field "size", :size, :string
      field "color", :color, "AppSettingsWebPushCustomLinkColor"
      field "texts", :texts, [:map, "AppSettingsWebPushCustomLinkTextsValue"]
      field "unsubscribeEnabled", :unsubscribe_enabled, :boolean
    end

    # AppSettingsWebPushCustomLinkColor şeması.
    class AppSettingsWebPushCustomLinkColor < Pushizo::BaseModel
      field "button", :button, :string
      field "text", :text, :string
    end

    # AppSettingsWebPushCustomLinkTextsValue şeması.
    class AppSettingsWebPushCustomLinkTextsValue < Pushizo::BaseModel
      field "subscribe", :subscribe, :string
      field "unsubscribe", :unsubscribe, :string
      field "explanation", :explanation, :string
    end

    # AppSettingsWebPushPrompt şeması.
    class AppSettingsWebPushPrompt < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "slidedown", "native".
      field "type", :type, :string
      # Değerler: "push", "email", "sms", "email_sms".
      field "collect", :collect, :string
      field "delaySeconds", :delay_seconds, :integer
      field "pageViews", :page_views, :integer
      field "scrollPercent", :scroll_percent, :integer
      field "texts", :texts, [:map, "AppSettingsWebPushPromptTextsValue"]
      field "categories", :categories, [:array, "AppSettingsWebPushPromptCategoriesItem"]
      field "accentColor", :accent_color, :string
    end

    # AppSettingsWebPushPromptCategoriesItem şeması.
    class AppSettingsWebPushPromptCategoriesItem < Pushizo::BaseModel
      # Zorunlu.
      field "tag", :tag, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # AppSettingsWebPushPromptTextsValue şeması.
    class AppSettingsWebPushPromptTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "message", :message, :string
      field "accept", :accept, :string
      field "cancel", :cancel, :string
    end

    # AppSettingsWebPushWelcomeNotification şeması.
    class AppSettingsWebPushWelcomeNotification < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "url", :url, :string
      field "texts", :texts, [:map, "AppSettingsWebPushWelcomeNotificationTextsValue"]
    end

    # AppSettingsWebPushWelcomeNotificationTextsValue şeması.
    class AppSettingsWebPushWelcomeNotificationTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "message", :message, :string
    end

    # AuditEntry şeması.
    class AuditEntry < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "account", "api_key", "system".
      field "actor_type", :actor_type, :string
      # Zorunlu.
      field "actor_id", :actor_id, :string
      # Zorunlu.
      field "action", :action, :string
      # Zorunlu.
      field "target_type", :target_type, :string
      # Zorunlu.
      field "target_id", :target_id, :string
      # Zorunlu.
      field "metadata", :metadata, [:map, :any]
      # Zorunlu.
      field "ip", :ip, :string
      # Zorunlu.
      field "request_id", :request_id, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # AuditPage şeması.
    class AuditPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AuditEntry"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # Campaign şeması.
    class Campaign < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "labels", :labels, [:array, :string]
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "ab_test", :ab_test, "CampaignAbTest"
      # Zorunlu.
      field "variants", :variants, [:array, "CampaignVariantsItem"]
      # Zorunlu. Değerler: "one_time", "scheduled", "recurring", "automated", "transactional".
      field "type", :type, :string
      # Zorunlu. Değerler: "draft", "scheduled", "running", "paused", "completed", "cancelled", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "audience", :audience, [:map, :any]
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "template_id", :template_id, :string
      # Zorunlu.
      field "template_version", :template_version, :integer
      # Zorunlu.
      field "delivery", :delivery, "CampaignDelivery"
      # Zorunlu.
      field "recurrence", :recurrence, "CampaignRecurrence"
      # Zorunlu.
      field "approval", :approval, "CampaignApproval"
      # Zorunlu.
      field "stats", :stats, "CampaignStats2"
      # Zorunlu.
      field "send_at", :send_at, :string
      # Zorunlu.
      field "next_run_at", :next_run_at, :string
      # Zorunlu.
      field "last_run_at", :last_run_at, :string
      # Zorunlu.
      field "run_count", :run_count, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "estimated_recipients", :estimated_recipients, :integer
    end

    # CampaignAbTest şeması.
    class CampaignAbTest < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignAbTestWinner"
      # Değerler: "testing", "winner_sent".
      field "phase", :phase, :string
      field "winner_variant_id", :winner_variant_id, :string
      field "decided_at", :decided_at, :string
      field "decided_by", :decided_by, :string
      field "significance", :significance, "CampaignAbTestSignificance"
    end

    # CampaignAbTestSignificance şeması.
    class CampaignAbTestSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignAbTestWinner şeması.
    class CampaignAbTestWinner < Pushizo::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Zorunlu. Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignApproval şeması.
    class CampaignApproval < Pushizo::BaseModel
      # Zorunlu.
      field "required", :required, :boolean
      # Değerler: "send", "schedule".
      field "pending_action", :pending_action, :string
      field "requested_by", :requested_by, :string
      field "requested_at", :requested_at, :string
      field "approved_by", :approved_by, :string
      field "approved_at", :approved_at, :string
      field "rejected_by", :rejected_by, :string
      field "rejected_at", :rejected_at, :string
    end

    # CampaignDelivery şeması.
    class CampaignDelivery < Pushizo::BaseModel
      # Değerler: "immediate", "per_user_timezone", "optimized".
      field "timezone_mode", :timezone_mode, :string
      field "delivery_time_of_day", :delivery_time_of_day, :string
      field "throttle_per_minute", :throttle_per_minute, :integer
      field "ttl", :ttl, :integer
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "collapse_id", :collapse_id, :string
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # CampaignPage şeması.
    class CampaignPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Campaign"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # CampaignRecurrence şeması.
    class CampaignRecurrence < Pushizo::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsCreateBody şeması.
    class CampaignsCreateBody < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "one_time", "scheduled", "recurring".
      field "type", :type, :string
      field "audience", :audience, "CampaignsCreateBodyAudience"
      # messages.content ile aynı şema (headings, contents, url, buttons…)
      field "content", :content, [:map, :any]
      field "labels", :labels, [:array, :string]
      # Tercih kategorisi anahtarı; kapalı kullanıcılar bastırılır
      field "category", :category, :string
      field "ab_test", :ab_test, "CampaignsCreateBodyAbTest"
      # A/B varyantları (ağırlıklar toplamı 100; en fazla bir is_control)
      field "variants", :variants, [:array, "CampaignsCreateBodyVariantsItem"]
      field "template_id", :template_id, :string
      field "template_version", :template_version, :integer
      field "delivery", :delivery, "CampaignsCreateBodyDelivery"
      field "recurrence", :recurrence, "CampaignsCreateBodyRecurrence"
      field "send_at", :send_at, :string
    end

    # CampaignsCreateBodyAbTest şeması.
    class CampaignsCreateBodyAbTest < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignsCreateBodyAbTestWinner"
    end

    # CampaignsCreateBodyAbTestWinner şeması.
    class CampaignsCreateBodyAbTestWinner < Pushizo::BaseModel
      # Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignsCreateBodyAudience şeması.
    class CampaignsCreateBodyAudience < Pushizo::BaseModel
      field "all", :all, :boolean
      field "segments", :segments, [:array, :string]
      field "exclude_segments", :exclude_segments, [:array, :string]
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "filters", :filters, "CampaignsCreateBodyAudienceFilters"
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class CampaignsCreateBodyAudienceFilters < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # CampaignsCreateBodyDelivery şeması.
    class CampaignsCreateBodyDelivery < Pushizo::BaseModel
      # Değerler: "immediate", "per_user_timezone", "optimized".
      field "timezone_mode", :timezone_mode, :string
      field "delivery_time_of_day", :delivery_time_of_day, :string
      field "throttle_per_minute", :throttle_per_minute, :integer
      field "ttl", :ttl, :integer
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "collapse_id", :collapse_id, :string
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # CampaignsCreateBodyRecurrence şeması.
    class CampaignsCreateBodyRecurrence < Pushizo::BaseModel
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsCreateBodyVariantsItem şeması.
    class CampaignsCreateBodyVariantsItem < Pushizo::BaseModel
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      field "content", :content, [:map, :any]
      field "is_control", :is_control, :boolean
    end

    # CampaignStats şeması.
    class CampaignStats < Pushizo::BaseModel
      # Zorunlu.
      field "campaign", :campaign, "Campaign"
      # Zorunlu.
      field "rates", :rates, "CampaignStatsRates"
      # Zorunlu.
      field "channels", :channels, [:array, "CampaignStatsChannelsItem"]
      # Zorunlu.
      field "hourly", :hourly, [:array, "CampaignStatsHourlyItem"]
      # Zorunlu.
      field "errors", :errors, [:array, "CampaignStatsErrorsItem"]
      # Zorunlu.
      field "messages", :messages, [:array, "Message"]
    end

    # CampaignStats2 şeması.
    class CampaignStats2 < Pushizo::BaseModel
      field "runs", :runs, :integer
      field "targeted", :targeted, :integer
      field "suppressed", :suppressed, :integer
      field "sent", :sent, :integer
      field "delivered", :delivered, :integer
      field "failed", :failed, :integer
      field "opened", :opened, :integer
      field "clicked", :clicked, :integer
      field "converted", :converted, :integer
      field "bounced", :bounced, :integer
      field "complained", :complained, :integer
      field "unsubscribed", :unsubscribed, :integer
      field "sms_segments", :sms_segments, :integer
    end

    # CampaignStatsChannelsItem şeması.
    class CampaignStatsChannelsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "targeted", :targeted, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # CampaignStatsErrorsItem şeması.
    class CampaignStatsErrorsItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # CampaignStatsHourlyItem şeması.
    class CampaignStatsHourlyItem < Pushizo::BaseModel
      # Zorunlu.
      field "hour", :hour, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # CampaignStatsRates şeması.
    class CampaignStatsRates < Pushizo::BaseModel
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # CampaignsUpdateBody şeması.
    class CampaignsUpdateBody < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "one_time", "scheduled", "recurring".
      field "type", :type, :string
      field "audience", :audience, "CampaignsUpdateBodyAudience"
      # messages.content ile aynı şema (headings, contents, url, buttons…)
      field "content", :content, [:map, :any]
      field "labels", :labels, [:array, :string]
      # Tercih kategorisi anahtarı; kapalı kullanıcılar bastırılır
      field "category", :category, :string
      field "ab_test", :ab_test, "CampaignsUpdateBodyAbTest"
      # A/B varyantları (ağırlıklar toplamı 100; en fazla bir is_control)
      field "variants", :variants, [:array, "CampaignsUpdateBodyVariantsItem"]
      field "template_id", :template_id, :string
      field "template_version", :template_version, :integer
      field "delivery", :delivery, "CampaignsUpdateBodyDelivery"
      field "recurrence", :recurrence, "CampaignsUpdateBodyRecurrence"
      field "send_at", :send_at, :string
    end

    # CampaignsUpdateBodyAbTest şeması.
    class CampaignsUpdateBodyAbTest < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignsUpdateBodyAbTestWinner"
    end

    # CampaignsUpdateBodyAbTestWinner şeması.
    class CampaignsUpdateBodyAbTestWinner < Pushizo::BaseModel
      # Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignsUpdateBodyAudience şeması.
    class CampaignsUpdateBodyAudience < Pushizo::BaseModel
      field "all", :all, :boolean
      field "segments", :segments, [:array, :string]
      field "exclude_segments", :exclude_segments, [:array, :string]
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "filters", :filters, "CampaignsUpdateBodyAudienceFilters"
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class CampaignsUpdateBodyAudienceFilters < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # CampaignsUpdateBodyDelivery şeması.
    class CampaignsUpdateBodyDelivery < Pushizo::BaseModel
      # Değerler: "immediate", "per_user_timezone", "optimized".
      field "timezone_mode", :timezone_mode, :string
      field "delivery_time_of_day", :delivery_time_of_day, :string
      field "throttle_per_minute", :throttle_per_minute, :integer
      field "ttl", :ttl, :integer
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "collapse_id", :collapse_id, :string
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # CampaignsUpdateBodyRecurrence şeması.
    class CampaignsUpdateBodyRecurrence < Pushizo::BaseModel
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsUpdateBodyVariantsItem şeması.
    class CampaignsUpdateBodyVariantsItem < Pushizo::BaseModel
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      field "content", :content, [:map, :any]
      field "is_control", :is_control, :boolean
    end

    # CampaignVariantsItem şeması.
    class CampaignVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "is_control", :is_control, :boolean
      # Zorunlu.
      field "position", :position, :integer
    end

    # CampaignVariantStats şeması.
    class CampaignVariantStats < Pushizo::BaseModel
      # Zorunlu.
      field "ab_test", :ab_test, "CampaignVariantStatsAbTest"
      # Zorunlu.
      field "variants", :variants, [:array, "CampaignVariantStatsVariantsItem"]
      # Zorunlu.
      field "leader", :leader, :string
      # Zorunlu.
      field "significance", :significance, "CampaignVariantStatsSignificance"
    end

    # CampaignVariantStatsAbTest şeması.
    class CampaignVariantStatsAbTest < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignVariantStatsAbTestWinner"
      # Değerler: "testing", "winner_sent".
      field "phase", :phase, :string
      field "winner_variant_id", :winner_variant_id, :string
      field "decided_at", :decided_at, :string
      field "decided_by", :decided_by, :string
      field "significance", :significance, "CampaignVariantStatsAbTestSignificance"
    end

    # CampaignVariantStatsAbTestSignificance şeması.
    class CampaignVariantStatsAbTestSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignVariantStatsAbTestWinner şeması.
    class CampaignVariantStatsAbTestWinner < Pushizo::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Zorunlu. Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignVariantStatsSignificance şeması.
    class CampaignVariantStatsSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignVariantStatsVariantsItem şeması.
    class CampaignVariantStatsVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "is_control", :is_control, :boolean
      # Zorunlu.
      field "targeted", :targeted, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "holdout", :holdout, :integer
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # ChannelConfig şeması.
    class ChannelConfig < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "hms", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "meta_whatsapp", "google_rbm", "mock".
      field "provider", :provider, :string
      # Zorunlu. Değerler: "unconfigured", "active", "invalid", "suspended".
      field "status", :status, :string
      # Zorunlu.
      field "config", :config, "ChannelConfigConfig"
      # Zorunlu.
      field "has_secret", :has_secret, :boolean
      # Zorunlu.
      field "has_hook", :has_hook, :boolean
      # Zorunlu.
      field "last_validated_at", :last_validated_at, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "suspended_reason", :suspended_reason, :string
      # Zorunlu.
      field "dns_check", :dns_check, "ChannelConfigDnsCheck"
    end

    # ChannelConfigConfig şeması.
    class ChannelConfigConfig < Pushizo::BaseModel
      # Değerler: "token", "certificate".
      field "auth_type", :auth_type, :string
      # Değerler: "sandbox", "production", "universal".
      field "certificate_environment", :certificate_environment, :string
      field "certificate_subject", :certificate_subject, :string
      field "certificate_expires_at", :certificate_expires_at, :string
      field "key_id", :key_id, :string
      field "team_id", :team_id, :string
      field "bundle_id", :bundle_id, :string
      # Değerler: "sandbox", "production".
      field "environment", :environment, :string
      field "project_id", :project_id, :string
      field "client_email", :client_email, :string
      field "hms_app_id", :hms_app_id, :string
      field "high_priority", :high_priority, :boolean
      field "subject", :subject, :string
      field "vapid_public_key", :vapid_public_key, :string
      field "site_url", :site_url, :string
      field "from_address", :from_address, :string
      field "from_name", :from_name, :string
      field "reply_to", :reply_to, :string
      field "dkim_selector", :dkim_selector, :string
      field "postal_address", :postal_address, :string
      field "host", :host, :string
      field "port", :port, :integer
      field "secure", :secure, :boolean
      field "username", :username, :string
      field "region", :region, :string
      field "access_key_id", :access_key_id, :string
      field "configuration_set", :configuration_set, :string
      field "account_sid", :account_sid, :string
      field "from_number", :from_number, :string
      field "messaging_service_sid", :messaging_service_sid, :string
      field "usercode", :usercode, :string
      field "msgheader", :msgheader, :string
      # Değerler: "0", "11", "12".
      field "iys_filter", :iys_filter, :string
      field "waba_id", :waba_id, :string
      field "phone_number_id", :phone_number_id, :string
      field "graph_api_version", :graph_api_version, :string
      field "display_phone_number", :display_phone_number, :string
      field "verified_name", :verified_name, :string
      field "rbm_agent_id", :rbm_agent_id, :string
      field "content_sid", :content_sid, :string
      field "sms_fallback", :sms_fallback, :boolean
    end

    # ChannelConfigDnsCheck şeması.
    class ChannelConfigDnsCheck < Pushizo::BaseModel
      # Zorunlu.
      field "domain", :domain, :string
      # Zorunlu.
      field "checked_at", :checked_at, :string
      # Zorunlu.
      field "spf", :spf, "ChannelConfigDnsCheckSpf"
      # Zorunlu.
      field "dkim", :dkim, "ChannelConfigDnsCheckDkim"
      # Zorunlu.
      field "dmarc", :dmarc, "ChannelConfigDnsCheckDmarc"
      # Zorunlu.
      field "issues", :issues, [:array, :string]
    end

    # ChannelConfigDnsCheckDkim şeması.
    class ChannelConfigDnsCheckDkim < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "selector", :selector, :string
      # Zorunlu.
      field "record", :record, :string
      # Zorunlu.
      field "expected", :expected, :string
    end

    # ChannelConfigDnsCheckDmarc şeması.
    class ChannelConfigDnsCheckDmarc < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "record", :record, :string
      # Zorunlu.
      field "expected", :expected, :string
    end

    # ChannelConfigDnsCheckSpf şeması.
    class ChannelConfigDnsCheckSpf < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "record", :record, :string
      # Zorunlu.
      field "expected", :expected, :string
    end

    # ChannelList şeması.
    class ChannelList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ChannelConfig"]
    end

    # ChannelValidation şeması.
    class ChannelValidation < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu. Değerler: "auth", "config", "transient".
      field "kind", :kind, :string
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "message", :message, :string
      # Zorunlu.
      field "details", :details, [:map, :any]
      # Zorunlu.
      field "channel", :channel, "ChannelConfig"
    end

    # ContentTable şeması.
    class ContentTable < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "key_column", :key_column, :string
      # Zorunlu.
      field "columns", :columns, [:array, :string]
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "source_file_name", :source_file_name, :string
      # Zorunlu.
      field "liquid", :liquid, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # ContentTableList şeması.
    class ContentTableList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ContentTable"]
    end

    # ContentTableRows şeması.
    class ContentTableRows < Pushizo::BaseModel
      # Zorunlu.
      field "columns", :columns, [:array, :string]
      # Zorunlu.
      field "key_column", :key_column, :string
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "data", :data, [:array, [:map, :string]]
    end

    # Conversation şeması.
    class Conversation < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "open", "closed".
      field "status", :status, :string
      # Zorunlu.
      field "subscription_id", :subscription_id, :string
      # Zorunlu.
      field "subscription_status", :subscription_status, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "contact", :contact, :string
      # Zorunlu.
      field "opted_in", :opted_in, :boolean
      # Zorunlu.
      field "last_message_at", :last_message_at, :string
      # Zorunlu.
      field "last_inbound_at", :last_inbound_at, :string
      # Zorunlu. Değerler: "inbound", "outbound".
      field "last_direction", :last_direction, :string
      # Zorunlu.
      field "last_message_preview", :last_message_preview, :string
      # Zorunlu.
      field "unread_count", :unread_count, :integer
      # Zorunlu.
      field "window", :window, "ConversationWindow"
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ConversationMessagePage şeması.
    class ConversationMessagePage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ConversationMessagePageDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # ConversationMessagePageDataItem şeması.
    class ConversationMessagePageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "inbound", "outbound".
      field "direction", :direction, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "delivery_id", :delivery_id, :string
      # Zorunlu.
      field "sent_by", :sent_by, :string
      # Zorunlu.
      field "error_code", :error_code, :string
      # Zorunlu.
      field "read_at", :read_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ConversationPage şeması.
    class ConversationPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Conversation"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # ConversationReplyDto şeması.
    class ConversationReplyDto < Pushizo::BaseModel
      field "text", :text, :string
      field "template", :template, "ConversationReplyDtoTemplate"
      field "media", :media, "ConversationReplyDtoMedia"
      field "interactive", :interactive, "ConversationReplyDtoInteractive"
    end

    # ConversationReplyDtoInteractive şeması.
    class ConversationReplyDtoInteractive < Pushizo::BaseModel
      # Zorunlu. Değerler: "button", "list".
      field "type", :type, :string
      field "header", :header, :string
      field "footer", :footer, :string
      field "buttons", :buttons, [:array, "ConversationReplyDtoInteractiveButtonsItem"]
      field "list", :list, "ConversationReplyDtoInteractiveList"
    end

    # ConversationReplyDtoInteractiveButtonsItem şeması.
    class ConversationReplyDtoInteractiveButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
    end

    # ConversationReplyDtoInteractiveList şeması.
    class ConversationReplyDtoInteractiveList < Pushizo::BaseModel
      # Zorunlu.
      field "button", :button, :string
      # Zorunlu.
      field "sections", :sections, [:array, "ConversationReplyDtoInteractiveListSectionsItem"]
    end

    # ConversationReplyDtoInteractiveListSectionsItem şeması.
    class ConversationReplyDtoInteractiveListSectionsItem < Pushizo::BaseModel
      field "title", :title, :string
      # Zorunlu.
      field "rows", :rows, [:array, "ConversationReplyDtoInteractiveListSectionsItemRowsItem"]
    end

    # ConversationReplyDtoInteractiveListSectionsItemRowsItem şeması.
    class ConversationReplyDtoInteractiveListSectionsItemRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
    end

    # ConversationReplyDtoMedia şeması.
    class ConversationReplyDtoMedia < Pushizo::BaseModel
      # Zorunlu. Değerler: "image", "video", "document", "audio".
      field "type", :type, :string
      # Zorunlu.
      field "url", :url, :string
      field "filename", :filename, :string
    end

    # ConversationReplyDtoTemplate şeması.
    class ConversationReplyDtoTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      field "header", :header, :any
      field "body_params", :body_params, [:array, :string]
      field "button_params", :button_params, [:array, "ConversationReplyDtoTemplateButtonParamsItem"]
    end

    # ConversationReplyDtoTemplateButtonParamsItem şeması.
    class ConversationReplyDtoTemplateButtonParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu. Değerler: "url", "quick_reply", "copy_code".
      field "sub_type", :sub_type, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # ConversationReplyResult şeması.
    class ConversationReplyResult < Pushizo::BaseModel
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "conversation_message", :conversation_message, "ConversationReplyResultConversationMessage"
    end

    # ConversationReplyResultConversationMessage şeması.
    class ConversationReplyResultConversationMessage < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "inbound", "outbound".
      field "direction", :direction, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "delivery_id", :delivery_id, :string
      # Zorunlu.
      field "sent_by", :sent_by, :string
      # Zorunlu.
      field "error_code", :error_code, :string
      # Zorunlu.
      field "read_at", :read_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ConversationWindow şeması.
    class ConversationWindow < Pushizo::BaseModel
      # Zorunlu.
      field "open", :open_value, :boolean
      # Zorunlu.
      field "expires_at", :expires_at, :string
    end

    # ConversionsReport şeması.
    class ConversionsReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "totals", :totals, "ConversionsReportTotals"
      # Zorunlu.
      field "previous", :previous, "ConversionsReportPrevious"
      # Zorunlu.
      field "by_campaign", :by_campaign, [:array, "ConversionsReportByCampaignItem"]
      # Zorunlu.
      field "rows", :rows, [:array, "ConversionsReportRowsItem"]
    end

    # ConversionsReportByCampaignItem şeması.
    class ConversionsReportByCampaignItem < Pushizo::BaseModel
      # Zorunlu.
      field "campaign_id", :campaign_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "direct", :direct, :integer
      # Zorunlu.
      field "influenced", :influenced, :integer
      # Zorunlu.
      field "unattributed", :unattributed, :integer
      # Zorunlu.
      field "revenue", :revenue, :number
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # ConversionsReportPrevious şeması.
    class ConversionsReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "direct", :direct, :integer
      # Zorunlu.
      field "influenced", :influenced, :integer
      # Zorunlu.
      field "unattributed", :unattributed, :integer
      # Zorunlu.
      field "revenue", :revenue, :number
    end

    # ConversionsReportRowsItem şeması.
    class ConversionsReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "revenue", :revenue, :number
    end

    # ConversionsReportTotals şeması.
    class ConversionsReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "direct", :direct, :integer
      # Zorunlu.
      field "influenced", :influenced, :integer
      # Zorunlu.
      field "unattributed", :unattributed, :integer
      # Zorunlu.
      field "revenue", :revenue, :number
    end

    # CopyTemplateDto şeması.
    class CopyTemplateDto < Pushizo::BaseModel
      # Zorunlu.
      field "target_app_id", :target_app_id, :string
      field "name", :name, :string
    end

    # CreateAppApiKeyDto şeması.
    class CreateAppApiKeyDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read", "mcp:write".
      field "scopes", :scopes, [:array, :string]
      # Değerler: "live", "test".
      field "environment", :environment, :string
      field "expires_at", :expires_at, :string
      field "ip_allowlist", :ip_allowlist, [:array, :string]
    end

    # CreateAppDto şeması.
    class CreateAppDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "slug", :slug, :string
      field "platform_flags", :platform_flags, "CreateAppDtoPlatformFlags"
      field "default_language", :default_language, :string
      field "timezone", :timezone, :string
    end

    # CreateAppDtoPlatformFlags şeması.
    class CreateAppDtoPlatformFlags < Pushizo::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # CreateCategoryDto şeması.
    class CreateCategoryDto < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # CreatedApiKey şeması.
    class CreatedApiKey < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "prefix", :prefix, :string
      # Zorunlu.
      field "scopes", :scopes, [:array, :string]
      # Zorunlu.
      field "last_used_at", :last_used_at, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "revoked_at", :revoked_at, :string
      # Zorunlu.
      field "ip_allowlist", :ip_allowlist, [:array, :string]
      # Zorunlu.
      field "rotated_at", :rotated_at, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "key", :key, :string
    end

    # CreateDataFeedDto şeması.
    class CreateDataFeedDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu.
      field "url_template", :url_template, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "body_template", :body_template, :string
      field "headers", :headers, [:map, :string]
      field "secret_headers", :secret_headers, [:map, :string]
      field "cache_ttl_seconds", :cache_ttl_seconds, :integer
      field "timeout_ms", :timeout_ms, :integer
      field "enabled", :enabled, :boolean
    end

    # CreateExportDto şeması.
    class CreateExportDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "users", "subscriptions", "events", "deliveries", "message_events".
      field "type", :type, :string
      field "filters", :filters, "CreateExportDtoFilters"
    end

    # CreateExportDtoFilters şeması.
    class CreateExportDtoFilters < Pushizo::BaseModel
      field "from", :from, :string
      field "to", :to, :string
      field "name", :name, :string
      field "message_id", :message_id, :string
      field "campaign_id", :campaign_id, :string
      field "status", :status, :string
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      field "segment_id", :segment_id, :string
    end

    # CreateIdentityKeyDto şeması.
    class CreateIdentityKeyDto < Pushizo::BaseModel
      field "kid", :kid, :string
      field "label", :label, :string
      field "public_jwk", :public_jwk, [:map, :any]
      field "public_key_pem", :public_key_pem, :string
    end

    # CreateInAppDto şeması.
    class CreateInAppDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "triggers", :triggers, [:array, :any]
      field "trigger_groups", :trigger_groups, [:array, [:array, :any]]
      field "variants", :variants, [:array, "CreateInAppDtoVariantsItem"]
      field "ab_test", :ab_test, "CreateInAppDtoAbTest"
      # Zorunlu.
      field "display", :display_value, "CreateInAppDtoDisplay"
      field "audience", :audience, "CreateInAppDtoAudience"
      field "frequency", :frequency, "CreateInAppDtoFrequency"
      field "journey_only", :journey_only, :boolean
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # CreateInAppDtoAbTest şeması.
    class CreateInAppDtoAbTest < Pushizo::BaseModel
      field "winner", :winner, "CreateInAppDtoAbTestWinner"
    end

    # CreateInAppDtoAbTestWinner şeması.
    class CreateInAppDtoAbTestWinner < Pushizo::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # CreateInAppDtoAudience şeması.
    class CreateInAppDtoAudience < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # CreateInAppDtoDisplay şeması.
    class CreateInAppDtoDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # CreateInAppDtoFrequency şeması.
    class CreateInAppDtoFrequency < Pushizo::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # CreateInAppDtoVariantsItem şeması.
    class CreateInAppDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "CreateInAppDtoVariantsItemDisplay"
    end

    # CreateInAppDtoVariantsItemDisplay şeması.
    class CreateInAppDtoVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # CreateKeywordDto şeması.
    class CreateKeywordDto < Pushizo::BaseModel
      # Zorunlu.
      field "keyword", :keyword, :string
      # Değerler: "org", "app".
      field "scope", :scope, :string
      # Değerler: "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "actions", :actions, "CreateKeywordDtoActions"
      field "enabled", :enabled, :boolean
      field "description", :description, :string
    end

    # CreateKeywordDtoActions şeması.
    class CreateKeywordDtoActions < Pushizo::BaseModel
      field "add_tags", :add_tags, [:map, :string]
      field "remove_tags", :remove_tags, [:array, :string]
      field "event", :event, "CreateKeywordDtoActionsEvent"
      field "reply", :reply, "CreateKeywordDtoActionsReply"
      field "opt_in", :opt_in, :boolean
    end

    # CreateKeywordDtoActionsEvent şeması.
    class CreateKeywordDtoActionsEvent < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "properties", :properties, [:map, :string]
    end

    # CreateKeywordDtoActionsReply şeması.
    class CreateKeywordDtoActionsReply < Pushizo::BaseModel
      # Zorunlu.
      field "text", :text, :string
    end

    # CreateLiveActivityTypeDto şeması.
    class CreateLiveActivityTypeDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu.
      field "content_state_schema", :content_state_schema, "CreateLiveActivityTypeDtoContentStateSchema"
      field "attributes_schema", :attributes_schema, "CreateLiveActivityTypeDtoAttributesSchema"
    end

    # CreateLiveActivityTypeDtoAttributesSchema şeması.
    class CreateLiveActivityTypeDtoAttributesSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "CreateLiveActivityTypeDtoAttributesSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # CreateLiveActivityTypeDtoAttributesSchemaPropertiesValue şeması.
    class CreateLiveActivityTypeDtoAttributesSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # CreateLiveActivityTypeDtoContentStateSchema şeması.
    class CreateLiveActivityTypeDtoContentStateSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "CreateLiveActivityTypeDtoContentStateSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # CreateLiveActivityTypeDtoContentStateSchemaPropertiesValue şeması.
    class CreateLiveActivityTypeDtoContentStateSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # CreateNotificationDto şeması.
    class CreateNotificationDto < Pushizo::BaseModel
      field "app_id", :app_id, :string
      field "idempotency_key", :idempotency_key, :string
      # Zorunlu.
      field "target", :target, "CreateNotificationDtoTarget"
      field "headings", :headings, [:map, :string]
      field "contents", :contents, [:map, :string]
      field "subtitle", :subtitle, [:map, :string]
      field "url", :url, :string
      field "app_url", :app_url, :string
      field "data", :data, [:map, :string]
      field "buttons", :buttons, [:array, "CreateNotificationDtoButtonsItem"]
      field "big_picture", :big_picture, :string
      field "ios_attachments", :ios_attachments, [:map, :string]
      field "ios_sound", :ios_sound, :string
      # Değerler: "None", "SetTo", "Increase".
      field "ios_badge_type", :ios_badge_type, :string
      field "ios_badge_count", :ios_badge_count, :integer
      # Değerler: "passive", "active", "time-sensitive", "critical".
      field "ios_interruption_level", :ios_interruption_level, :string
      field "ios_category", :ios_category, :string
      field "thread_id", :thread_id, :string
      field "ios_relevance_score", :ios_relevance_score, :number
      field "target_content_identifier", :target_content_identifier, :string
      field "android_channel_id", :android_channel_id, :string
      field "android_group", :android_group, :string
      field "android_sound", :android_sound, :string
      field "small_icon", :small_icon, :string
      field "large_icon", :large_icon, :string
      field "android_accent_color", :android_accent_color, :string
      # Değerler: 1, 0, -1.
      field "android_visibility", :android_visibility, :integer
      field "chrome_web_icon", :chrome_web_icon, :string
      field "chrome_web_image", :chrome_web_image, :string
      field "chrome_web_badge", :chrome_web_badge, :string
      field "web_push_topic", :web_push_topic, :string
      field "web_buttons", :web_buttons, [:array, "CreateNotificationDtoWebButtonsItem"]
      field "require_interaction", :require_interaction, :boolean
      field "content_available", :content_available, :boolean
      field "mutable_content", :mutable_content, :boolean
      field "collapse_id", :collapse_id, :string
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "ttl", :ttl, :integer
      field "send_after", :send_after, :string
      # Değerler: "timezone", "optimized".
      field "delayed_option", :delayed_option, :string
      field "delivery_time_of_day", :delivery_time_of_day, :string
      field "template_id", :template_id, :string
      field "custom_data", :custom_data, [:map, :any]
      field "email_subject", :email_subject, :string
      field "email_body", :email_body, :string
      field "email_mjml", :email_mjml, :string
      field "email_preheader", :email_preheader, :string
      field "email_from_name", :email_from_name, :string
      field "email_from_address", :email_from_address, :string
      field "email_reply_to_address", :email_reply_to_address, :string
      field "disable_email_click_tracking", :disable_email_click_tracking, :boolean
      field "sms_from", :sms_from, :string
      field "sms_media_urls", :sms_media_urls, [:array, :string]
      field "disable_sms_link_shortening", :disable_sms_link_shortening, :boolean
      field "whatsapp_template", :whatsapp_template, "CreateNotificationDtoWhatsappTemplate"
      field "whatsapp_media", :whatsapp_media, "CreateNotificationDtoWhatsappMedia"
      field "whatsapp_interactive", :whatsapp_interactive, "CreateNotificationDtoWhatsappInteractive"
      field "rcs_card", :rcs_card, "CreateNotificationDtoRcsCard"
      field "rcs_suggestions", :rcs_suggestions, [:array, :any]
      field "rcs_content_sid", :rcs_content_sid, :string
      field "rcs_content_variables", :rcs_content_variables, [:map, :string]
      field "rcs_fallback_text", :rcs_fallback_text, [:map, :string]
      field "add_to_inbox", :add_to_inbox, :boolean
      field "inbox_ttl", :inbox_ttl, :integer
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
      field "throttle_rate_per_minute", :throttle_rate_per_minute, :integer
      field "include_unsubscribed", :include_unsubscribed, :boolean
      field "name", :name, :string
      field "labels", :labels, [:array, :string]
      field "category", :category, :string
    end

    # CreateNotificationDtoButtonsItem şeması.
    class CreateNotificationDtoButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateNotificationDtoRcsCard şeması.
    class CreateNotificationDtoRcsCard < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "description", :description, [:map, :string]
      field "media_url", :media_url, :string
      # Değerler: "SHORT", "MEDIUM", "TALL".
      field "media_height", :media_height, :string
      # Değerler: "VERTICAL", "HORIZONTAL".
      field "orientation", :orientation, :string
    end

    # CreateNotificationDtoTarget şeması.
    class CreateNotificationDtoTarget < Pushizo::BaseModel
      field "all", :all, :boolean
      field "include_subscription_ids", :include_subscription_ids, [:array, :string]
      field "include_external_ids", :include_external_ids, [:array, :string]
      field "include_aliases", :include_aliases, [:map, [:array, :string]]
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      field "filters", :filters, :any
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
      field "email_to", :email_to, [:array, :string]
      field "include_phone_numbers", :include_phone_numbers, [:array, :string]
    end

    # CreateNotificationDtoWebButtonsItem şeması.
    class CreateNotificationDtoWebButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateNotificationDtoWhatsappInteractive şeması.
    class CreateNotificationDtoWhatsappInteractive < Pushizo::BaseModel
      # Zorunlu. Değerler: "button", "list".
      field "type", :type, :string
      field "header", :header, :string
      field "footer", :footer, :string
      field "buttons", :buttons, [:array, "CreateNotificationDtoWhatsappInteractiveButtonsItem"]
      field "list", :list, "CreateNotificationDtoWhatsappInteractiveList"
    end

    # CreateNotificationDtoWhatsappInteractiveButtonsItem şeması.
    class CreateNotificationDtoWhatsappInteractiveButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
    end

    # CreateNotificationDtoWhatsappInteractiveList şeması.
    class CreateNotificationDtoWhatsappInteractiveList < Pushizo::BaseModel
      # Zorunlu.
      field "button", :button, :string
      # Zorunlu.
      field "sections", :sections, [:array, "CreateNotificationDtoWhatsappInteractiveListSectionsItem"]
    end

    # CreateNotificationDtoWhatsappInteractiveListSectionsItem şeması.
    class CreateNotificationDtoWhatsappInteractiveListSectionsItem < Pushizo::BaseModel
      field "title", :title, :string
      # Zorunlu.
      field "rows", :rows, [:array, "CreateNotificationDtoWhatsappInteractiveListSectionsItemRowsItem"]
    end

    # CreateNotificationDtoWhatsappInteractiveListSectionsItemRowsItem şeması.
    class CreateNotificationDtoWhatsappInteractiveListSectionsItemRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
    end

    # CreateNotificationDtoWhatsappMedia şeması.
    class CreateNotificationDtoWhatsappMedia < Pushizo::BaseModel
      # Zorunlu. Değerler: "image", "video", "document", "audio".
      field "type", :type, :string
      # Zorunlu.
      field "url", :url, :string
      field "filename", :filename, :string
    end

    # CreateNotificationDtoWhatsappTemplate şeması.
    class CreateNotificationDtoWhatsappTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      field "header", :header, :any
      field "body_params", :body_params, [:array, :string]
      field "button_params", :button_params, [:array, "CreateNotificationDtoWhatsappTemplateButtonParamsItem"]
    end

    # CreateNotificationDtoWhatsappTemplateButtonParamsItem şeması.
    class CreateNotificationDtoWhatsappTemplateButtonParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu. Değerler: "url", "quick_reply", "copy_code".
      field "sub_type", :sub_type, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # CreateNotificationResult şeması.
    class CreateNotificationResult < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "queued", "processing", "completed", "cancelled", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "recipients_estimate", :recipients_estimate, :integer
      # Zorunlu.
      field "external_id_missing", :external_id_missing, [:array, :string]
    end

    # CreateSuppressionDto şeması.
    class CreateSuppressionDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "value", :value, :string
      # Değerler: "manual", "bounce", "complaint", "unsubscribe_link", "stop".
      field "reason", :reason, :string
      field "expires_at", :expires_at, :string
      field "note", :note, :string
    end

    # CreateTemplateDto şeması.
    class CreateTemplateDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      field "tags", :tags, [:array, :string]
      # Zorunlu.
      field "content", :content, "CreateTemplateDtoContent"
    end

    # CreateTemplateDtoContent şeması.
    class CreateTemplateDtoContent < Pushizo::BaseModel
      field "headings", :headings, [:map, :string]
      field "contents", :contents, [:map, :string]
      field "subtitle", :subtitle, [:map, :string]
      field "url", :url, :string
      field "app_url", :app_url, :string
      field "data", :data, [:map, :string]
      field "buttons", :buttons, [:array, "CreateTemplateDtoContentButtonsItem"]
      field "big_picture", :big_picture, :string
      field "ios_attachments", :ios_attachments, [:map, :string]
      field "ios_sound", :ios_sound, :string
      # Değerler: "None", "SetTo", "Increase".
      field "ios_badge_type", :ios_badge_type, :string
      field "ios_badge_count", :ios_badge_count, :integer
      # Değerler: "passive", "active", "time-sensitive", "critical".
      field "ios_interruption_level", :ios_interruption_level, :string
      field "ios_category", :ios_category, :string
      field "android_channel_id", :android_channel_id, :string
      field "android_group", :android_group, :string
      field "android_sound", :android_sound, :string
      field "chrome_web_icon", :chrome_web_icon, :string
      field "chrome_web_image", :chrome_web_image, :string
      field "chrome_web_badge", :chrome_web_badge, :string
      field "web_push_topic", :web_push_topic, :string
      field "content_available", :content_available, :boolean
      field "mutable_content", :mutable_content, :boolean
      field "custom_data", :custom_data, [:map, :any]
      field "email_subject", :email_subject, :string
      field "email_body", :email_body, :string
      field "email_mjml", :email_mjml, :string
      field "email_preheader", :email_preheader, :string
      field "email_from_name", :email_from_name, :string
      field "email_from_address", :email_from_address, :string
      field "email_reply_to_address", :email_reply_to_address, :string
      field "disable_email_click_tracking", :disable_email_click_tracking, :boolean
      field "sms_from", :sms_from, :string
      field "disable_sms_link_shortening", :disable_sms_link_shortening, :boolean
      field "add_to_inbox", :add_to_inbox, :boolean
      field "inbox_ttl", :inbox_ttl, :integer
      field "thread_id", :thread_id, :string
      field "ios_relevance_score", :ios_relevance_score, :number
      field "target_content_identifier", :target_content_identifier, :string
      field "small_icon", :small_icon, :string
      field "large_icon", :large_icon, :string
      field "android_accent_color", :android_accent_color, :string
      # Değerler: 1, 0, -1.
      field "android_visibility", :android_visibility, :integer
      field "web_buttons", :web_buttons, [:array, "CreateTemplateDtoContentWebButtonsItem"]
      field "require_interaction", :require_interaction, :boolean
      field "sms_media_urls", :sms_media_urls, [:array, :string]
      field "whatsapp_template", :whatsapp_template, "CreateTemplateDtoContentWhatsappTemplate"
      field "whatsapp_media", :whatsapp_media, "CreateTemplateDtoContentWhatsappMedia"
      field "whatsapp_interactive", :whatsapp_interactive, "CreateTemplateDtoContentWhatsappInteractive"
      field "rcs_card", :rcs_card, "CreateTemplateDtoContentRcsCard"
      field "rcs_suggestions", :rcs_suggestions, [:array, :any]
      field "rcs_content_sid", :rcs_content_sid, :string
      field "rcs_content_variables", :rcs_content_variables, [:map, :string]
      field "rcs_fallback_text", :rcs_fallback_text, [:map, :string]
    end

    # CreateTemplateDtoContentButtonsItem şeması.
    class CreateTemplateDtoContentButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateTemplateDtoContentRcsCard şeması.
    class CreateTemplateDtoContentRcsCard < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "description", :description, [:map, :string]
      field "media_url", :media_url, :string
      # Değerler: "SHORT", "MEDIUM", "TALL".
      field "media_height", :media_height, :string
      # Değerler: "VERTICAL", "HORIZONTAL".
      field "orientation", :orientation, :string
    end

    # CreateTemplateDtoContentWebButtonsItem şeması.
    class CreateTemplateDtoContentWebButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateTemplateDtoContentWhatsappInteractive şeması.
    class CreateTemplateDtoContentWhatsappInteractive < Pushizo::BaseModel
      # Zorunlu. Değerler: "button", "list".
      field "type", :type, :string
      field "header", :header, :string
      field "footer", :footer, :string
      field "buttons", :buttons, [:array, "CreateTemplateDtoContentWhatsappInteractiveButtonsItem"]
      field "list", :list, "CreateTemplateDtoContentWhatsappInteractiveList"
    end

    # CreateTemplateDtoContentWhatsappInteractiveButtonsItem şeması.
    class CreateTemplateDtoContentWhatsappInteractiveButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
    end

    # CreateTemplateDtoContentWhatsappInteractiveList şeması.
    class CreateTemplateDtoContentWhatsappInteractiveList < Pushizo::BaseModel
      # Zorunlu.
      field "button", :button, :string
      # Zorunlu.
      field "sections", :sections, [:array, "CreateTemplateDtoContentWhatsappInteractiveListSectionsItem"]
    end

    # CreateTemplateDtoContentWhatsappInteractiveListSectionsItem şeması.
    class CreateTemplateDtoContentWhatsappInteractiveListSectionsItem < Pushizo::BaseModel
      field "title", :title, :string
      # Zorunlu.
      field "rows", :rows, [:array, "CreateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem"]
    end

    # CreateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem şeması.
    class CreateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
    end

    # CreateTemplateDtoContentWhatsappMedia şeması.
    class CreateTemplateDtoContentWhatsappMedia < Pushizo::BaseModel
      # Zorunlu. Değerler: "image", "video", "document", "audio".
      field "type", :type, :string
      # Zorunlu.
      field "url", :url, :string
      field "filename", :filename, :string
    end

    # CreateTemplateDtoContentWhatsappTemplate şeması.
    class CreateTemplateDtoContentWhatsappTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      field "header", :header, :any
      field "body_params", :body_params, [:array, :string]
      field "button_params", :button_params, [:array, "CreateTemplateDtoContentWhatsappTemplateButtonParamsItem"]
    end

    # CreateTemplateDtoContentWhatsappTemplateButtonParamsItem şeması.
    class CreateTemplateDtoContentWhatsappTemplateButtonParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu. Değerler: "url", "quick_reply", "copy_code".
      field "sub_type", :sub_type, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # CreateWarmupPlanDto şeması.
    class CreateWarmupPlanDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "domain", "ip".
      field "kind", :kind, :string
      # Zorunlu.
      field "target", :target, :string
      field "start_date", :start_date, :string
      field "daily_limits", :daily_limits, [:array, :integer]
      field "curve", :curve, "CreateWarmupPlanDtoCurve"
      field "provider_shares", :provider_shares, "CreateWarmupPlanDtoProviderShares"
      field "timezone", :timezone, :string
    end

    # CreateWarmupPlanDtoCurve şeması.
    class CreateWarmupPlanDtoCurve < Pushizo::BaseModel
      # Zorunlu.
      field "start", :start, :integer
      # Zorunlu.
      field "growth", :growth, :number
      # Zorunlu.
      field "target", :target, :integer
    end

    # CreateWarmupPlanDtoProviderShares şeması.
    class CreateWarmupPlanDtoProviderShares < Pushizo::BaseModel
      # Zorunlu.
      field "gmail", :gmail, :number
      # Zorunlu.
      field "outlook", :outlook, :number
      # Zorunlu.
      field "yahoo", :yahoo, :number
      # Zorunlu.
      field "other", :other, :number
    end

    # CreateWebhookDto şeması.
    class CreateWebhookDto < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "description", :description, :string
      # Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "audit.created".
      field "events", :events, [:array, :string]
      field "event_filters", :event_filters, "CreateWebhookDtoEventFilters"
      field "batch", :batch, :boolean
      field "headers", :headers, [:map, :string]
      field "body_template", :body_template, :string
      # Şablon çıktısının içerik türü (varsayılan application/json). Değerler: "application/json", "text/plain".
      field "body_content_type", :body_content_type, :string
      field "filters", :filters, "CreateWebhookDtoFilters"
    end

    # CreateWebhookDtoEventFilters şeması.
    class CreateWebhookDtoEventFilters < Pushizo::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # Olay filtresi: { match: all|any, conditions: [{ field, op, value? }] }.
    class CreateWebhookDtoFilters < Pushizo::BaseModel
      # Zorunlu. Değerler: "all", "any".
      field "match", :match, :string
      # Zorunlu.
      field "conditions", :conditions, [:array, "CreateWebhookDtoFiltersConditionsItem"]
    end

    # CreateWebhookDtoFiltersConditionsItem şeması.
    class CreateWebhookDtoFiltersConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu. Değerler: "eq", "neq", "in", "not_in", "starts_with", "contains", "exists", "not_exists".
      field "op", :op, :string
      field "value", :value, :any
    end

    # DataFeed şeması.
    class DataFeed < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "url_template", :url_template, :string
      # Zorunlu. Değerler: "GET", "POST".
      field "method", :method_value, :string
      # Zorunlu.
      field "body_template", :body_template, :string
      # Zorunlu.
      field "headers", :headers, [:map, :string]
      # Zorunlu.
      field "secret_header_names", :secret_header_names, [:array, :string]
      # Zorunlu.
      field "cache_ttl_seconds", :cache_ttl_seconds, :integer
      # Zorunlu.
      field "timeout_ms", :timeout_ms, :integer
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "liquid", :liquid, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # DataFeedList şeması.
    class DataFeedList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "DataFeed"]
    end

    # DataFeedTestResult şeması.
    class DataFeedTestResult < Pushizo::BaseModel
      # Zorunlu. Değerler: "ok", "cached", "timeout", "error", "circuit_open", "blocked", "invalid_json", "too_large", "http_error".
      field "status", :status, :string
      # Zorunlu.
      field "http_status", :http_status, :integer
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "preview", :preview, :any
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "user", :user, "DataFeedTestResultUser"
    end

    # DataFeedTestResultUser şeması.
    class DataFeedTestResultUser < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
    end

    # DeliverabilitySettingsDto şeması.
    class DeliverabilitySettingsDto < Pushizo::BaseModel
      field "bcc_address", :bcc_address, :string
      field "validation", :validation, "DeliverabilitySettingsDtoValidation"
      field "verifier", :verifier, "DeliverabilitySettingsDtoVerifier"
    end

    # DeliverabilitySettingsDtoValidation şeması.
    class DeliverabilitySettingsDtoValidation < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "check_mx", :check_mx, :boolean
      field "block_disposable", :block_disposable, :boolean
      field "block_role", :block_role, :boolean
    end

    # DeliverabilitySettingsDtoVerifier şeması.
    class DeliverabilitySettingsDtoVerifier < Pushizo::BaseModel
      # Zorunlu. Değerler: "zerobounce", "neverbounce", "mock".
      field "provider", :provider, :string
      field "api_key", :api_key, :string
    end

    # Delivery şeması.
    class Delivery < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "subscription_id", :subscription_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "provider", :provider, :string
      # Zorunlu. Değerler: "pending", "sent", "delivered", "failed", "bounced", "suppressed", "expired", "cancelled".
      field "status", :status, :string
      # Zorunlu.
      field "attempt_count", :attempt_count, :integer
      # Zorunlu.
      field "provider_message_id", :provider_message_id, :string
      # Zorunlu.
      field "error_code", :error_code, :string
      # Zorunlu.
      field "error_message", :error_message, :string
      # Zorunlu.
      field "suppression_reason", :suppression_reason, :string
      # Zorunlu.
      field "send_after", :send_after, :string
      # Zorunlu.
      field "sent_at", :sent_at, :string
      # Zorunlu.
      field "delivered_at", :delivered_at, :string
      # Zorunlu.
      field "opened_at", :opened_at, :string
      # Zorunlu.
      field "clicked_at", :clicked_at, :string
      # Zorunlu.
      field "failed_at", :failed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # DeliveryList şeması.
    class DeliveryList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Delivery"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # EmailAddressCheck şeması.
    class EmailAddressCheck < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu. Değerler: "syntax", "no_mx", "disposable", "role", "verifier_invalid".
      field "reason", :reason, :string
      # Zorunlu.
      field "detail", :detail, :string
      # Zorunlu.
      field "checks", :checks, [:array, :string]
      # Zorunlu.
      field "unknown", :unknown, [:array, :string]
    end

    # EmailDeliverabilitySettings şeması.
    class EmailDeliverabilitySettings < Pushizo::BaseModel
      # Zorunlu.
      field "bcc_address", :bcc_address, :string
      # Zorunlu.
      field "validation", :validation, "EmailDeliverabilitySettingsValidation"
      # Zorunlu.
      field "verifier", :verifier, "EmailDeliverabilitySettingsVerifier"
    end

    # EmailDeliverabilitySettingsValidation şeması.
    class EmailDeliverabilitySettingsValidation < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "check_mx", :check_mx, :boolean
      # Zorunlu.
      field "block_disposable", :block_disposable, :boolean
      # Zorunlu.
      field "block_role", :block_role, :boolean
    end

    # EmailDeliverabilitySettingsVerifier şeması.
    class EmailDeliverabilitySettingsVerifier < Pushizo::BaseModel
      # Zorunlu. Değerler: "zerobounce", "neverbounce", "mock".
      field "provider", :provider, :string
      # Zorunlu.
      field "has_key", :has_key, :boolean
    end

    # EmailWarmupPlan şeması.
    class EmailWarmupPlan < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "domain", "ip".
      field "kind", :kind, :string
      # Zorunlu.
      field "target", :target, :string
      # Zorunlu.
      field "start_date", :start_date, :string
      # Zorunlu.
      field "daily_limits", :daily_limits, [:array, :integer]
      # Zorunlu.
      field "provider_shares", :provider_shares, [:map, :number]
      # Zorunlu.
      field "timezone", :timezone, :string
      # Zorunlu. Değerler: "active", "paused", "completed".
      field "status", :status, :string
      # Zorunlu.
      field "today", :today, "EmailWarmupPlanToday"
      # Zorunlu.
      field "scheduled_ahead", :scheduled_ahead, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # EmailWarmupPlanList şeması.
    class EmailWarmupPlanList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "EmailWarmupPlan"]
    end

    # EmailWarmupPlanToday şeması.
    class EmailWarmupPlanToday < Pushizo::BaseModel
      # Zorunlu.
      field "day", :day, :string
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu.
      field "limit", :limit, :integer
      # Zorunlu.
      field "used", :used, :integer
      # Zorunlu.
      field "buckets", :buckets, [:map, "EmailWarmupPlanTodayBucketsValue"]
    end

    # EmailWarmupPlanTodayBucketsValue şeması.
    class EmailWarmupPlanTodayBucketsValue < Pushizo::BaseModel
      # Zorunlu.
      field "limit", :limit, :integer
      # Zorunlu.
      field "used", :used, :integer
    end

    # EmailWarmupUsage şeması.
    class EmailWarmupUsage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "EmailWarmupUsageDataItem"]
    end

    # EmailWarmupUsageDataItem şeması.
    class EmailWarmupUsageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "day", :day, :string
      # Zorunlu.
      field "bucket", :bucket, :string
      # Zorunlu.
      field "used", :used, :integer
      # Zorunlu.
      field "limit", :limit, :integer
    end

    # EndLiveActivityDto şeması.
    class EndLiveActivityDto < Pushizo::BaseModel
      # Zorunlu.
      field "activity_id", :activity_id, :string
      field "content_state", :content_state, [:map, :any]
      field "alert", :alert, "EndLiveActivityDtoAlert"
      field "stale_date", :stale_date, :integer
      field "dismissal_date", :dismissal_date, :integer
      field "relevance_score", :relevance_score, :number
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "name", :name, :string
    end

    # EndLiveActivityDtoAlert şeması.
    class EndLiveActivityDtoAlert < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "body", :body, [:map, :string]
      field "sound", :sound, :string
    end

    # EngagementReport şeması.
    class EngagementReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "timezone", :timezone, :string
      # Zorunlu.
      field "totals", :totals, "EngagementReportTotals"
      # Zorunlu.
      field "previous", :previous, "EngagementReportPrevious"
      # Zorunlu.
      field "cells", :cells, [:array, "EngagementReportCellsItem"]
      # Zorunlu.
      field "rows", :rows, [:array, "EngagementReportRowsItem"]
    end

    # EngagementReportCellsItem şeması.
    class EngagementReportCellsItem < Pushizo::BaseModel
      # Zorunlu.
      field "weekday", :weekday, :integer
      # Zorunlu.
      field "hour", :hour, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EngagementReportPrevious şeması.
    class EngagementReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EngagementReportRowsItem şeması.
    class EngagementReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EngagementReportTotals şeması.
    class EngagementReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EstimateAudienceDto şeması.
    class EstimateAudienceDto < Pushizo::BaseModel
      field "app_id", :app_id, :string
      # Zorunlu.
      field "target", :target, "EstimateAudienceDtoTarget"
      field "include_unsubscribed", :include_unsubscribed, :boolean
    end

    # EstimateAudienceDtoTarget şeması.
    class EstimateAudienceDtoTarget < Pushizo::BaseModel
      field "all", :all, :boolean
      field "include_subscription_ids", :include_subscription_ids, [:array, :string]
      field "include_external_ids", :include_external_ids, [:array, :string]
      field "include_aliases", :include_aliases, [:map, [:array, :string]]
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      field "filters", :filters, :any
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
      field "email_to", :email_to, [:array, :string]
      field "include_phone_numbers", :include_phone_numbers, [:array, :string]
    end

    # EstimateAudienceResult şeması.
    class EstimateAudienceResult < Pushizo::BaseModel
      # Zorunlu.
      field "recipients", :recipients, :integer
      # Zorunlu.
      field "by_channel", :by_channel, [:map, :integer]
      # Zorunlu.
      field "new_contacts", :new_contacts, :integer
      # Zorunlu.
      field "external_id_missing", :external_id_missing, [:array, :string]
    end

    # EventDefinition şeması.
    class EventDefinition < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "display_name", :display_name, :string
      # Zorunlu.
      field "properties_schema", :properties_schema, [:map, :string]
      # Zorunlu.
      field "is_conversion", :is_conversion, :boolean
      # Zorunlu.
      field "outcome_unique", :outcome_unique, :boolean
      # Zorunlu.
      field "outcome_unattributed", :outcome_unattributed, :boolean
      # Zorunlu.
      field "retention_days", :retention_days, :integer
      # Zorunlu.
      field "first_seen_at", :first_seen_at, :string
      # Zorunlu.
      field "last_seen_at", :last_seen_at, :string
      # Zorunlu.
      field "count_30d", :count_30d, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # EventDefinitionDetail şeması.
    class EventDefinitionDetail < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "display_name", :display_name, :string
      # Zorunlu.
      field "properties_schema", :properties_schema, [:map, :string]
      # Zorunlu.
      field "is_conversion", :is_conversion, :boolean
      # Zorunlu.
      field "outcome_unique", :outcome_unique, :boolean
      # Zorunlu.
      field "outcome_unattributed", :outcome_unattributed, :boolean
      # Zorunlu.
      field "retention_days", :retention_days, :integer
      # Zorunlu.
      field "first_seen_at", :first_seen_at, :string
      # Zorunlu.
      field "last_seen_at", :last_seen_at, :string
      # Zorunlu.
      field "count_30d", :count_30d, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "daily", :daily, [:array, "EventDefinitionDetailDailyItem"]
      # Zorunlu.
      field "properties", :properties, [:array, "EventDefinitionDetailPropertiesItem"]
    end

    # EventDefinitionDetailDailyItem şeması.
    class EventDefinitionDetailDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventDefinitionDetailPropertiesItem şeması.
    class EventDefinitionDetailPropertiesItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "values", :values, [:array, "EventDefinitionDetailPropertiesItemValuesItem"]
    end

    # EventDefinitionDetailPropertiesItemValuesItem şeması.
    class EventDefinitionDetailPropertiesItemValuesItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # EventDefinitionList şeması.
    class EventDefinitionList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "EventDefinition"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # EventsAccepted şeması.
    class EventsAccepted < Pushizo::BaseModel
      # Zorunlu.
      field "accepted", :accepted, :integer
    end

    # EventsReport şeması.
    class EventsReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu. Değerler: "day", "name".
      field "group_by", :group_by, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "totals", :totals, "EventsReportTotals"
      # Zorunlu.
      field "previous", :previous, "EventsReportPrevious"
      # Zorunlu.
      field "rows", :rows, [:array, "EventsReportRowsItem"]
    end

    # EventsReportPrevious şeması.
    class EventsReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventsReportRowsItem şeması.
    class EventsReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventsReportTotals şeması.
    class EventsReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # Export şeması.
    class Export < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "users", "subscriptions", "events", "deliveries", "message_events".
      field "type", :type, :string
      # Zorunlu.
      field "filters", :filters, "ExportFilters"
      # Zorunlu. Değerler: "pending", "running", "completed", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "download_url", :download_url, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "requested_by", :requested_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
    end

    # ExportFilters şeması.
    class ExportFilters < Pushizo::BaseModel
      field "from", :from, :string
      field "to", :to, :string
      field "name", :name, :string
      field "message_id", :message_id, :string
      field "campaign_id", :campaign_id, :string
      field "status", :status, :string
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      field "segment_id", :segment_id, :string
    end

    # ExportList şeması.
    class ExportList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Export"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # FunnelBodyDto şeması.
    class FunnelBodyDto < Pushizo::BaseModel
      # Zorunlu.
      field "steps", :steps, [:array, "FunnelBodyDtoStepsItem"]
      field "from", :from, :string
      field "to", :to, :string
      field "window_hours", :window_hours, :integer
      field "compare", :compare, :boolean
      # Değerler: "json", "csv".
      field "format", :format_value, :string
    end

    # FunnelBodyDtoStepsItem şeması.
    class FunnelBodyDtoStepsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "where", :where, "FunnelBodyDtoStepsItemWhere"
    end

    # FunnelBodyDtoStepsItemWhere şeması.
    class FunnelBodyDtoStepsItemWhere < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # FunnelReport şeması.
    class FunnelReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "window_hours", :window_hours, :integer
      # Zorunlu.
      field "steps", :steps, [:array, "FunnelReportStepsItem"]
      # Zorunlu.
      field "overall_rate", :overall_rate, :number
      # Zorunlu.
      field "previous", :previous, "FunnelReportPrevious"
    end

    # FunnelReportPrevious şeması.
    class FunnelReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "steps", :steps, [:array, :integer]
      # Zorunlu.
      field "overall_rate", :overall_rate, :number
    end

    # FunnelReportStepsItem şeması.
    class FunnelReportStepsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
      # Zorunlu.
      field "drop_off", :drop_off, :integer
    end

    # IdentityKey şeması.
    class IdentityKey < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "kid", :kid, :string
      # Zorunlu. Değerler: "ES256".
      field "alg", :alg, :string
      # Zorunlu.
      field "public_jwk", :public_jwk, [:map, :string]
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "revoked_at", :revoked_at, :string
    end

    # IdentityKeyList şeması.
    class IdentityKeyList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "IdentityKey"]
    end

    # Import şeması.
    class Import < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "eski sağlayıcı_players", "csv_users".
      field "type", :type, :string
      # Zorunlu.
      field "file_name", :file_name, :string
      # Zorunlu. Değerler: "pending", "running", "completed", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "stats", :stats, "ImportStats"
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "error_report_url", :error_report_url, :string
      # Zorunlu.
      field "requested_by", :requested_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
    end

    # ImportList şeması.
    class ImportList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Import"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # ImportStats şeması.
    class ImportStats < Pushizo::BaseModel
      field "processed", :processed, :integer
      field "created_users", :created_users, :integer
      field "updated_users", :updated_users, :integer
      field "created_subscriptions", :created_subscriptions, :integer
      field "skipped", :skipped, :integer
      field "errors", :errors, :integer
    end

    # InAppMessage şeması.
    class InAppMessage < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "priority", :priority, :integer
      # Zorunlu.
      field "triggers", :triggers, [:array, :any]
      # Zorunlu.
      field "trigger_groups", :trigger_groups, [:array, [:array, :any]]
      # Zorunlu.
      field "variants", :variants, [:array, "InAppMessageVariantsItem"]
      # Zorunlu.
      field "display", :display_value, "InAppMessageDisplay"
      # Zorunlu.
      field "audience", :audience, "InAppMessageAudience"
      # Zorunlu.
      field "frequency", :frequency, "InAppMessageFrequency"
      # Zorunlu.
      field "journey_only", :journey_only, :boolean
      # Zorunlu.
      field "start_at", :start_at, :string
      # Zorunlu.
      field "end_at", :end_at, :string
      # Zorunlu.
      field "stats", :stats, "InAppMessageStats"
      # Zorunlu.
      field "variant_stats", :variant_stats, [:array, "InAppMessageVariantStatsItem"]
      # Zorunlu.
      field "ab_test", :ab_test, "InAppMessageAbTest"
      # Zorunlu.
      field "variant_significance", :variant_significance, "InAppMessageVariantSignificance"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # InAppMessageAbTest şeması.
    class InAppMessageAbTest < Pushizo::BaseModel
      field "winner", :winner, "InAppMessageAbTestWinner"
      # Zorunlu.
      field "winner_variant_id", :winner_variant_id, :string
      # Zorunlu.
      field "decided_at", :decided_at, :string
      # Zorunlu.
      field "decided_by", :decided_by, :string
    end

    # InAppMessageAbTestWinner şeması.
    class InAppMessageAbTestWinner < Pushizo::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # InAppMessageAudience şeması.
    class InAppMessageAudience < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # InAppMessageDisplay şeması.
    class InAppMessageDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # InAppMessageFrequency şeması.
    class InAppMessageFrequency < Pushizo::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # InAppMessagePage şeması.
    class InAppMessagePage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "InAppMessage"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # InAppMessageStats şeması.
    class InAppMessageStats < Pushizo::BaseModel
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "dismissals", :dismissals, :integer
      # Zorunlu.
      field "unique_users", :unique_users, :integer
      # Zorunlu.
      field "ctr", :ctr, :number
    end

    # InAppMessageVariantSignificance şeması.
    class InAppMessageVariantSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "leader", :leader, :string
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
    end

    # InAppMessageVariantsItem şeması.
    class InAppMessageVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "InAppMessageVariantsItemDisplay"
    end

    # InAppMessageVariantsItemDisplay şeması.
    class InAppMessageVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # InAppMessageVariantStatsItem şeması.
    class InAppMessageVariantStatsItem < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "ctr", :ctr, :number
    end

    # InAppStatusDto şeması.
    class InAppStatusDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
    end

    # InAppWinnerDto şeması.
    class InAppWinnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # InboxItem şeması.
    class InboxItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "image_url", :image_url, :string
      # Zorunlu.
      field "data", :data, [:map, :string]
      # Zorunlu.
      field "read", :read, :boolean
      # Zorunlu.
      field "read_at", :read_at, :string
      # Zorunlu.
      field "archived_at", :archived_at, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # InboxPage şeması.
    class InboxPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "InboxItem"]
      # Zorunlu.
      field "unread_count", :unread_count, :integer
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # InboxReadAllResult şeması.
    class InboxReadAllResult < Pushizo::BaseModel
      # Zorunlu.
      field "updated", :updated, :integer
      # Zorunlu.
      field "unread_count", :unread_count, :integer
    end

    # IntegrationOk şeması.
    class IntegrationOk < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # Journey şeması.
    class Journey < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "current_version", :current_version, :integer
      # Zorunlu.
      field "draft_version", :draft_version, :integer
      # Zorunlu.
      field "trigger_kind", :trigger_kind, :string
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "summary", :summary, "JourneySummary"
    end

    # JourneyDetail şeması.
    class JourneyDetail < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "current_version", :current_version, :integer
      # Zorunlu.
      field "draft_version", :draft_version, :integer
      # Zorunlu.
      field "trigger_kind", :trigger_kind, :string
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "summary", :summary, "JourneyDetailSummary"
      # Zorunlu.
      field "editing", :editing, "JourneyDetailEditing"
      # Zorunlu.
      field "issues", :issues, [:array, "JourneyDetailIssuesItem"]
    end

    # JourneyDetailEditing şeması.
    class JourneyDetailEditing < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "graph", :graph, [:map, :any]
      # Zorunlu.
      field "settings", :settings, [:map, :any]
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "published_by", :published_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # JourneyDetailIssuesItem şeması.
    class JourneyDetailIssuesItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      field "node_id", :node_id, :string
      field "edge_id", :edge_id, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # JourneyDetailSummary şeması.
    class JourneyDetailSummary < Pushizo::BaseModel
      # Zorunlu.
      field "runs_total", :runs_total, :integer
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "completed", :completed, :integer
      # Zorunlu.
      field "exited", :exited, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "goal_reached", :goal_reached, :integer
    end

    # JourneyPage şeması.
    class JourneyPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Journey"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # JourneyPublishResult şeması.
    class JourneyPublishResult < Pushizo::BaseModel
      # Zorunlu.
      field "journey", :journey, "Journey"
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "issues", :issues, [:array, "JourneyPublishResultIssuesItem"]
    end

    # JourneyPublishResultIssuesItem şeması.
    class JourneyPublishResultIssuesItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      field "node_id", :node_id, :string
      field "edge_id", :edge_id, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # JourneyRun şeması.
    class JourneyRun < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "journey_id", :journey_id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "active", "waiting", "completed", "exited", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "current_node_id", :current_node_id, :string
      # Zorunlu.
      field "next_action_at", :next_action_at, :string
      # Zorunlu.
      field "entered_at", :entered_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
      # Zorunlu.
      field "exit_reason", :exit_reason, :string
      # Zorunlu.
      field "goal_id", :goal_id, :string
      # Zorunlu.
      field "goal_reached_at", :goal_reached_at, :string
      # Zorunlu.
      field "context", :context, [:map, :any]
    end

    # JourneyRunDetail şeması.
    class JourneyRunDetail < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "journey_id", :journey_id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "active", "waiting", "completed", "exited", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "current_node_id", :current_node_id, :string
      # Zorunlu.
      field "next_action_at", :next_action_at, :string
      # Zorunlu.
      field "entered_at", :entered_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
      # Zorunlu.
      field "exit_reason", :exit_reason, :string
      # Zorunlu.
      field "goal_id", :goal_id, :string
      # Zorunlu.
      field "goal_reached_at", :goal_reached_at, :string
      # Zorunlu.
      field "context", :context, [:map, :any]
      # Zorunlu.
      field "journey_name", :journey_name, :string
      # Zorunlu.
      field "steps", :steps, [:array, "JourneyRunDetailStepsItem"]
    end

    # JourneyRunDetailStepsItem şeması.
    class JourneyRunDetailStepsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "node_id", :node_id, :string
      # Zorunlu.
      field "node_type", :node_type, :string
      # Zorunlu. Değerler: "completed", "waiting", "failed", "skipped".
      field "status", :status, :string
      # Zorunlu.
      field "branch", :branch, :string
      # Zorunlu.
      field "result", :result, [:map, :any]
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "finished_at", :finished_at, :string
    end

    # JourneyRunPage şeması.
    class JourneyRunPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "JourneyRun"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # JourneysCreateBody şeması.
    class JourneysCreateBody < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
      field "graph", :graph, "JourneysCreateBodyGraph"
      # Yeniden giriş, yalnızca yeni girenler, çıkış kuralları, çıkış tag'leri, hedefler, takvim (docs/journeys.md)
      field "settings", :settings, [:map, :any]
    end

    # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
    class JourneysCreateBodyGraph < Pushizo::BaseModel
      # Zorunlu.
      field "nodes", :nodes, [:array, [:map, :any]]
      # Zorunlu.
      field "edges", :edges, [:array, [:map, :any]]
    end

    # JourneysSaveDraftBody şeması.
    class JourneysSaveDraftBody < Pushizo::BaseModel
      # Zorunlu. React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
      field "graph", :graph, "JourneysSaveDraftBodyGraph"
      # Yeniden giriş, yalnızca yeni girenler, çıkış kuralları, çıkış tag'leri, hedefler, takvim (docs/journeys.md)
      field "settings", :settings, [:map, :any]
    end

    # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
    class JourneysSaveDraftBodyGraph < Pushizo::BaseModel
      # Zorunlu.
      field "nodes", :nodes, [:array, [:map, :any]]
      # Zorunlu.
      field "edges", :edges, [:array, [:map, :any]]
    end

    # JourneyStats şeması.
    class JourneyStats < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "summary", :summary, "JourneyStatsSummary"
      # Zorunlu.
      field "nodes", :nodes, [:array, "JourneyStatsNodesItem"]
      # Zorunlu.
      field "goals", :goals, [:array, "JourneyStatsGoalsItem"]
      # Zorunlu.
      field "exit_reasons", :exit_reasons, [:map, :integer]
    end

    # JourneyStatsGoalsItem şeması.
    class JourneyStatsGoalsItem < Pushizo::BaseModel
      # Zorunlu.
      field "goal_id", :goal_id, :string
      # Zorunlu.
      field "reached", :reached, :integer
    end

    # JourneyStatsNodesItem şeması.
    class JourneyStatsNodesItem < Pushizo::BaseModel
      # Zorunlu.
      field "node_id", :node_id, :string
      # Zorunlu.
      field "node_type", :node_type, :string
      # Zorunlu.
      field "entered", :entered, :integer
      # Zorunlu.
      field "completed", :completed, :integer
      # Zorunlu.
      field "waiting_now", :waiting_now, :integer
      # Zorunlu.
      field "skipped", :skipped, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "branches", :branches, [:map, :integer]
      field "messages", :messages, [:map, :integer]
      field "variants", :variants, [:array, "JourneyStatsNodesItemVariantsItem"]
    end

    # JourneyStatsNodesItemVariantsItem şeması.
    class JourneyStatsNodesItemVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "winner", :winner, :boolean
    end

    # JourneyStatsSummary şeması.
    class JourneyStatsSummary < Pushizo::BaseModel
      # Zorunlu.
      field "runs_total", :runs_total, :integer
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "completed", :completed, :integer
      # Zorunlu.
      field "exited", :exited, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "goal_reached", :goal_reached, :integer
      # Zorunlu.
      field "waiting", :waiting, :integer
      # Zorunlu.
      field "goal_conversion_rate", :goal_conversion_rate, :number
    end

    # JourneySummary şeması.
    class JourneySummary < Pushizo::BaseModel
      # Zorunlu.
      field "runs_total", :runs_total, :integer
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "completed", :completed, :integer
      # Zorunlu.
      field "exited", :exited, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "goal_reached", :goal_reached, :integer
    end

    # JourneyTriggerResult şeması.
    class JourneyTriggerResult < Pushizo::BaseModel
      # Zorunlu.
      field "entered", :entered, :boolean
      # Zorunlu.
      field "run", :run, "JourneyRun"
      # Zorunlu. Değerler: "inactive", "outside_schedule", "re_entry", "already_active", "unknown_user".
      field "reason", :reason, :string
    end

    # JourneyVersionList şeması.
    class JourneyVersionList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "JourneyVersionListDataItem"]
    end

    # JourneyVersionListDataItem şeması.
    class JourneyVersionListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "graph", :graph, [:map, :any]
      # Zorunlu.
      field "settings", :settings, [:map, :any]
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "published_by", :published_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # LiveActivitySendResult şeması.
    class LiveActivitySendResult < Pushizo::BaseModel
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "activity_id", :activity_id, :string
      # Zorunlu. Değerler: "start", "update", "end".
      field "event", :event, :string
      # Zorunlu.
      field "recipients_estimate", :recipients_estimate, :integer
    end

    # LiveActivityTokenResult şeması.
    class LiveActivityTokenResult < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # LiveActivityType şeması.
    class LiveActivityType < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "content_state_schema", :content_state_schema, "LiveActivityTypeContentStateSchema"
      # Zorunlu.
      field "attributes_schema", :attributes_schema, "LiveActivityTypeAttributesSchema"
      # Zorunlu.
      field "push_to_start_tokens", :push_to_start_tokens, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # LiveActivityTypeAttributesSchema şeması.
    class LiveActivityTypeAttributesSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "LiveActivityTypeAttributesSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # LiveActivityTypeAttributesSchemaPropertiesValue şeması.
    class LiveActivityTypeAttributesSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # LiveActivityTypeContentStateSchema şeması.
    class LiveActivityTypeContentStateSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "LiveActivityTypeContentStateSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # LiveActivityTypeContentStateSchemaPropertiesValue şeması.
    class LiveActivityTypeContentStateSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # LiveActivityTypeList şeması.
    class LiveActivityTypeList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "LiveActivityType"]
    end

    # McpCreateCampaignDraftBody şeması.
    class McpCreateCampaignDraftBody < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "one_time", "scheduled", "recurring".
      field "type", :type, :string
      field "audience", :audience, "McpCreateCampaignDraftBodyAudience"
      # messages.content ile aynı şema (headings, contents, url, buttons…)
      field "content", :content, [:map, :any]
      field "labels", :labels, [:array, :string]
      # Tercih kategorisi anahtarı; kapalı kullanıcılar bastırılır
      field "category", :category, :string
      field "ab_test", :ab_test, "McpCreateCampaignDraftBodyAbTest"
      # A/B varyantları (ağırlıklar toplamı 100; en fazla bir is_control)
      field "variants", :variants, [:array, "McpCreateCampaignDraftBodyVariantsItem"]
      field "template_id", :template_id, :string
      field "template_version", :template_version, :integer
      field "delivery", :delivery, "McpCreateCampaignDraftBodyDelivery"
      field "recurrence", :recurrence, "McpCreateCampaignDraftBodyRecurrence"
      field "send_at", :send_at, :string
    end

    # McpCreateCampaignDraftBodyAbTest şeması.
    class McpCreateCampaignDraftBodyAbTest < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "McpCreateCampaignDraftBodyAbTestWinner"
    end

    # McpCreateCampaignDraftBodyAbTestWinner şeması.
    class McpCreateCampaignDraftBodyAbTestWinner < Pushizo::BaseModel
      # Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # McpCreateCampaignDraftBodyAudience şeması.
    class McpCreateCampaignDraftBodyAudience < Pushizo::BaseModel
      field "all", :all, :boolean
      field "segments", :segments, [:array, :string]
      field "exclude_segments", :exclude_segments, [:array, :string]
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "filters", :filters, "McpCreateCampaignDraftBodyAudienceFilters"
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class McpCreateCampaignDraftBodyAudienceFilters < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # McpCreateCampaignDraftBodyDelivery şeması.
    class McpCreateCampaignDraftBodyDelivery < Pushizo::BaseModel
      # Değerler: "immediate", "per_user_timezone", "optimized".
      field "timezone_mode", :timezone_mode, :string
      field "delivery_time_of_day", :delivery_time_of_day, :string
      field "throttle_per_minute", :throttle_per_minute, :integer
      field "ttl", :ttl, :integer
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "collapse_id", :collapse_id, :string
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # McpCreateCampaignDraftBodyRecurrence şeması.
    class McpCreateCampaignDraftBodyRecurrence < Pushizo::BaseModel
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # McpCreateCampaignDraftBodyVariantsItem şeması.
    class McpCreateCampaignDraftBodyVariantsItem < Pushizo::BaseModel
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      field "content", :content, [:map, :any]
      field "is_control", :is_control, :boolean
    end

    # McpCreateSegmentDraftBody şeması.
    class McpCreateSegmentDraftBody < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "McpCreateSegmentDraftBodyDefinition"
      field "is_dynamic", :is_dynamic, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class McpCreateSegmentDraftBodyDefinition < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # Member şeması.
    class Member < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "account_id", :account_id, :string
      # Zorunlu.
      field "email", :email, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "owner", "admin", "developer", "marketer", "analyst", "billing", "viewer", "composer".
      field "role", :role, :string
      # Zorunlu.
      field "app_scopes", :app_scopes, [:array, :string]
      # Zorunlu.
      field "accepted_at", :accepted_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "last_login_at", :last_login_at, :string
    end

    # MemberList şeması.
    class MemberList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Member"]
    end

    # Message şeması.
    class Message < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "campaign", "api", "journey", "test".
      field "source", :source, :string
      # Zorunlu. Değerler: "queued", "processing", "completed", "cancelled", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "idempotency_key", :idempotency_key, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "target", :target, [:map, :any]
      # Zorunlu.
      field "options", :options, [:map, :any]
      # Zorunlu.
      field "labels", :labels, [:array, :string]
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "template_id", :template_id, :string
      # Zorunlu.
      field "campaign_id", :campaign_id, :string
      # Zorunlu.
      field "variants", :variants, [:array, "MessageVariantsItem"]
      # Zorunlu.
      field "counts", :counts, "MessageCounts"
      # Zorunlu.
      field "requested_by", :requested_by, "MessageRequestedBy"
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "scheduled_for", :scheduled_for, :string
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # MessageCategory şeması.
    class MessageCategory < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, [:map, :string]
      # Zorunlu.
      field "description", :description, [:map, :string]
      # Zorunlu.
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "default_opted_in", :default_opted_in, :boolean
      # Zorunlu.
      field "position", :position, :integer
      # Zorunlu.
      field "opted_out_users", :opted_out_users, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # MessageCategoryList şeması.
    class MessageCategoryList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "MessageCategory"]
    end

    # MessageCounts şeması.
    class MessageCounts < Pushizo::BaseModel
      field "targeted", :targeted, :integer
      field "suppressed", :suppressed, :integer
      field "sent", :sent, :integer
      field "delivered", :delivered, :integer
      field "failed", :failed, :integer
      field "errored", :errored, :integer
      field "expired", :expired, :integer
      field "opened", :opened, :integer
      field "clicked", :clicked, :integer
      field "converted", :converted, :integer
      field "bounced", :bounced, :integer
      field "complained", :complained, :integer
      field "unsubscribed", :unsubscribed, :integer
      field "sms_segments", :sms_segments, :integer
    end

    # MessageList şeması.
    class MessageList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Message"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # MessageRequestedBy şeması.
    class MessageRequestedBy < Pushizo::BaseModel
      # Zorunlu. Değerler: "api_key", "account", "system".
      field "type", :type, :string
      field "id", :id, :string
    end

    # MessagesReport şeması.
    class MessagesReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu. Değerler: "day", "channel", "campaign".
      field "group_by", :group_by, :string
      # Zorunlu.
      field "totals", :totals, "MessagesReportTotals"
      # Zorunlu.
      field "previous", :previous, "MessagesReportPrevious"
      # Zorunlu.
      field "rows", :rows, [:array, "MessagesReportRowsItem"]
    end

    # MessagesReportPrevious şeması.
    class MessagesReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
    end

    # MessagesReportRowsItem şeması.
    class MessagesReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
    end

    # MessagesReportTotals şeması.
    class MessagesReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
    end

    # MessageVariantsItem şeması.
    class MessageVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "is_control", :is_control, :boolean
    end

    # Ok şeması.
    class Ok < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # Org şeması.
    class Org < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "plan_code", :plan_code, :string
      # Zorunlu. Değerler: "active", "suspended", "deleted".
      field "status", :status, :string
      # Zorunlu.
      field "settings", :settings, "OrgSettings"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "region", :region, :string
      # Zorunlu.
      field "managed_by_reseller", :managed_by_reseller, :boolean
    end

    # OrgSettings şeması.
    class OrgSettings < Pushizo::BaseModel
      field "mfaRequired", :mfa_required, :boolean
      field "ipAllowlist", :ip_allowlist, [:array, :string]
      field "retentionDays", :retention_days, :integer
      field "sessionMaxHours", :session_max_hours, :integer
      field "auditStream", :audit_stream, "OrgSettingsAuditStream"
    end

    # OrgSettingsAuditStream şeması.
    class OrgSettingsAuditStream < Pushizo::BaseModel
      field "s3", :s3, :boolean
      field "webhookAppId", :webhook_app_id, :string
    end

    # OverviewStats şeması.
    class OverviewStats < Pushizo::BaseModel
      # Zorunlu. Değerler: "7d", "30d", "custom".
      field "range", :range, :string
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "kpis", :kpis, "OverviewStatsKpis"
      # Zorunlu.
      field "series", :series, [:array, "OverviewStatsSeriesItem"]
      # Zorunlu.
      field "recent_messages", :recent_messages, [:array, "Message"]
      # Zorunlu.
      field "recent_campaigns", :recent_campaigns, [:array, "OverviewStatsRecentCampaignsItem"]
      # Zorunlu.
      field "top_errors", :top_errors, [:array, "OverviewStatsTopErrorsItem"]
      # Zorunlu.
      field "channels", :channels, [:array, "OverviewStatsChannelsItem"]
    end

    # OverviewStatsChannelsItem şeması.
    class OverviewStatsChannelsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "hms", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "meta_whatsapp", "google_rbm", "mock".
      field "provider", :provider, :string
      # Zorunlu. Değerler: "unconfigured", "active", "invalid", "suspended".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "active_subscriptions", :active_subscriptions, :integer
    end

    # OverviewStatsKpis şeması.
    class OverviewStatsKpis < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
      # Zorunlu.
      field "active_subscriptions", :active_subscriptions, :integer
      # Zorunlu.
      field "new_subscriptions", :new_subscriptions, :integer
      # Zorunlu.
      field "opt_outs", :opt_outs, :integer
    end

    # OverviewStatsRecentCampaignsItem şeması.
    class OverviewStatsRecentCampaignsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # OverviewStatsSeriesItem şeması.
    class OverviewStatsSeriesItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "opened", :opened, :integer
    end

    # OverviewStatsTopErrorsItem şeması.
    class OverviewStatsTopErrorsItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # PatchEventDefinitionDto şeması.
    class PatchEventDefinitionDto < Pushizo::BaseModel
      field "display_name", :display_name, :string
      field "is_conversion", :is_conversion, :boolean
      field "outcome_unique", :outcome_unique, :boolean
      field "outcome_unattributed", :outcome_unattributed, :boolean
      field "retention_days", :retention_days, :integer
    end

    # PatchSubscriptionDto şeması.
    class PatchSubscriptionDto < Pushizo::BaseModel
      field "token", :token, :string
      field "device", :device, "PatchSubscriptionDtoDevice"
      # Değerler: "subscribed", "unsubscribed".
      field "status", :status, :string
      field "test_device", :test_device, :boolean
      field "test_device_name", :test_device_name, :string
    end

    # PatchSubscriptionDtoDevice şeması.
    class PatchSubscriptionDtoDevice < Pushizo::BaseModel
      field "model", :model, :string
      field "os", :os, :string
      field "os_version", :os_version, :string
      field "app_version", :app_version, :string
      field "sdk_version", :sdk_version, :string
      field "sdk_platform", :sdk_platform, :string
      field "carrier", :carrier, :string
      field "locale", :locale, :string
      field "timezone", :timezone, :string
      field "push_capable", :push_capable, :boolean
      # Değerler: "sandbox", "production".
      field "push_environment", :push_environment, :string
    end

    # PatchUserDto şeması.
    class PatchUserDto < Pushizo::BaseModel
      field "properties", :properties, [:map, :any]
      field "tags", :tags, [:map, :string]
      field "deltas", :deltas, "PatchUserDtoDeltas"
    end

    # PatchUserDtoDeltas şeması.
    class PatchUserDtoDeltas < Pushizo::BaseModel
      field "session_count", :session_count, :integer
      field "session_time", :session_time, :integer
      field "purchases", :purchases, [:array, "PatchUserDtoDeltasPurchasesItem"]
    end

    # PatchUserDtoDeltasPurchasesItem şeması.
    class PatchUserDtoDeltasPurchasesItem < Pushizo::BaseModel
      # Zorunlu.
      field "sku", :sku, :string
      # Zorunlu.
      field "amount", :amount, :number
      field "iso", :iso, :string
      field "count", :count, :integer
    end

    # ProvidersReport şeması.
    class ProvidersReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "totals", :totals, "ProvidersReportTotals"
      # Zorunlu.
      field "previous", :previous, "ProvidersReportPrevious"
      # Zorunlu.
      field "rows", :rows, [:array, "ProvidersReportRowsItem"]
    end

    # ProvidersReportPrevious şeması.
    class ProvidersReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
    end

    # ProvidersReportRowsItem şeması.
    class ProvidersReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "channel", :channel, :string
      # Zorunlu.
      field "provider", :provider, :string
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
      # Zorunlu.
      field "latency_p50_ms", :latency_p50_ms, :number
      # Zorunlu.
      field "latency_p95_ms", :latency_p95_ms, :number
      # Zorunlu.
      field "errors", :errors, [:array, "ProvidersReportRowsItemErrorsItem"]
    end

    # ProvidersReportRowsItemErrorsItem şeması.
    class ProvidersReportRowsItemErrorsItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # ProvidersReportTotals şeması.
    class ProvidersReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
    end

    # RenderPreview şeması.
    class RenderPreview < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "subtitle", :subtitle, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "image_url", :image_url, :string
      # Zorunlu.
      field "icon_url", :icon_url, :string
      # Zorunlu.
      field "buttons", :buttons, [:array, "RenderPreviewButtonsItem"]
      # Zorunlu.
      field "data", :data, [:map, :string]
      # Zorunlu.
      field "warnings", :warnings, [:array, :string]
      field "email", :email, "RenderPreviewEmail"
      field "sms", :sms, "RenderPreviewSms"
    end

    # RenderPreviewButtonsItem şeması.
    class RenderPreviewButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      # Zorunlu.
      field "url", :url, :string
    end

    # RenderPreviewEmail şeması.
    class RenderPreviewEmail < Pushizo::BaseModel
      # Zorunlu.
      field "subject", :subject, :string
      # Zorunlu.
      field "preheader", :preheader, :string
      # Zorunlu.
      field "html", :html, :string
      # Zorunlu.
      field "text", :text, :string
    end

    # RenderPreviewSms şeması.
    class RenderPreviewSms < Pushizo::BaseModel
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu. Değerler: "gsm7", "gsm7_tr", "ucs2".
      field "encoding", :encoding, :string
      # Zorunlu.
      field "characters", :characters, :integer
      # Zorunlu.
      field "segments", :segments, :integer
      # Zorunlu.
      field "per_segment", :per_segment, :integer
      # Zorunlu.
      field "non_gsm_characters", :non_gsm_characters, [:array, :string]
      # Zorunlu.
      field "turkish_characters", :turkish_characters, [:array, :string]
    end

    # RenderTemplateDto şeması.
    class RenderTemplateDto < Pushizo::BaseModel
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      field "language", :language, :string
      field "user", :user, "RenderTemplateDtoUser"
      field "custom_data", :custom_data, [:map, :any]
      field "content", :content, "RenderTemplateDtoContent"
      field "version", :version, :integer
    end

    # RenderTemplateDtoContent şeması.
    class RenderTemplateDtoContent < Pushizo::BaseModel
      field "headings", :headings, [:map, :string]
      field "contents", :contents, [:map, :string]
      field "subtitle", :subtitle, [:map, :string]
      field "url", :url, :string
      field "app_url", :app_url, :string
      field "data", :data, [:map, :string]
      field "buttons", :buttons, [:array, "RenderTemplateDtoContentButtonsItem"]
      field "big_picture", :big_picture, :string
      field "ios_attachments", :ios_attachments, [:map, :string]
      field "ios_sound", :ios_sound, :string
      # Değerler: "None", "SetTo", "Increase".
      field "ios_badge_type", :ios_badge_type, :string
      field "ios_badge_count", :ios_badge_count, :integer
      # Değerler: "passive", "active", "time-sensitive", "critical".
      field "ios_interruption_level", :ios_interruption_level, :string
      field "ios_category", :ios_category, :string
      field "android_channel_id", :android_channel_id, :string
      field "android_group", :android_group, :string
      field "android_sound", :android_sound, :string
      field "chrome_web_icon", :chrome_web_icon, :string
      field "chrome_web_image", :chrome_web_image, :string
      field "chrome_web_badge", :chrome_web_badge, :string
      field "web_push_topic", :web_push_topic, :string
      field "content_available", :content_available, :boolean
      field "mutable_content", :mutable_content, :boolean
      field "custom_data", :custom_data, [:map, :any]
      field "email_subject", :email_subject, :string
      field "email_body", :email_body, :string
      field "email_mjml", :email_mjml, :string
      field "email_preheader", :email_preheader, :string
      field "email_from_name", :email_from_name, :string
      field "email_from_address", :email_from_address, :string
      field "email_reply_to_address", :email_reply_to_address, :string
      field "disable_email_click_tracking", :disable_email_click_tracking, :boolean
      field "sms_from", :sms_from, :string
      field "disable_sms_link_shortening", :disable_sms_link_shortening, :boolean
      field "add_to_inbox", :add_to_inbox, :boolean
      field "inbox_ttl", :inbox_ttl, :integer
      field "thread_id", :thread_id, :string
      field "ios_relevance_score", :ios_relevance_score, :number
      field "target_content_identifier", :target_content_identifier, :string
      field "small_icon", :small_icon, :string
      field "large_icon", :large_icon, :string
      field "android_accent_color", :android_accent_color, :string
      # Değerler: 1, 0, -1.
      field "android_visibility", :android_visibility, :integer
      field "web_buttons", :web_buttons, [:array, "RenderTemplateDtoContentWebButtonsItem"]
      field "require_interaction", :require_interaction, :boolean
      field "sms_media_urls", :sms_media_urls, [:array, :string]
      field "whatsapp_template", :whatsapp_template, "RenderTemplateDtoContentWhatsappTemplate"
      field "whatsapp_media", :whatsapp_media, "RenderTemplateDtoContentWhatsappMedia"
      field "whatsapp_interactive", :whatsapp_interactive, "RenderTemplateDtoContentWhatsappInteractive"
      field "rcs_card", :rcs_card, "RenderTemplateDtoContentRcsCard"
      field "rcs_suggestions", :rcs_suggestions, [:array, :any]
      field "rcs_content_sid", :rcs_content_sid, :string
      field "rcs_content_variables", :rcs_content_variables, [:map, :string]
      field "rcs_fallback_text", :rcs_fallback_text, [:map, :string]
    end

    # RenderTemplateDtoContentButtonsItem şeması.
    class RenderTemplateDtoContentButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # RenderTemplateDtoContentRcsCard şeması.
    class RenderTemplateDtoContentRcsCard < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "description", :description, [:map, :string]
      field "media_url", :media_url, :string
      # Değerler: "SHORT", "MEDIUM", "TALL".
      field "media_height", :media_height, :string
      # Değerler: "VERTICAL", "HORIZONTAL".
      field "orientation", :orientation, :string
    end

    # RenderTemplateDtoContentWebButtonsItem şeması.
    class RenderTemplateDtoContentWebButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # RenderTemplateDtoContentWhatsappInteractive şeması.
    class RenderTemplateDtoContentWhatsappInteractive < Pushizo::BaseModel
      # Zorunlu. Değerler: "button", "list".
      field "type", :type, :string
      field "header", :header, :string
      field "footer", :footer, :string
      field "buttons", :buttons, [:array, "RenderTemplateDtoContentWhatsappInteractiveButtonsItem"]
      field "list", :list, "RenderTemplateDtoContentWhatsappInteractiveList"
    end

    # RenderTemplateDtoContentWhatsappInteractiveButtonsItem şeması.
    class RenderTemplateDtoContentWhatsappInteractiveButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
    end

    # RenderTemplateDtoContentWhatsappInteractiveList şeması.
    class RenderTemplateDtoContentWhatsappInteractiveList < Pushizo::BaseModel
      # Zorunlu.
      field "button", :button, :string
      # Zorunlu.
      field "sections", :sections, [:array, "RenderTemplateDtoContentWhatsappInteractiveListSectionsItem"]
    end

    # RenderTemplateDtoContentWhatsappInteractiveListSectionsItem şeması.
    class RenderTemplateDtoContentWhatsappInteractiveListSectionsItem < Pushizo::BaseModel
      field "title", :title, :string
      # Zorunlu.
      field "rows", :rows, [:array, "RenderTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem"]
    end

    # RenderTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem şeması.
    class RenderTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
    end

    # RenderTemplateDtoContentWhatsappMedia şeması.
    class RenderTemplateDtoContentWhatsappMedia < Pushizo::BaseModel
      # Zorunlu. Değerler: "image", "video", "document", "audio".
      field "type", :type, :string
      # Zorunlu.
      field "url", :url, :string
      field "filename", :filename, :string
    end

    # RenderTemplateDtoContentWhatsappTemplate şeması.
    class RenderTemplateDtoContentWhatsappTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      field "header", :header, :any
      field "body_params", :body_params, [:array, :string]
      field "button_params", :button_params, [:array, "RenderTemplateDtoContentWhatsappTemplateButtonParamsItem"]
    end

    # RenderTemplateDtoContentWhatsappTemplateButtonParamsItem şeması.
    class RenderTemplateDtoContentWhatsappTemplateButtonParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu. Değerler: "url", "quick_reply", "copy_code".
      field "sub_type", :sub_type, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # RenderTemplateDtoUser şeması.
    class RenderTemplateDtoUser < Pushizo::BaseModel
      field "external_id", :external_id, :string
      field "tags", :tags, [:map, :string]
      field "properties", :properties, [:map, :any]
    end

    # RetentionReport şeması.
    class RetentionReport < Pushizo::BaseModel
      # Zorunlu.
      field "weeks", :weeks, :integer
      # Zorunlu.
      field "cohorts", :cohorts, [:array, "RetentionReportCohortsItem"]
      # Zorunlu.
      field "average", :average, [:array, :number]
    end

    # RetentionReportCohortsItem şeması.
    class RetentionReportCohortsItem < Pushizo::BaseModel
      # Zorunlu.
      field "week", :week, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "retention", :retention, [:array, :number]
    end

    # ScheduleCampaignDto şeması.
    class ScheduleCampaignDto < Pushizo::BaseModel
      field "send_at", :send_at, :string
      field "recurrence", :recurrence, "ScheduleCampaignDtoRecurrence"
    end

    # ScheduleCampaignDtoRecurrence şeması.
    class ScheduleCampaignDtoRecurrence < Pushizo::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # Segment şeması.
    class Segment < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "definition", :definition, [:map, :any]
      # Zorunlu.
      field "is_dynamic", :is_dynamic, :boolean
      # Zorunlu.
      field "estimated_count", :estimated_count, :integer
      # Zorunlu.
      field "estimated_at", :estimated_at, :string
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SegmentCampaigns şeması.
    class SegmentCampaigns < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SegmentCampaignsDataItem"]
    end

    # SegmentCampaignsDataItem şeması.
    class SegmentCampaignsDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu. Değerler: "include", "exclude".
      field "usage", :usage, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SegmentEstimate şeması.
    class SegmentEstimate < Pushizo::BaseModel
      # Zorunlu.
      field "segment_id", :segment_id, :string
      # Zorunlu.
      field "subscriptions", :subscriptions, :integer
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "estimated_at", :estimated_at, :string
      # Zorunlu.
      field "cached", :cached, :boolean
      # Zorunlu.
      field "sampled", :sampled, :boolean
    end

    # SegmentPage şeması.
    class SegmentPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Segment"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SegmentPreview şeması.
    class SegmentPreview < Pushizo::BaseModel
      # Zorunlu.
      field "subscriptions", :subscriptions, :integer
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "sampled", :sampled, :boolean
      # Zorunlu.
      field "sample", :sample, [:array, "SegmentPreviewSampleItem"]
    end

    # SegmentPreviewSampleItem şeması.
    class SegmentPreviewSampleItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "tags", :tags, [:map, :string]
      # Zorunlu.
      field "last_active_at", :last_active_at, :string
    end

    # SegmentsCreateBody şeması.
    class SegmentsCreateBody < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsCreateBodyDefinition"
      field "is_dynamic", :is_dynamic, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsCreateBodyDefinition < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SegmentsPreviewBody şeması.
    class SegmentsPreviewBody < Pushizo::BaseModel
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsPreviewBodyDefinition"
      field "limit", :limit, :integer
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsPreviewBodyDefinition < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SegmentsUpdateBody şeması.
    class SegmentsUpdateBody < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsUpdateBodyDefinition"
      field "is_dynamic", :is_dynamic, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsUpdateBodyDefinition < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SelectWinnerDto şeması.
    class SelectWinnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # SetOwnerDto şeması.
    class SetOwnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "external_id", :external_id, :string
    end

    # SetPreferencesDto şeması.
    class SetPreferencesDto < Pushizo::BaseModel
      # Zorunlu.
      field "preferences", :preferences, [:array, "SetPreferencesDtoPreferencesItem"]
    end

    # SetPreferencesDtoPreferencesItem şeması.
    class SetPreferencesDtoPreferencesItem < Pushizo::BaseModel
      # Zorunlu.
      field "category", :category, :string
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "opted_in", :opted_in, :boolean
    end

    # SmsKeyword şeması.
    class SmsKeyword < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "keyword", :keyword, :string
      # Zorunlu. Değerler: "org", "app".
      field "scope", :scope, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "actions", :actions, [:map, :any]
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SmsKeywordList şeması.
    class SmsKeywordList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SmsKeyword"]
      # Zorunlu.
      field "reserved", :reserved, [:array, :string]
    end

    # StartLiveActivityDto şeması.
    class StartLiveActivityDto < Pushizo::BaseModel
      field "activity_id", :activity_id, :string
      field "attributes", :attributes_value, [:map, :any]
      # Zorunlu.
      field "target", :target, "StartLiveActivityDtoTarget"
      # Zorunlu.
      field "content_state", :content_state, [:map, :any]
      field "alert", :alert, "StartLiveActivityDtoAlert"
      field "stale_date", :stale_date, :integer
      field "dismissal_date", :dismissal_date, :integer
      field "relevance_score", :relevance_score, :number
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "name", :name, :string
    end

    # StartLiveActivityDtoAlert şeması.
    class StartLiveActivityDtoAlert < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "body", :body, [:map, :string]
      field "sound", :sound, :string
    end

    # StartLiveActivityDtoTarget şeması.
    class StartLiveActivityDtoTarget < Pushizo::BaseModel
      field "include_external_ids", :include_external_ids, [:array, :string]
      field "include_subscription_ids", :include_subscription_ids, [:array, :string]
      field "included_segments", :included_segments, [:array, :string]
      field "all", :all, :boolean
    end

    # Subscription şeması.
    class Subscription < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "token", :token, :string
      # Zorunlu. Değerler: "subscribed", "unsubscribed", "invalid", "pending".
      field "status", :status, :string
      # Zorunlu. Değerler: "provider_rejected", "user_opt_out", "api", "uninstall".
      field "unsubscribe_reason", :unsubscribe_reason, :string
      # Zorunlu.
      field "device", :device, "SubscriptionDevice"
      # Zorunlu.
      field "test_device", :test_device, :boolean
      # Zorunlu.
      field "test_device_name", :test_device_name, :string
      # Zorunlu.
      field "last_active_at", :last_active_at, :string
      # Zorunlu.
      field "last_sent_at", :last_sent_at, :string
      # Zorunlu.
      field "last_delivered_at", :last_delivered_at, :string
      # Zorunlu.
      field "opted_in_at", :opted_in_at, :string
      # Zorunlu.
      field "opt_in_source", :opt_in_source, :string
      # Zorunlu.
      field "unsubscribed_at", :unsubscribed_at, :string
      # Zorunlu.
      field "location", :location, "SubscriptionLocation"
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SubscriptionDevice şeması.
    class SubscriptionDevice < Pushizo::BaseModel
      field "model", :model, :string
      field "os", :os, :string
      field "os_version", :os_version, :string
      field "app_version", :app_version, :string
      field "sdk_version", :sdk_version, :string
      field "sdk_platform", :sdk_platform, :string
      field "carrier", :carrier, :string
      field "locale", :locale, :string
      field "timezone", :timezone, :string
      field "push_capable", :push_capable, :boolean
      # Değerler: "sandbox", "production".
      field "push_environment", :push_environment, :string
    end

    # SubscriptionLocation şeması.
    class SubscriptionLocation < Pushizo::BaseModel
      # Zorunlu.
      field "lat", :lat, :number
      # Zorunlu.
      field "lng", :lng, :number
      # Zorunlu.
      field "accuracy_m", :accuracy_m, :number
      # Zorunlu.
      field "geohash", :geohash, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "consent_at", :consent_at, :string
    end

    # SubscriptionsReport şeması.
    class SubscriptionsReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "totals", :totals, "SubscriptionsReportTotals"
      # Zorunlu.
      field "previous", :previous, "SubscriptionsReportPrevious"
      # Zorunlu.
      field "rows", :rows, [:array, "SubscriptionsReportRowsItem"]
      # Zorunlu.
      field "by_channel", :by_channel, [:array, "SubscriptionsReportByChannelItem"]
    end

    # SubscriptionsReportByChannelItem şeması.
    class SubscriptionsReportByChannelItem < Pushizo::BaseModel
      # Zorunlu.
      field "channel", :channel, :string
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "new", :new, :integer
      # Zorunlu.
      field "unsubscribed", :unsubscribed, :integer
    end

    # SubscriptionsReportPrevious şeması.
    class SubscriptionsReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "new", :new, :integer
      # Zorunlu.
      field "unsubscribed", :unsubscribed, :integer
      # Zorunlu.
      field "opt_outs", :opt_outs, :integer
      # Zorunlu.
      field "net", :net, :integer
    end

    # SubscriptionsReportRowsItem şeması.
    class SubscriptionsReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "new", :new, :integer
      # Zorunlu.
      field "unsubscribed", :unsubscribed, :integer
      # Zorunlu.
      field "opt_outs", :opt_outs, :integer
      # Zorunlu.
      field "net", :net, :integer
    end

    # SubscriptionsReportTotals şeması.
    class SubscriptionsReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "new", :new, :integer
      # Zorunlu.
      field "unsubscribed", :unsubscribed, :integer
      # Zorunlu.
      field "opt_outs", :opt_outs, :integer
      # Zorunlu.
      field "net", :net, :integer
    end

    # Suppression şeması.
    class Suppression < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "value_masked", :value_masked, :string
      # Zorunlu. Değerler: "bounce", "complaint", "manual", "unsubscribe_link", "stop".
      field "reason", :reason, :string
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "detail", :detail, [:map, :any]
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SuppressionPage şeması.
    class SuppressionPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Suppression"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # Template şeması.
    class Template < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      # Zorunlu.
      field "current_version", :current_version, :integer
      # Zorunlu.
      field "tags", :tags, [:array, :string]
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # TemplatePage şeması.
    class TemplatePage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Template"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # TemplateStats şeması.
    class TemplateStats < Pushizo::BaseModel
      # Zorunlu.
      field "template_id", :template_id, :string
      # Zorunlu.
      field "messages", :messages, :integer
      # Zorunlu.
      field "campaigns", :campaigns, :integer
      # Zorunlu.
      field "targeted", :targeted, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
      # Zorunlu.
      field "last_used_at", :last_used_at, :string
    end

    # TemplateVersionList şeması.
    class TemplateVersionList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "TemplateVersionListDataItem"]
    end

    # TemplateVersionListDataItem şeması.
    class TemplateVersionListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "content", :content, [:map, :any]
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # TestDataFeedDto şeması.
    class TestDataFeedDto < Pushizo::BaseModel
      field "external_id", :external_id, :string
      field "user_id", :user_id, :string
    end

    # TriggerRunDto şeması.
    class TriggerRunDto < Pushizo::BaseModel
      field "external_id", :external_id, :string
      field "user_id", :user_id, :string
      field "alias", :alias_, "TriggerRunDtoAlias"
      field "context", :context, [:map, :any]
    end

    # TriggerRunDtoAlias şeması.
    class TriggerRunDtoAlias < Pushizo::BaseModel
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UpdateApiKeyDto şeması.
    class UpdateApiKeyDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read", "mcp:write".
      field "scopes", :scopes, [:array, :string]
      field "ip_allowlist", :ip_allowlist, [:array, :string]
      field "expires_at", :expires_at, :string
    end

    # UpdateAppDto şeması.
    class UpdateAppDto < Pushizo::BaseModel
      field "name", :name, :string
      field "platform_flags", :platform_flags, "UpdateAppDtoPlatformFlags"
      field "icon_url", :icon_url, :string
      field "default_language", :default_language, :string
      field "timezone", :timezone, :string
      field "settings", :settings, "UpdateAppDtoSettings"
      # Değerler: "hmac", "jwt", "both".
      field "identity_verification_mode", :identity_verification_mode, :string
    end

    # UpdateAppDtoPlatformFlags şeması.
    class UpdateAppDtoPlatformFlags < Pushizo::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # UpdateAppDtoSettings şeması.
    class UpdateAppDtoSettings < Pushizo::BaseModel
      field "quietHours", :quiet_hours, "UpdateAppDtoSettingsQuietHours"
      field "frequencyCap", :frequency_cap, "UpdateAppDtoSettingsFrequencyCap"
      field "frequencyCaps", :frequency_caps, [:array, "UpdateAppDtoSettingsFrequencyCapsItem"]
      field "inApp", :in_app, "UpdateAppDtoSettingsInApp"
      field "androidChannels", :android_channels, [:array, "UpdateAppDtoSettingsAndroidChannelsItem"]
      field "sms", :sms, "UpdateAppDtoSettingsSms"
      field "preferenceCenter", :preference_center, "UpdateAppDtoSettingsPreferenceCenter"
      field "defaultTtlSeconds", :default_ttl_seconds, :integer
      field "identityVerificationRequired", :identity_verification_required, :boolean
      field "allowedOrigins", :allowed_origins, [:array, :string]
      field "campaignApprovalRequired", :campaign_approval_required, :boolean
      field "webPush", :web_push, "UpdateAppDtoSettingsWebPush"
      field "onboarding", :onboarding, "UpdateAppDtoSettingsOnboarding"
      field "sdkSetup", :sdk_setup, "UpdateAppDtoSettingsSdkSetup"
    end

    # UpdateAppDtoSettingsAndroidChannelsItem şeması.
    class UpdateAppDtoSettingsAndroidChannelsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu. Değerler: "low", "default", "high", "urgent".
      field "importance", :importance, :string
      field "sound", :sound, :string
      field "vibration", :vibration, :boolean
      field "group", :group, :string
    end

    # UpdateAppDtoSettingsFrequencyCap şeması.
    class UpdateAppDtoSettingsFrequencyCap < Pushizo::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "windowHours", :window_hours, :integer
    end

    # UpdateAppDtoSettingsFrequencyCapsItem şeması.
    class UpdateAppDtoSettingsFrequencyCapsItem < Pushizo::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "window", :window, "UpdateAppDtoSettingsFrequencyCapsItemWindow"
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
    end

    # UpdateAppDtoSettingsFrequencyCapsItemWindow şeması.
    class UpdateAppDtoSettingsFrequencyCapsItemWindow < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :integer
      # Zorunlu. Değerler: "minutes", "hours", "days", "weeks".
      field "unit", :unit, :string
    end

    # UpdateAppDtoSettingsInApp şeması.
    class UpdateAppDtoSettingsInApp < Pushizo::BaseModel
      field "minIntervalSeconds", :min_interval_seconds, :integer
    end

    # UpdateAppDtoSettingsOnboarding şeması.
    class UpdateAppDtoSettingsOnboarding < Pushizo::BaseModel
      # Zorunlu.
      field "step", :step, :integer
      field "simulation", :simulation, :boolean
      field "completed_at", :completed_at, :string
      field "version", :version, :integer
      # Değerler: "ios", "android", "huawei", "web".
      field "platforms", :platforms, [:array, :string]
      # Değerler: "native", "flutter", "react-native", "unity", "capacitor", "cordova", "maui".
      field "framework", :framework, :string
      # Değerler: "code", "wordpress".
      field "web_integration", :web_integration, :string
    end

    # UpdateAppDtoSettingsPreferenceCenter şeması.
    class UpdateAppDtoSettingsPreferenceCenter < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "brandName", :brand_name, :string
      field "logoUrl", :logo_url, :string
      field "accentColor", :accent_color, :string
      field "customUnsubscribeUrl", :custom_unsubscribe_url, :string
      field "texts", :texts, [:map, "UpdateAppDtoSettingsPreferenceCenterTextsValue"]
    end

    # UpdateAppDtoSettingsPreferenceCenterTextsValue şeması.
    class UpdateAppDtoSettingsPreferenceCenterTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "unsubscribeAll", :unsubscribe_all, :string
      field "saved", :saved, :string
    end

    # UpdateAppDtoSettingsQuietHours şeması.
    class UpdateAppDtoSettingsQuietHours < Pushizo::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
      # Zorunlu. Değerler: "user", "app".
      field "timezoneMode", :timezone_mode, :string
    end

    # UpdateAppDtoSettingsSdkSetup şeması.
    class UpdateAppDtoSettingsSdkSetup < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "platform", :platform, :string
      # Zorunlu.
      field "step", :step, :string
      # Zorunlu.
      field "furthest", :furthest, :string
      field "variant", :variant, :string
      field "detectedSubscriptionId", :detected_subscription_id, :string
      field "testMessageId", :test_message_id, :string
      field "completedAt", :completed_at, :string
    end

    # UpdateAppDtoSettingsSms şeması.
    class UpdateAppDtoSettingsSms < Pushizo::BaseModel
      field "helpReply", :help_reply, :string
      field "stopReply", :stop_reply, :string
      field "autoReply", :auto_reply, :boolean
    end

    # UpdateAppDtoSettingsWebPush şeması.
    class UpdateAppDtoSettingsWebPush < Pushizo::BaseModel
      field "serviceWorkerPath", :service_worker_path, :string
      field "serviceWorkerScope", :service_worker_scope, :string
      field "prompt", :prompt, "UpdateAppDtoSettingsWebPushPrompt"
      field "welcomeNotification", :welcome_notification, "UpdateAppDtoSettingsWebPushWelcomeNotification"
      field "clickBehavior", :click_behavior, "UpdateAppDtoSettingsWebPushClickBehavior"
      field "customLink", :custom_link, "UpdateAppDtoSettingsWebPushCustomLink"
      field "promptBackoffDays", :prompt_backoff_days, [:array, :integer]
    end

    # UpdateAppDtoSettingsWebPushClickBehavior şeması.
    class UpdateAppDtoSettingsWebPushClickBehavior < Pushizo::BaseModel
      # Zorunlu. Değerler: "exact", "origin".
      field "match", :match, :string
      # Zorunlu. Değerler: "navigate", "focus".
      field "action", :action, :string
    end

    # UpdateAppDtoSettingsWebPushCustomLink şeması.
    class UpdateAppDtoSettingsWebPushCustomLink < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "button", "link".
      field "style", :style, :string
      # Zorunlu. Değerler: "small", "medium", "large".
      field "size", :size, :string
      field "color", :color, "UpdateAppDtoSettingsWebPushCustomLinkColor"
      field "texts", :texts, [:map, "UpdateAppDtoSettingsWebPushCustomLinkTextsValue"]
      field "unsubscribeEnabled", :unsubscribe_enabled, :boolean
    end

    # UpdateAppDtoSettingsWebPushCustomLinkColor şeması.
    class UpdateAppDtoSettingsWebPushCustomLinkColor < Pushizo::BaseModel
      field "button", :button, :string
      field "text", :text, :string
    end

    # UpdateAppDtoSettingsWebPushCustomLinkTextsValue şeması.
    class UpdateAppDtoSettingsWebPushCustomLinkTextsValue < Pushizo::BaseModel
      field "subscribe", :subscribe, :string
      field "unsubscribe", :unsubscribe, :string
      field "explanation", :explanation, :string
    end

    # UpdateAppDtoSettingsWebPushPrompt şeması.
    class UpdateAppDtoSettingsWebPushPrompt < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "slidedown", "native".
      field "type", :type, :string
      # Değerler: "push", "email", "sms", "email_sms".
      field "collect", :collect, :string
      field "delaySeconds", :delay_seconds, :integer
      field "pageViews", :page_views, :integer
      field "scrollPercent", :scroll_percent, :integer
      field "texts", :texts, [:map, "UpdateAppDtoSettingsWebPushPromptTextsValue"]
      field "categories", :categories, [:array, "UpdateAppDtoSettingsWebPushPromptCategoriesItem"]
      field "accentColor", :accent_color, :string
    end

    # UpdateAppDtoSettingsWebPushPromptCategoriesItem şeması.
    class UpdateAppDtoSettingsWebPushPromptCategoriesItem < Pushizo::BaseModel
      # Zorunlu.
      field "tag", :tag, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # UpdateAppDtoSettingsWebPushPromptTextsValue şeması.
    class UpdateAppDtoSettingsWebPushPromptTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "message", :message, :string
      field "accept", :accept, :string
      field "cancel", :cancel, :string
    end

    # UpdateAppDtoSettingsWebPushWelcomeNotification şeması.
    class UpdateAppDtoSettingsWebPushWelcomeNotification < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "url", :url, :string
      field "texts", :texts, [:map, "UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue"]
    end

    # UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue şeması.
    class UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue < Pushizo::BaseModel
      field "title", :title, :string
      field "message", :message, :string
    end

    # UpdateCategoryDto şeması.
    class UpdateCategoryDto < Pushizo::BaseModel
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # UpdateContentTableDto şeması.
    class UpdateContentTableDto < Pushizo::BaseModel
      field "description", :description, :string
    end

    # UpdateDataFeedDto şeması.
    class UpdateDataFeedDto < Pushizo::BaseModel
      field "description", :description, :string
      field "url_template", :url_template, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "body_template", :body_template, :string
      field "headers", :headers, [:map, :string]
      field "secret_headers", :secret_headers, [:map, :string]
      field "cache_ttl_seconds", :cache_ttl_seconds, :integer
      field "timeout_ms", :timeout_ms, :integer
      field "enabled", :enabled, :boolean
    end

    # UpdateInAppDto şeması.
    class UpdateInAppDto < Pushizo::BaseModel
      field "name", :name, :string
      field "triggers", :triggers, [:array, :any]
      field "trigger_groups", :trigger_groups, [:array, [:array, :any]]
      field "variants", :variants, [:array, "UpdateInAppDtoVariantsItem"]
      field "ab_test", :ab_test, "UpdateInAppDtoAbTest"
      field "display", :display_value, "UpdateInAppDtoDisplay"
      field "audience", :audience, "UpdateInAppDtoAudience"
      field "frequency", :frequency, "UpdateInAppDtoFrequency"
      field "journey_only", :journey_only, :boolean
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # UpdateInAppDtoAbTest şeması.
    class UpdateInAppDtoAbTest < Pushizo::BaseModel
      field "winner", :winner, "UpdateInAppDtoAbTestWinner"
    end

    # UpdateInAppDtoAbTestWinner şeması.
    class UpdateInAppDtoAbTestWinner < Pushizo::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # UpdateInAppDtoAudience şeması.
    class UpdateInAppDtoAudience < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # UpdateInAppDtoDisplay şeması.
    class UpdateInAppDtoDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # UpdateInAppDtoFrequency şeması.
    class UpdateInAppDtoFrequency < Pushizo::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # UpdateInAppDtoVariantsItem şeması.
    class UpdateInAppDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "UpdateInAppDtoVariantsItemDisplay"
    end

    # UpdateInAppDtoVariantsItemDisplay şeması.
    class UpdateInAppDtoVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Değerler: "blocks", "html".
      field "content_type", :content_type, :string
      field "html", :html, [:map, :string]
      field "html_height", :html_height, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # UpdateJourneyDto şeması.
    class UpdateJourneyDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
    end

    # UpdateKeywordDto şeması.
    class UpdateKeywordDto < Pushizo::BaseModel
      field "keyword", :keyword, :string
      # Değerler: "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      field "actions", :actions, "UpdateKeywordDtoActions"
      field "enabled", :enabled, :boolean
      field "description", :description, :string
    end

    # UpdateKeywordDtoActions şeması.
    class UpdateKeywordDtoActions < Pushizo::BaseModel
      field "add_tags", :add_tags, [:map, :string]
      field "remove_tags", :remove_tags, [:array, :string]
      field "event", :event, "UpdateKeywordDtoActionsEvent"
      field "reply", :reply, "UpdateKeywordDtoActionsReply"
      field "opt_in", :opt_in, :boolean
    end

    # UpdateKeywordDtoActionsEvent şeması.
    class UpdateKeywordDtoActionsEvent < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "properties", :properties, [:map, :string]
    end

    # UpdateKeywordDtoActionsReply şeması.
    class UpdateKeywordDtoActionsReply < Pushizo::BaseModel
      # Zorunlu.
      field "text", :text, :string
    end

    # UpdateLiveActivityDto şeması.
    class UpdateLiveActivityDto < Pushizo::BaseModel
      # Zorunlu.
      field "activity_id", :activity_id, :string
      # Zorunlu.
      field "content_state", :content_state, [:map, :any]
      field "alert", :alert, "UpdateLiveActivityDtoAlert"
      field "stale_date", :stale_date, :integer
      field "dismissal_date", :dismissal_date, :integer
      field "relevance_score", :relevance_score, :number
      # Değerler: 5, 10.
      field "priority", :priority, :integer
      field "name", :name, :string
    end

    # UpdateLiveActivityDtoAlert şeması.
    class UpdateLiveActivityDtoAlert < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "body", :body, [:map, :string]
      field "sound", :sound, :string
    end

    # UpdateLiveActivityTypeDto şeması.
    class UpdateLiveActivityTypeDto < Pushizo::BaseModel
      field "description", :description, :string
      field "content_state_schema", :content_state_schema, "UpdateLiveActivityTypeDtoContentStateSchema"
      field "attributes_schema", :attributes_schema, "UpdateLiveActivityTypeDtoAttributesSchema"
    end

    # UpdateLiveActivityTypeDtoAttributesSchema şeması.
    class UpdateLiveActivityTypeDtoAttributesSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "UpdateLiveActivityTypeDtoAttributesSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # UpdateLiveActivityTypeDtoAttributesSchemaPropertiesValue şeması.
    class UpdateLiveActivityTypeDtoAttributesSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # UpdateLiveActivityTypeDtoContentStateSchema şeması.
    class UpdateLiveActivityTypeDtoContentStateSchema < Pushizo::BaseModel
      # Zorunlu. Değerler: "object".
      field "type", :type, :string
      # Zorunlu.
      field "properties", :properties, [:map, "UpdateLiveActivityTypeDtoContentStateSchemaPropertiesValue"]
      field "required", :required, [:array, :string]
    end

    # UpdateLiveActivityTypeDtoContentStateSchemaPropertiesValue şeması.
    class UpdateLiveActivityTypeDtoContentStateSchemaPropertiesValue < Pushizo::BaseModel
      # Zorunlu. Değerler: "string", "number", "integer", "boolean".
      field "type", :type, :string
      field "enum", :enum, [:array, :any]
      field "maxLength", :max_length, :integer
      field "minimum", :minimum, :number
      field "maximum", :maximum, :number
      field "description", :description, :string
    end

    # UpdateNodeDto şeması.
    class UpdateNodeDto < Pushizo::BaseModel
      field "data", :data, [:map, :any]
      field "position", :position, "UpdateNodeDtoPosition"
    end

    # UpdateNodeDtoPosition şeması.
    class UpdateNodeDtoPosition < Pushizo::BaseModel
      # Zorunlu.
      field "x", :x, :number
      # Zorunlu.
      field "y", :y, :number
    end

    # UpdateTemplateDto şeması.
    class UpdateTemplateDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channel", :channel, :string
      field "tags", :tags, [:array, :string]
      field "content", :content, "UpdateTemplateDtoContent"
    end

    # UpdateTemplateDtoContent şeması.
    class UpdateTemplateDtoContent < Pushizo::BaseModel
      field "headings", :headings, [:map, :string]
      field "contents", :contents, [:map, :string]
      field "subtitle", :subtitle, [:map, :string]
      field "url", :url, :string
      field "app_url", :app_url, :string
      field "data", :data, [:map, :string]
      field "buttons", :buttons, [:array, "UpdateTemplateDtoContentButtonsItem"]
      field "big_picture", :big_picture, :string
      field "ios_attachments", :ios_attachments, [:map, :string]
      field "ios_sound", :ios_sound, :string
      # Değerler: "None", "SetTo", "Increase".
      field "ios_badge_type", :ios_badge_type, :string
      field "ios_badge_count", :ios_badge_count, :integer
      # Değerler: "passive", "active", "time-sensitive", "critical".
      field "ios_interruption_level", :ios_interruption_level, :string
      field "ios_category", :ios_category, :string
      field "android_channel_id", :android_channel_id, :string
      field "android_group", :android_group, :string
      field "android_sound", :android_sound, :string
      field "chrome_web_icon", :chrome_web_icon, :string
      field "chrome_web_image", :chrome_web_image, :string
      field "chrome_web_badge", :chrome_web_badge, :string
      field "web_push_topic", :web_push_topic, :string
      field "content_available", :content_available, :boolean
      field "mutable_content", :mutable_content, :boolean
      field "custom_data", :custom_data, [:map, :any]
      field "email_subject", :email_subject, :string
      field "email_body", :email_body, :string
      field "email_mjml", :email_mjml, :string
      field "email_preheader", :email_preheader, :string
      field "email_from_name", :email_from_name, :string
      field "email_from_address", :email_from_address, :string
      field "email_reply_to_address", :email_reply_to_address, :string
      field "disable_email_click_tracking", :disable_email_click_tracking, :boolean
      field "sms_from", :sms_from, :string
      field "disable_sms_link_shortening", :disable_sms_link_shortening, :boolean
      field "add_to_inbox", :add_to_inbox, :boolean
      field "inbox_ttl", :inbox_ttl, :integer
      field "thread_id", :thread_id, :string
      field "ios_relevance_score", :ios_relevance_score, :number
      field "target_content_identifier", :target_content_identifier, :string
      field "small_icon", :small_icon, :string
      field "large_icon", :large_icon, :string
      field "android_accent_color", :android_accent_color, :string
      # Değerler: 1, 0, -1.
      field "android_visibility", :android_visibility, :integer
      field "web_buttons", :web_buttons, [:array, "UpdateTemplateDtoContentWebButtonsItem"]
      field "require_interaction", :require_interaction, :boolean
      field "sms_media_urls", :sms_media_urls, [:array, :string]
      field "whatsapp_template", :whatsapp_template, "UpdateTemplateDtoContentWhatsappTemplate"
      field "whatsapp_media", :whatsapp_media, "UpdateTemplateDtoContentWhatsappMedia"
      field "whatsapp_interactive", :whatsapp_interactive, "UpdateTemplateDtoContentWhatsappInteractive"
      field "rcs_card", :rcs_card, "UpdateTemplateDtoContentRcsCard"
      field "rcs_suggestions", :rcs_suggestions, [:array, :any]
      field "rcs_content_sid", :rcs_content_sid, :string
      field "rcs_content_variables", :rcs_content_variables, [:map, :string]
      field "rcs_fallback_text", :rcs_fallback_text, [:map, :string]
    end

    # UpdateTemplateDtoContentButtonsItem şeması.
    class UpdateTemplateDtoContentButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # UpdateTemplateDtoContentRcsCard şeması.
    class UpdateTemplateDtoContentRcsCard < Pushizo::BaseModel
      field "title", :title, [:map, :string]
      field "description", :description, [:map, :string]
      field "media_url", :media_url, :string
      # Değerler: "SHORT", "MEDIUM", "TALL".
      field "media_height", :media_height, :string
      # Değerler: "VERTICAL", "HORIZONTAL".
      field "orientation", :orientation, :string
    end

    # UpdateTemplateDtoContentWebButtonsItem şeması.
    class UpdateTemplateDtoContentWebButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # UpdateTemplateDtoContentWhatsappInteractive şeması.
    class UpdateTemplateDtoContentWhatsappInteractive < Pushizo::BaseModel
      # Zorunlu. Değerler: "button", "list".
      field "type", :type, :string
      field "header", :header, :string
      field "footer", :footer, :string
      field "buttons", :buttons, [:array, "UpdateTemplateDtoContentWhatsappInteractiveButtonsItem"]
      field "list", :list, "UpdateTemplateDtoContentWhatsappInteractiveList"
    end

    # UpdateTemplateDtoContentWhatsappInteractiveButtonsItem şeması.
    class UpdateTemplateDtoContentWhatsappInteractiveButtonsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
    end

    # UpdateTemplateDtoContentWhatsappInteractiveList şeması.
    class UpdateTemplateDtoContentWhatsappInteractiveList < Pushizo::BaseModel
      # Zorunlu.
      field "button", :button, :string
      # Zorunlu.
      field "sections", :sections, [:array, "UpdateTemplateDtoContentWhatsappInteractiveListSectionsItem"]
    end

    # UpdateTemplateDtoContentWhatsappInteractiveListSectionsItem şeması.
    class UpdateTemplateDtoContentWhatsappInteractiveListSectionsItem < Pushizo::BaseModel
      field "title", :title, :string
      # Zorunlu.
      field "rows", :rows, [:array, "UpdateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem"]
    end

    # UpdateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem şeması.
    class UpdateTemplateDtoContentWhatsappInteractiveListSectionsItemRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
    end

    # UpdateTemplateDtoContentWhatsappMedia şeması.
    class UpdateTemplateDtoContentWhatsappMedia < Pushizo::BaseModel
      # Zorunlu. Değerler: "image", "video", "document", "audio".
      field "type", :type, :string
      # Zorunlu.
      field "url", :url, :string
      field "filename", :filename, :string
    end

    # UpdateTemplateDtoContentWhatsappTemplate şeması.
    class UpdateTemplateDtoContentWhatsappTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      field "header", :header, :any
      field "body_params", :body_params, [:array, :string]
      field "button_params", :button_params, [:array, "UpdateTemplateDtoContentWhatsappTemplateButtonParamsItem"]
    end

    # UpdateTemplateDtoContentWhatsappTemplateButtonParamsItem şeması.
    class UpdateTemplateDtoContentWhatsappTemplateButtonParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu. Değerler: "url", "quick_reply", "copy_code".
      field "sub_type", :sub_type, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UpdateWarehouseExportDto şeması.
    class UpdateWarehouseExportDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "deliveries", "delivery_events", "events", "conversions", "users", "subscriptions".
      field "tables", :tables, [:array, :string]
      # Değerler: "hourly", "daily".
      field "schedule", :schedule, :string
      field "enabled", :enabled, :boolean
      field "config", :config, [:map, :any]
      field "credentials", :credentials, [:map, :any]
    end

    # UpdateWarmupPlanDto şeması.
    class UpdateWarmupPlanDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "active", "paused".
      field "status", :status, :string
      field "daily_limits", :daily_limits, [:array, :integer]
      field "provider_shares", :provider_shares, "UpdateWarmupPlanDtoProviderShares"
    end

    # UpdateWarmupPlanDtoProviderShares şeması.
    class UpdateWarmupPlanDtoProviderShares < Pushizo::BaseModel
      # Zorunlu.
      field "gmail", :gmail, :number
      # Zorunlu.
      field "outlook", :outlook, :number
      # Zorunlu.
      field "yahoo", :yahoo, :number
      # Zorunlu.
      field "other", :other, :number
    end

    # UpdateWebhookDto şeması.
    class UpdateWebhookDto < Pushizo::BaseModel
      field "url", :url, :string
      field "description", :description, :string
      # Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "audit.created".
      field "events", :events, [:array, :string]
      field "event_filters", :event_filters, "UpdateWebhookDtoEventFilters"
      field "batch", :batch, :boolean
      field "headers", :headers, [:map, :string]
      # Değerler: "active", "disabled".
      field "status", :status, :string
      field "body_template", :body_template, :string
      # Şablon çıktısının içerik türü (varsayılan application/json). Değerler: "application/json", "text/plain".
      field "body_content_type", :body_content_type, :string
      field "filters", :filters, "UpdateWebhookDtoFilters"
    end

    # UpdateWebhookDtoEventFilters şeması.
    class UpdateWebhookDtoEventFilters < Pushizo::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # Olay filtresi: { match: all|any, conditions: [{ field, op, value? }] }.
    class UpdateWebhookDtoFilters < Pushizo::BaseModel
      # Zorunlu. Değerler: "all", "any".
      field "match", :match, :string
      # Zorunlu.
      field "conditions", :conditions, [:array, "UpdateWebhookDtoFiltersConditionsItem"]
    end

    # UpdateWebhookDtoFiltersConditionsItem şeması.
    class UpdateWebhookDtoFiltersConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu. Değerler: "eq", "neq", "in", "not_in", "starts_with", "contains", "exists", "not_exists".
      field "op", :op, :string
      field "value", :value, :any
    end

    # UpsertUserDto şeması.
    class UpsertUserDto < Pushizo::BaseModel
      field "identity", :identity, :any
      field "external_id", :external_id, :string
      field "properties", :properties, [:map, :any]
      field "tags", :tags, [:map, :string]
      field "subscriptions", :subscriptions, [:array, "AddSubscriptionDto"]
    end

    # UsageReport şeması.
    class UsageReport < Pushizo::BaseModel
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "plan_code", :plan_code, :string
      # Zorunlu.
      field "period", :period, "UsageReportPeriod"
      # Zorunlu.
      field "metrics", :metrics, [:array, "UsageReportMetricsItem"]
      # Zorunlu.
      field "apps", :apps, [:array, "UsageReportAppsItem"]
      # Zorunlu.
      field "daily", :daily, [:array, "UsageReportDailyItem"]
      # Zorunlu.
      field "trialing", :trialing, :boolean
      # Zorunlu.
      field "trial_ends_at", :trial_ends_at, :string
    end

    # UsageReportAppsItem şeması.
    class UsageReportAppsItem < Pushizo::BaseModel
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "messages_sent", :messages_sent, :number
      # Zorunlu.
      field "active_subscriptions", :active_subscriptions, :number
      # Zorunlu.
      field "mau", :mau, :number
    end

    # UsageReportDailyItem şeması.
    class UsageReportDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "messages_sent", :messages_sent, :number
      # Zorunlu.
      field "api_requests", :api_requests, :number
      # Zorunlu.
      field "events_ingested", :events_ingested, :number
    end

    # UsageReportMetricsItem şeması.
    class UsageReportMetricsItem < Pushizo::BaseModel
      # Zorunlu.
      field "metric", :metric, :string
      # Zorunlu.
      field "used", :used, :number
      # Zorunlu.
      field "limit", :limit, :number
      # Zorunlu.
      field "percent", :percent, :number
      # Zorunlu.
      field "hard", :hard, :boolean
    end

    # UsageReportPeriod şeması.
    class UsageReportPeriod < Pushizo::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
    end

    # User şeması.
    class User < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "properties", :properties, [:map, :any]
      # Zorunlu.
      field "tags", :tags, [:map, :string]
      # Zorunlu.
      field "first_seen_at", :first_seen_at, :string
      # Zorunlu.
      field "last_active_at", :last_active_at, :string
      # Zorunlu.
      field "session_count", :session_count, :integer
      # Zorunlu.
      field "usage_seconds", :usage_seconds, :integer
      # Zorunlu.
      field "merged_into", :merged_into, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "subscription_count", :subscription_count, :integer
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
    end

    # UserDetail şeması.
    class UserDetail < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "properties", :properties, [:map, :any]
      # Zorunlu.
      field "tags", :tags, [:map, :string]
      # Zorunlu.
      field "first_seen_at", :first_seen_at, :string
      # Zorunlu.
      field "last_active_at", :last_active_at, :string
      # Zorunlu.
      field "session_count", :session_count, :integer
      # Zorunlu.
      field "usage_seconds", :usage_seconds, :integer
      # Zorunlu.
      field "merged_into", :merged_into, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "subscription_count", :subscription_count, :integer
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "web_push", "email", "sms", "whatsapp", "rcs".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "aliases", :aliases, [:array, "UserDetailAliasesItem"]
      # Zorunlu.
      field "subscriptions", :subscriptions, [:array, "Subscription"]
    end

    # UserDetailAliasesItem şeması.
    class UserDetailAliasesItem < Pushizo::BaseModel
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UserExport şeması.
    class UserExport < Pushizo::BaseModel
      # Zorunlu.
      field "exported_at", :exported_at, :string
      # Zorunlu.
      field "user", :user, "UserDetail"
      # Zorunlu.
      field "events", :events, [:array, "UserExportEventsItem"]
    end

    # UserExportEventsItem şeması.
    class UserExportEventsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "subscription_id", :subscription_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "properties", :properties, [:map, :any]
      # Zorunlu.
      field "value", :value, :number
      # Zorunlu. Değerler: "sdk", "api", "system", "import".
      field "source", :source, :string
      # Zorunlu.
      field "occurred_at", :occurred_at, :string
    end

    # UserIdentity şeması.
    class UserIdentity < Pushizo::BaseModel
      # Zorunlu.
      field "identity", :identity, [:map, :string]
    end

    # UserJourneyRuns şeması.
    class UserJourneyRuns < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "UserJourneyRunsDataItem"]
    end

    # UserJourneyRunsDataItem şeması.
    class UserJourneyRunsDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "journey_id", :journey_id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "active", "waiting", "completed", "exited", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "current_node_id", :current_node_id, :string
      # Zorunlu.
      field "next_action_at", :next_action_at, :string
      # Zorunlu.
      field "entered_at", :entered_at, :string
      # Zorunlu.
      field "completed_at", :completed_at, :string
      # Zorunlu.
      field "exit_reason", :exit_reason, :string
      # Zorunlu.
      field "goal_id", :goal_id, :string
      # Zorunlu.
      field "goal_reached_at", :goal_reached_at, :string
      # Zorunlu.
      field "context", :context, [:map, :any]
      # Zorunlu.
      field "journey_name", :journey_name, :string
    end

    # UserList şeması.
    class UserList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "User"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # UserPreferences şeması.
    class UserPreferences < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "data", :data, [:array, "UserPreferencesDataItem"]
      # Zorunlu.
      field "categories", :categories, [:array, "MessageCategory"]
    end

    # UserPreferencesDataItem şeması.
    class UserPreferencesDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "channel", :channel, :string
      # Zorunlu.
      field "opted_in", :opted_in, :boolean
      # Zorunlu.
      field "explicit", :explicit, :boolean
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # UsersSearchBody şeması.
    class UsersSearchBody < Pushizo::BaseModel
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "UsersSearchBodyDefinition"
      field "limit", :limit, :integer
      field "cursor", :cursor, :string
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class UsersSearchBodyDefinition < Pushizo::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # VerifyAddressDto şeması.
    class VerifyAddressDto < Pushizo::BaseModel
      # Zorunlu.
      field "address", :address, :string
    end

    # WarehouseConnectionResult şeması.
    class WarehouseConnectionResult < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "detail", :detail, :string
      # Zorunlu.
      field "error", :error, "WarehouseConnectionResultError"
    end

    # WarehouseConnectionResultError şeması.
    class WarehouseConnectionResultError < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # WarehouseExport şeması.
    class WarehouseExport < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "bigquery", "snowflake", "s3_parquet".
      field "destination", :destination, :string
      # Zorunlu.
      field "config", :config, [:map, :any]
      # Zorunlu.
      field "credentials_hint", :credentials_hint, :string
      # Zorunlu. Değerler: "deliveries", "delivery_events", "events", "conversions", "users", "subscriptions".
      field "tables", :tables, [:array, :string]
      # Zorunlu. Değerler: "hourly", "daily".
      field "schedule", :schedule, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "active", "paused", "failing".
      field "status", :status, :string
      # Zorunlu.
      field "consecutive_failures", :consecutive_failures, :integer
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "cursors", :cursors, [:map, "WarehouseExportCursorsValue"]
      # Zorunlu.
      field "schema_versions", :schema_versions, [:map, :integer]
      # Zorunlu.
      field "last_run_at", :last_run_at, :string
      # Zorunlu.
      field "last_success_at", :last_success_at, :string
      # Zorunlu.
      field "next_run_at", :next_run_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WarehouseExportCursorsValue şeması.
    class WarehouseExportCursorsValue < Pushizo::BaseModel
      # Zorunlu.
      field "ts", :ts, :string
      # Zorunlu.
      field "id", :id, :string
    end

    # WarehouseExportList şeması.
    class WarehouseExportList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WarehouseExport"]
    end

    # WarehouseExportRun şeması.
    class WarehouseExportRun < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "export_id", :export_id, :string
      # Zorunlu. Değerler: "schedule", "manual".
      field "trigger", :trigger, :string
      # Zorunlu. Değerler: "queued", "running", "succeeded", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "tables", :tables, [:map, "WarehouseExportRunTablesValue"]
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "attempt", :attempt, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "finished_at", :finished_at, :string
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # WarehouseExportRunPage şeması.
    class WarehouseExportRunPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WarehouseExportRun"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WarehouseExportRunTablesValue şeması.
    class WarehouseExportRunTablesValue < Pushizo::BaseModel
      # Zorunlu.
      field "rows", :rows, :integer
      # Zorunlu.
      field "schema_version", :schema_version, :integer
      # Zorunlu.
      field "from", :from, "WarehouseExportRunTablesValueFrom"
      # Zorunlu.
      field "to", :to, "WarehouseExportRunTablesValueTo"
      # Zorunlu.
      field "objects", :objects, :integer
    end

    # WarehouseExportRunTablesValueFrom şeması.
    class WarehouseExportRunTablesValueFrom < Pushizo::BaseModel
      # Zorunlu.
      field "ts", :ts, :string
      # Zorunlu.
      field "id", :id, :string
    end

    # WarehouseExportRunTablesValueTo şeması.
    class WarehouseExportRunTablesValueTo < Pushizo::BaseModel
      # Zorunlu.
      field "ts", :ts, :string
      # Zorunlu.
      field "id", :id, :string
    end

    # WarehouseTables şeması.
    class WarehouseTables < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WarehouseTablesDataItem"]
    end

    # WarehouseTablesDataItem şeması.
    class WarehouseTablesDataItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "deliveries", "delivery_events", "events", "conversions", "users", "subscriptions".
      field "name", :name, :string
      # Zorunlu. Değerler: "incremental", "snapshot".
      field "mode", :mode, :string
      # Zorunlu.
      field "schema_version", :schema_version, :integer
      # Zorunlu.
      field "cursor_column", :cursor_column, :string
      # Zorunlu.
      field "columns", :columns, [:array, "WarehouseTablesDataItemColumnsItem"]
    end

    # WarehouseTablesDataItemColumnsItem şeması.
    class WarehouseTablesDataItemColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "nullable", :nullable, :boolean
    end

    # Webhook şeması.
    class Webhook < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "events", :events, [:array, :string]
      # Zorunlu.
      field "event_filters", :event_filters, "WebhookEventFilters"
      # Zorunlu.
      field "batch", :batch, :boolean
      # Zorunlu. Değerler: "active", "failing", "disabled".
      field "status", :status, :string
      # Zorunlu.
      field "disabled_reason", :disabled_reason, :string
      # Zorunlu.
      field "failure_count", :failure_count, :integer
      # Zorunlu.
      field "failing_since", :failing_since, :string
      # Zorunlu.
      field "last_success_at", :last_success_at, :string
      # Zorunlu.
      field "last_failure_at", :last_failure_at, :string
      # Zorunlu.
      field "header_names", :header_names, [:array, :string]
      # Zorunlu.
      field "previous_secret_expires_at", :previous_secret_expires_at, :string
      # Zorunlu.
      field "body_template", :body_template, :string
      # Zorunlu. Değerler: "application/json", "text/plain".
      field "body_content_type", :body_content_type, :string
      # Zorunlu.
      field "filters", :filters, "WebhookFilters"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WebhookDeliveryDetail şeması.
    class WebhookDeliveryDetail < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "endpoint_id", :endpoint_id, :string
      # Zorunlu.
      field "event_type", :event_type, :string
      # Zorunlu.
      field "event_id", :event_id, :string
      # Zorunlu.
      field "subject_id", :subject_id, :string
      # Zorunlu.
      field "attempt", :attempt, :integer
      # Zorunlu. Değerler: "pending", "success", "failed", "dead".
      field "status", :status, :string
      # Zorunlu.
      field "response_status", :response_status, :integer
      # Zorunlu.
      field "response_body_excerpt", :response_body_excerpt, :string
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "next_retry_at", :next_retry_at, :string
      # Zorunlu.
      field "delivered_at", :delivered_at, :string
      # Zorunlu.
      field "replay_of", :replay_of, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "payload", :payload, [:map, :any]
    end

    # WebhookDeliveryPage şeması.
    class WebhookDeliveryPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WebhookDeliveryPageDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WebhookDeliveryPageDataItem şeması.
    class WebhookDeliveryPageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "endpoint_id", :endpoint_id, :string
      # Zorunlu.
      field "event_type", :event_type, :string
      # Zorunlu.
      field "event_id", :event_id, :string
      # Zorunlu.
      field "subject_id", :subject_id, :string
      # Zorunlu.
      field "attempt", :attempt, :integer
      # Zorunlu. Değerler: "pending", "success", "failed", "dead".
      field "status", :status, :string
      # Zorunlu.
      field "response_status", :response_status, :integer
      # Zorunlu.
      field "response_body_excerpt", :response_body_excerpt, :string
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "next_retry_at", :next_retry_at, :string
      # Zorunlu.
      field "delivered_at", :delivered_at, :string
      # Zorunlu.
      field "replay_of", :replay_of, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # WebhookEventFilters şeması.
    class WebhookEventFilters < Pushizo::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # WebhookFilters şeması.
    class WebhookFilters < Pushizo::BaseModel
      # Zorunlu. Değerler: "all", "any".
      field "match", :match, :string
      # Zorunlu.
      field "conditions", :conditions, [:array, "WebhookFiltersConditionsItem"]
    end

    # WebhookFiltersConditionsItem şeması.
    class WebhookFiltersConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu. Değerler: "eq", "neq", "in", "not_in", "starts_with", "contains", "exists", "not_exists".
      field "op", :op, :string
      field "value", :value, :any
    end

    # WebhookList şeması.
    class WebhookList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Webhook"]
    end

    # WebhookPreviewDto şeması.
    class WebhookPreviewDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "audit.created", "webhook.test".
      field "event_type", :event_type, :string
      field "data", :data, [:map, :any]
      field "body_template", :body_template, :string
      # Şablon çıktısının içerik türü (varsayılan application/json). Değerler: "application/json", "text/plain".
      field "body_content_type", :body_content_type, :string
      field "filters", :filters, "WebhookPreviewDtoFilters"
      field "batch", :batch, :boolean
    end

    # Olay filtresi: { match: all|any, conditions: [{ field, op, value? }] }.
    class WebhookPreviewDtoFilters < Pushizo::BaseModel
      # Zorunlu. Değerler: "all", "any".
      field "match", :match, :string
      # Zorunlu.
      field "conditions", :conditions, [:array, "WebhookPreviewDtoFiltersConditionsItem"]
    end

    # WebhookPreviewDtoFiltersConditionsItem şeması.
    class WebhookPreviewDtoFiltersConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu. Değerler: "eq", "neq", "in", "not_in", "starts_with", "contains", "exists", "not_exists".
      field "op", :op, :string
      field "value", :value, :any
    end

    # WebhookPreviewResult şeması.
    class WebhookPreviewResult < Pushizo::BaseModel
      # Zorunlu.
      field "payload", :payload, [:map, :any]
      # Zorunlu. Olay filtreden geçer mi (geçmezse gönderilmez).
      field "matched", :matched, :boolean
      # Zorunlu.
      field "failed_conditions", :failed_conditions, [:array, "WebhookPreviewResultFailedConditionsItem"]
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "content_type", :content_type, :string
      # Zorunlu.
      field "error", :error, "WebhookPreviewResultError"
    end

    # WebhookPreviewResultError şeması.
    class WebhookPreviewResultError < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # WebhookPreviewResultFailedConditionsItem şeması.
    class WebhookPreviewResultFailedConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu.
      field "op", :op, :string
      field "value", :value, :any
    end

    # WebhookWithSecret şeması.
    class WebhookWithSecret < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "events", :events, [:array, :string]
      # Zorunlu.
      field "event_filters", :event_filters, "WebhookWithSecretEventFilters"
      # Zorunlu.
      field "batch", :batch, :boolean
      # Zorunlu. Değerler: "active", "failing", "disabled".
      field "status", :status, :string
      # Zorunlu.
      field "disabled_reason", :disabled_reason, :string
      # Zorunlu.
      field "failure_count", :failure_count, :integer
      # Zorunlu.
      field "failing_since", :failing_since, :string
      # Zorunlu.
      field "last_success_at", :last_success_at, :string
      # Zorunlu.
      field "last_failure_at", :last_failure_at, :string
      # Zorunlu.
      field "header_names", :header_names, [:array, :string]
      # Zorunlu.
      field "previous_secret_expires_at", :previous_secret_expires_at, :string
      # Zorunlu.
      field "body_template", :body_template, :string
      # Zorunlu. Değerler: "application/json", "text/plain".
      field "body_content_type", :body_content_type, :string
      # Zorunlu.
      field "filters", :filters, "WebhookWithSecretFilters"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu. Yalnızca oluşturma ve rotasyon yanıtında bir kez döner.
      field "secret", :secret, :string
    end

    # WebhookWithSecretEventFilters şeması.
    class WebhookWithSecretEventFilters < Pushizo::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # WebhookWithSecretFilters şeması.
    class WebhookWithSecretFilters < Pushizo::BaseModel
      # Zorunlu. Değerler: "all", "any".
      field "match", :match, :string
      # Zorunlu.
      field "conditions", :conditions, [:array, "WebhookWithSecretFiltersConditionsItem"]
    end

    # WebhookWithSecretFiltersConditionsItem şeması.
    class WebhookWithSecretFiltersConditionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "field", :field, :string
      # Zorunlu. Değerler: "eq", "neq", "in", "not_in", "starts_with", "contains", "exists", "not_exists".
      field "op", :op, :string
      field "value", :value, :any
    end

    # WhatsAppTemplateList şeması.
    class WhatsAppTemplateList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WhatsAppTemplateListDataItem"]
    end

    # WhatsAppTemplateListDataItem şeması.
    class WhatsAppTemplateListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "components", :components, [:array, [:map, :any]]
      # Zorunlu.
      field "body_params", :body_params, :integer
      # Zorunlu.
      field "rejected_reason", :rejected_reason, :string
      # Zorunlu.
      field "quality_score", :quality_score, :string
      # Zorunlu.
      field "synced_at", :synced_at, :string
    end

    # WhatsAppTemplateSync şeması.
    class WhatsAppTemplateSync < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "removed", :removed, :integer
      # Zorunlu.
      field "data", :data, [:array, "WhatsAppTemplateSyncDataItem"]
    end

    # WhatsAppTemplateSyncDataItem şeması.
    class WhatsAppTemplateSyncDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "components", :components, [:array, [:map, :any]]
      # Zorunlu.
      field "body_params", :body_params, :integer
      # Zorunlu.
      field "rejected_reason", :rejected_reason, :string
      # Zorunlu.
      field "quality_score", :quality_score, :string
      # Zorunlu.
      field "synced_at", :synced_at, :string
    end

    # ZapierHook şeması.
    class ZapierHook < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "event", :event, :string
      # Zorunlu.
      field "event_name", :event_name, :string
      # Zorunlu.
      field "target_url", :target_url, :string
      # Zorunlu.
      field "last_delivered_at", :last_delivered_at, :string
      # Zorunlu.
      field "failure_count", :failure_count, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ZapierMe şeması.
    class ZapierMe < Pushizo::BaseModel
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "app_name", :app_name, :string
      # Zorunlu.
      field "org_id", :org_id, :string
      # Zorunlu.
      field "scopes", :scopes, [:array, :string]
    end

    # ZapierSamplesItem şeması.
    class ZapierSamplesItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "data", :data, [:map, :any]
    end

    # ZapierSubscribeDto şeması.
    class ZapierSubscribeDto < Pushizo::BaseModel
      # Zorunlu.
      field "target_url", :target_url, :string
      # Zorunlu. Değerler: "subscription.created", "subscription.unsubscribed", "event.received", "delivery.delivered", "delivery.opened", "delivery.clicked", "user.created", "user.updated", "conversion.created", "campaign.completed".
      field "event", :event, :string
      field "event_name", :event_name, :string
    end
  end
end
