# Bu dosya api/openapi.yaml'dan sdk/scripts/generate-server-sdks.mjs ile üretilmiştir; elle düzenlemeyin.
# frozen_string_literal: true

module HeroSignal
  # API şemalarının model sınıfları (hash tabanlı; bilinmeyen alanlar korunur).
  module Models
    # AddAliasDto şeması.
    class AddAliasDto < HeroSignal::BaseModel
      # Zorunlu.
      field "identity", :identity, [:map, :string]
    end

    # AddSubscriptionDto şeması.
    class AddSubscriptionDto < HeroSignal::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      # Zorunlu.
      field "token", :token, :string
      field "device", :device, "AddSubscriptionDtoDevice"
      # Değerler: "subscribed", "unsubscribed".
      field "status", :status, :string
    end

    # AddSubscriptionDtoDevice şeması.
    class AddSubscriptionDtoDevice < HeroSignal::BaseModel
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

    # ApiEventsDto şeması.
    class ApiEventsDto < HeroSignal::BaseModel
      # Zorunlu.
      field "events", :events, [:array, "ApiEventsDtoEventsItem"]
    end

    # ApiEventsDtoEventsItem şeması.
    class ApiEventsDtoEventsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "properties", :properties, [:map, :any]
      field "value", :value, :number
      field "occurred_at", :occurred_at, :string
      field "subscription_id", :subscription_id, :string
      field "external_id", :external_id, :string
    end

    # ApiKey şeması.
    class ApiKey < HeroSignal::BaseModel
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
    class ApiKeyList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ApiKey"]
    end

    # App şeması.
    class App < HeroSignal::BaseModel
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
      # Zorunlu. Değerler: "active", "suspended", "deleted".
      field "status", :status, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AppList şeması.
    class AppList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "App"]
    end

    # AppPlatformFlags şeması.
    class AppPlatformFlags < HeroSignal::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # AppSettings şeması.
    class AppSettings < HeroSignal::BaseModel
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
    class AppSettingsAndroidChannelsItem < HeroSignal::BaseModel
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
    class AppSettingsFrequencyCap < HeroSignal::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "windowHours", :window_hours, :integer
    end

    # AppSettingsFrequencyCapsItem şeması.
    class AppSettingsFrequencyCapsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "window", :window, "AppSettingsFrequencyCapsItemWindow"
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
    end

    # AppSettingsFrequencyCapsItemWindow şeması.
    class AppSettingsFrequencyCapsItemWindow < HeroSignal::BaseModel
      # Zorunlu.
      field "value", :value, :integer
      # Zorunlu. Değerler: "minutes", "hours", "days", "weeks".
      field "unit", :unit, :string
    end

    # AppSettingsInApp şeması.
    class AppSettingsInApp < HeroSignal::BaseModel
      field "minIntervalSeconds", :min_interval_seconds, :integer
    end

    # AppSettingsOnboarding şeması.
    class AppSettingsOnboarding < HeroSignal::BaseModel
      # Zorunlu.
      field "step", :step, :integer
      field "simulation", :simulation, :boolean
      field "completed_at", :completed_at, :string
    end

    # AppSettingsPreferenceCenter şeması.
    class AppSettingsPreferenceCenter < HeroSignal::BaseModel
      field "enabled", :enabled, :boolean
      field "brandName", :brand_name, :string
      field "logoUrl", :logo_url, :string
      field "accentColor", :accent_color, :string
      field "customUnsubscribeUrl", :custom_unsubscribe_url, :string
      field "texts", :texts, [:map, "AppSettingsPreferenceCenterTextsValue"]
    end

    # AppSettingsPreferenceCenterTextsValue şeması.
    class AppSettingsPreferenceCenterTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "unsubscribeAll", :unsubscribe_all, :string
      field "saved", :saved, :string
    end

    # AppSettingsQuietHours şeması.
    class AppSettingsQuietHours < HeroSignal::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
      # Zorunlu. Değerler: "user", "app".
      field "timezoneMode", :timezone_mode, :string
    end

    # AppSettingsSdkSetup şeması.
    class AppSettingsSdkSetup < HeroSignal::BaseModel
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
    class AppSettingsSms < HeroSignal::BaseModel
      field "helpReply", :help_reply, :string
      field "stopReply", :stop_reply, :string
      field "autoReply", :auto_reply, :boolean
    end

    # AppSettingsWebPush şeması.
    class AppSettingsWebPush < HeroSignal::BaseModel
      field "serviceWorkerPath", :service_worker_path, :string
      field "serviceWorkerScope", :service_worker_scope, :string
      field "prompt", :prompt, "AppSettingsWebPushPrompt"
      field "welcomeNotification", :welcome_notification, "AppSettingsWebPushWelcomeNotification"
      field "clickBehavior", :click_behavior, "AppSettingsWebPushClickBehavior"
      field "customLink", :custom_link, "AppSettingsWebPushCustomLink"
      field "promptBackoffDays", :prompt_backoff_days, [:array, :integer]
    end

    # AppSettingsWebPushClickBehavior şeması.
    class AppSettingsWebPushClickBehavior < HeroSignal::BaseModel
      # Zorunlu. Değerler: "exact", "origin".
      field "match", :match, :string
      # Zorunlu. Değerler: "navigate", "focus".
      field "action", :action, :string
    end

    # AppSettingsWebPushCustomLink şeması.
    class AppSettingsWebPushCustomLink < HeroSignal::BaseModel
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
    class AppSettingsWebPushCustomLinkColor < HeroSignal::BaseModel
      field "button", :button, :string
      field "text", :text, :string
    end

    # AppSettingsWebPushCustomLinkTextsValue şeması.
    class AppSettingsWebPushCustomLinkTextsValue < HeroSignal::BaseModel
      field "subscribe", :subscribe, :string
      field "unsubscribe", :unsubscribe, :string
      field "explanation", :explanation, :string
    end

    # AppSettingsWebPushPrompt şeması.
    class AppSettingsWebPushPrompt < HeroSignal::BaseModel
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
    class AppSettingsWebPushPromptCategoriesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "tag", :tag, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # AppSettingsWebPushPromptTextsValue şeması.
    class AppSettingsWebPushPromptTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "message", :message, :string
      field "accept", :accept, :string
      field "cancel", :cancel, :string
    end

    # AppSettingsWebPushWelcomeNotification şeması.
    class AppSettingsWebPushWelcomeNotification < HeroSignal::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "url", :url, :string
      field "texts", :texts, [:map, "AppSettingsWebPushWelcomeNotificationTextsValue"]
    end

    # AppSettingsWebPushWelcomeNotificationTextsValue şeması.
    class AppSettingsWebPushWelcomeNotificationTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "message", :message, :string
    end

    # AuditEntry şeması.
    class AuditEntry < HeroSignal::BaseModel
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
    class AuditPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AuditEntry"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # Campaign şeması.
    class Campaign < HeroSignal::BaseModel
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
    class CampaignAbTest < HeroSignal::BaseModel
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
    class CampaignAbTestSignificance < HeroSignal::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignAbTestWinner şeması.
    class CampaignAbTestWinner < HeroSignal::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Zorunlu. Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignApproval şeması.
    class CampaignApproval < HeroSignal::BaseModel
      # Zorunlu.
      field "required", :required, :boolean
      # Değerler: "send", "schedule".
      field "pending_action", :pending_action, :string
      field "requested_by", :requested_by, :string
      field "requested_at", :requested_at, :string
      field "approved_by", :approved_by, :string
      field "approved_at", :approved_at, :string
    end

    # CampaignDelivery şeması.
    class CampaignDelivery < HeroSignal::BaseModel
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
    class CampaignPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Campaign"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # CampaignRecurrence şeması.
    class CampaignRecurrence < HeroSignal::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsCreateBody şeması.
    class CampaignsCreateBody < HeroSignal::BaseModel
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
    class CampaignsCreateBodyAbTest < HeroSignal::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignsCreateBodyAbTestWinner"
    end

    # CampaignsCreateBodyAbTestWinner şeması.
    class CampaignsCreateBodyAbTestWinner < HeroSignal::BaseModel
      # Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignsCreateBodyAudience şeması.
    class CampaignsCreateBodyAudience < HeroSignal::BaseModel
      field "all", :all, :boolean
      field "segments", :segments, [:array, :string]
      field "exclude_segments", :exclude_segments, [:array, :string]
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "filters", :filters, "CampaignsCreateBodyAudienceFilters"
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class CampaignsCreateBodyAudienceFilters < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # CampaignsCreateBodyDelivery şeması.
    class CampaignsCreateBodyDelivery < HeroSignal::BaseModel
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
    class CampaignsCreateBodyRecurrence < HeroSignal::BaseModel
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsCreateBodyVariantsItem şeması.
    class CampaignsCreateBodyVariantsItem < HeroSignal::BaseModel
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      field "content", :content, [:map, :any]
      field "is_control", :is_control, :boolean
    end

    # CampaignStats şeması.
    class CampaignStats < HeroSignal::BaseModel
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
    class CampaignStats2 < HeroSignal::BaseModel
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
    class CampaignStatsChannelsItem < HeroSignal::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
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
    class CampaignStatsErrorsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # CampaignStatsHourlyItem şeması.
    class CampaignStatsHourlyItem < HeroSignal::BaseModel
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
    class CampaignStatsRates < HeroSignal::BaseModel
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
    class CampaignsUpdateBody < HeroSignal::BaseModel
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
    class CampaignsUpdateBodyAbTest < HeroSignal::BaseModel
      field "enabled", :enabled, :boolean
      field "test_percentage", :test_percentage, :integer
      field "winner", :winner, "CampaignsUpdateBodyAbTestWinner"
    end

    # CampaignsUpdateBodyAbTestWinner şeması.
    class CampaignsUpdateBodyAbTestWinner < HeroSignal::BaseModel
      # Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignsUpdateBodyAudience şeması.
    class CampaignsUpdateBodyAudience < HeroSignal::BaseModel
      field "all", :all, :boolean
      field "segments", :segments, [:array, :string]
      field "exclude_segments", :exclude_segments, [:array, :string]
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "filters", :filters, "CampaignsUpdateBodyAudienceFilters"
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class CampaignsUpdateBodyAudienceFilters < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # CampaignsUpdateBodyDelivery şeması.
    class CampaignsUpdateBodyDelivery < HeroSignal::BaseModel
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
    class CampaignsUpdateBodyRecurrence < HeroSignal::BaseModel
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # CampaignsUpdateBodyVariantsItem şeması.
    class CampaignsUpdateBodyVariantsItem < HeroSignal::BaseModel
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      field "content", :content, [:map, :any]
      field "is_control", :is_control, :boolean
    end

    # CampaignVariantsItem şeması.
    class CampaignVariantsItem < HeroSignal::BaseModel
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
    class CampaignVariantStats < HeroSignal::BaseModel
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
    class CampaignVariantStatsAbTest < HeroSignal::BaseModel
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
    class CampaignVariantStatsAbTestSignificance < HeroSignal::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignVariantStatsAbTestWinner şeması.
    class CampaignVariantStatsAbTestWinner < HeroSignal::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      # Zorunlu. Değerler: "open_rate", "click_rate", "conversion_rate".
      field "metric", :metric, :string
      field "evaluate_after_minutes", :evaluate_after_minutes, :integer
    end

    # CampaignVariantStatsSignificance şeması.
    class CampaignVariantStatsSignificance < HeroSignal::BaseModel
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "metric", :metric, :string
    end

    # CampaignVariantStatsVariantsItem şeması.
    class CampaignVariantStatsVariantsItem < HeroSignal::BaseModel
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
    class ChannelConfig < HeroSignal::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "mock".
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
    class ChannelConfigConfig < HeroSignal::BaseModel
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
    end

    # ChannelConfigDnsCheck şeması.
    class ChannelConfigDnsCheck < HeroSignal::BaseModel
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
    class ChannelConfigDnsCheckDkim < HeroSignal::BaseModel
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
    class ChannelConfigDnsCheckDmarc < HeroSignal::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "record", :record, :string
      # Zorunlu.
      field "expected", :expected, :string
    end

    # ChannelConfigDnsCheckSpf şeması.
    class ChannelConfigDnsCheckSpf < HeroSignal::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "record", :record, :string
      # Zorunlu.
      field "expected", :expected, :string
    end

    # ChannelList şeması.
    class ChannelList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ChannelConfig"]
    end

    # ChannelValidation şeması.
    class ChannelValidation < HeroSignal::BaseModel
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

    # ConversionsReport şeması.
    class ConversionsReport < HeroSignal::BaseModel
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
    class ConversionsReportByCampaignItem < HeroSignal::BaseModel
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
    class ConversionsReportPrevious < HeroSignal::BaseModel
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
    class ConversionsReportRowsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "revenue", :revenue, :number
    end

    # ConversionsReportTotals şeması.
    class ConversionsReportTotals < HeroSignal::BaseModel
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
    class CopyTemplateDto < HeroSignal::BaseModel
      # Zorunlu.
      field "target_app_id", :target_app_id, :string
      field "name", :name, :string
    end

    # CreateAppApiKeyDto şeması.
    class CreateAppApiKeyDto < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read".
      field "scopes", :scopes, [:array, :string]
      # Değerler: "live", "test".
      field "environment", :environment, :string
      field "expires_at", :expires_at, :string
      field "ip_allowlist", :ip_allowlist, [:array, :string]
    end

    # CreateAppDto şeması.
    class CreateAppDto < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "slug", :slug, :string
      field "platform_flags", :platform_flags, "CreateAppDtoPlatformFlags"
      field "default_language", :default_language, :string
      field "timezone", :timezone, :string
    end

    # CreateAppDtoPlatformFlags şeması.
    class CreateAppDtoPlatformFlags < HeroSignal::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # CreateCategoryDto şeması.
    class CreateCategoryDto < HeroSignal::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # CreatedApiKey şeması.
    class CreatedApiKey < HeroSignal::BaseModel
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

    # CreateExportDto şeması.
    class CreateExportDto < HeroSignal::BaseModel
      # Zorunlu. Değerler: "users", "subscriptions", "events", "deliveries", "message_events".
      field "type", :type, :string
      field "filters", :filters, "CreateExportDtoFilters"
    end

    # CreateExportDtoFilters şeması.
    class CreateExportDtoFilters < HeroSignal::BaseModel
      field "from", :from, :string
      field "to", :to, :string
      field "name", :name, :string
      field "message_id", :message_id, :string
      field "campaign_id", :campaign_id, :string
      field "status", :status, :string
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      field "segment_id", :segment_id, :string
    end

    # CreateInAppDto şeması.
    class CreateInAppDto < HeroSignal::BaseModel
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
    class CreateInAppDtoAbTest < HeroSignal::BaseModel
      field "winner", :winner, "CreateInAppDtoAbTestWinner"
    end

    # CreateInAppDtoAbTestWinner şeması.
    class CreateInAppDtoAbTestWinner < HeroSignal::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # CreateInAppDtoAudience şeması.
    class CreateInAppDtoAudience < HeroSignal::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # CreateInAppDtoDisplay şeması.
    class CreateInAppDtoDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # CreateInAppDtoFrequency şeması.
    class CreateInAppDtoFrequency < HeroSignal::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # CreateInAppDtoVariantsItem şeması.
    class CreateInAppDtoVariantsItem < HeroSignal::BaseModel
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
    class CreateInAppDtoVariantsItemDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # CreateNotificationDto şeması.
    class CreateNotificationDto < HeroSignal::BaseModel
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
    class CreateNotificationDtoButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateNotificationDtoTarget şeması.
    class CreateNotificationDtoTarget < HeroSignal::BaseModel
      field "all", :all, :boolean
      field "include_subscription_ids", :include_subscription_ids, [:array, :string]
      field "include_external_ids", :include_external_ids, [:array, :string]
      field "include_aliases", :include_aliases, [:map, [:array, :string]]
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      field "filters", :filters, :any
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
      field "email_to", :email_to, [:array, :string]
      field "include_phone_numbers", :include_phone_numbers, [:array, :string]
    end

    # CreateNotificationDtoWebButtonsItem şeması.
    class CreateNotificationDtoWebButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateNotificationResult şeması.
    class CreateNotificationResult < HeroSignal::BaseModel
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
    class CreateSuppressionDto < HeroSignal::BaseModel
      # Zorunlu. Değerler: "email", "sms".
      field "channel", :channel, :string
      # Zorunlu.
      field "value", :value, :string
      # Değerler: "manual", "bounce", "complaint", "unsubscribe_link", "stop".
      field "reason", :reason, :string
      field "expires_at", :expires_at, :string
      field "note", :note, :string
    end

    # CreateTemplateDto şeması.
    class CreateTemplateDto < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      field "tags", :tags, [:array, :string]
      # Zorunlu.
      field "content", :content, "CreateTemplateDtoContent"
    end

    # CreateTemplateDtoContent şeması.
    class CreateTemplateDtoContent < HeroSignal::BaseModel
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
    end

    # CreateTemplateDtoContentButtonsItem şeması.
    class CreateTemplateDtoContentButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateTemplateDtoContentWebButtonsItem şeması.
    class CreateTemplateDtoContentWebButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # CreateWebhookDto şeması.
    class CreateWebhookDto < HeroSignal::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "description", :description, :string
      # Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited".
      field "events", :events, [:array, :string]
      field "event_filters", :event_filters, "CreateWebhookDtoEventFilters"
      field "batch", :batch, :boolean
      field "headers", :headers, [:map, :string]
    end

    # CreateWebhookDtoEventFilters şeması.
    class CreateWebhookDtoEventFilters < HeroSignal::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # Delivery şeması.
    class Delivery < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "subscription_id", :subscription_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
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
    class DeliveryList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Delivery"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # EngagementReport şeması.
    class EngagementReport < HeroSignal::BaseModel
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
    class EngagementReportCellsItem < HeroSignal::BaseModel
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
    class EngagementReportPrevious < HeroSignal::BaseModel
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EngagementReportRowsItem şeması.
    class EngagementReportRowsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EngagementReportTotals şeması.
    class EngagementReportTotals < HeroSignal::BaseModel
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
    end

    # EstimateAudienceDto şeması.
    class EstimateAudienceDto < HeroSignal::BaseModel
      field "app_id", :app_id, :string
      # Zorunlu.
      field "target", :target, "EstimateAudienceDtoTarget"
      field "include_unsubscribed", :include_unsubscribed, :boolean
    end

    # EstimateAudienceDtoTarget şeması.
    class EstimateAudienceDtoTarget < HeroSignal::BaseModel
      field "all", :all, :boolean
      field "include_subscription_ids", :include_subscription_ids, [:array, :string]
      field "include_external_ids", :include_external_ids, [:array, :string]
      field "include_aliases", :include_aliases, [:map, [:array, :string]]
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      field "filters", :filters, :any
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "test_devices_only", :test_devices_only, :boolean
      field "email_to", :email_to, [:array, :string]
      field "include_phone_numbers", :include_phone_numbers, [:array, :string]
    end

    # EstimateAudienceResult şeması.
    class EstimateAudienceResult < HeroSignal::BaseModel
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
    class EventDefinition < HeroSignal::BaseModel
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
    class EventDefinitionDetail < HeroSignal::BaseModel
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
    class EventDefinitionDetailDailyItem < HeroSignal::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventDefinitionDetailPropertiesItem şeması.
    class EventDefinitionDetailPropertiesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "values", :values, [:array, "EventDefinitionDetailPropertiesItemValuesItem"]
    end

    # EventDefinitionDetailPropertiesItemValuesItem şeması.
    class EventDefinitionDetailPropertiesItemValuesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # EventDefinitionList şeması.
    class EventDefinitionList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "EventDefinition"]
    end

    # EventsAccepted şeması.
    class EventsAccepted < HeroSignal::BaseModel
      # Zorunlu.
      field "accepted", :accepted, :integer
    end

    # EventsReport şeması.
    class EventsReport < HeroSignal::BaseModel
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
    class EventsReportPrevious < HeroSignal::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventsReportRowsItem şeması.
    class EventsReportRowsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # EventsReportTotals şeması.
    class EventsReportTotals < HeroSignal::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "users", :users, :integer
    end

    # Export şeması.
    class Export < HeroSignal::BaseModel
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
    class ExportFilters < HeroSignal::BaseModel
      field "from", :from, :string
      field "to", :to, :string
      field "name", :name, :string
      field "message_id", :message_id, :string
      field "campaign_id", :campaign_id, :string
      field "status", :status, :string
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      field "segment_id", :segment_id, :string
    end

    # ExportList şeması.
    class ExportList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Export"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # FunnelBodyDto şeması.
    class FunnelBodyDto < HeroSignal::BaseModel
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
    class FunnelBodyDtoStepsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "where", :where, "FunnelBodyDtoStepsItemWhere"
    end

    # FunnelBodyDtoStepsItemWhere şeması.
    class FunnelBodyDtoStepsItemWhere < HeroSignal::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # FunnelReport şeması.
    class FunnelReport < HeroSignal::BaseModel
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
    class FunnelReportPrevious < HeroSignal::BaseModel
      # Zorunlu.
      field "steps", :steps, [:array, :integer]
      # Zorunlu.
      field "overall_rate", :overall_rate, :number
    end

    # FunnelReportStepsItem şeması.
    class FunnelReportStepsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
      # Zorunlu.
      field "drop_off", :drop_off, :integer
    end

    # Import şeması.
    class Import < HeroSignal::BaseModel
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
    class ImportList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Import"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # ImportStats şeması.
    class ImportStats < HeroSignal::BaseModel
      field "processed", :processed, :integer
      field "created_users", :created_users, :integer
      field "updated_users", :updated_users, :integer
      field "created_subscriptions", :created_subscriptions, :integer
      field "skipped", :skipped, :integer
      field "errors", :errors, :integer
    end

    # InAppMessage şeması.
    class InAppMessage < HeroSignal::BaseModel
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
    class InAppMessageAbTest < HeroSignal::BaseModel
      field "winner", :winner, "InAppMessageAbTestWinner"
      # Zorunlu.
      field "winner_variant_id", :winner_variant_id, :string
      # Zorunlu.
      field "decided_at", :decided_at, :string
      # Zorunlu.
      field "decided_by", :decided_by, :string
    end

    # InAppMessageAbTestWinner şeması.
    class InAppMessageAbTestWinner < HeroSignal::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # InAppMessageAudience şeması.
    class InAppMessageAudience < HeroSignal::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # InAppMessageDisplay şeması.
    class InAppMessageDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # InAppMessageFrequency şeması.
    class InAppMessageFrequency < HeroSignal::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # InAppMessagePage şeması.
    class InAppMessagePage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "InAppMessage"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # InAppMessageStats şeması.
    class InAppMessageStats < HeroSignal::BaseModel
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

    # InAppMessageVariantsItem şeması.
    class InAppMessageVariantsItem < HeroSignal::BaseModel
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
    class InAppMessageVariantsItemDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # InAppMessageVariantSignificance şeması.
    class InAppMessageVariantSignificance < HeroSignal::BaseModel
      # Zorunlu.
      field "leader", :leader, :string
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
    end

    # InAppMessageVariantStatsItem şeması.
    class InAppMessageVariantStatsItem < HeroSignal::BaseModel
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
    class InAppStatusDto < HeroSignal::BaseModel
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
    end

    # InAppWinnerDto şeması.
    class InAppWinnerDto < HeroSignal::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # InboxItem şeması.
    class InboxItem < HeroSignal::BaseModel
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
    class InboxPage < HeroSignal::BaseModel
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
    class InboxReadAllResult < HeroSignal::BaseModel
      # Zorunlu.
      field "updated", :updated, :integer
      # Zorunlu.
      field "unread_count", :unread_count, :integer
    end

    # Journey şeması.
    class Journey < HeroSignal::BaseModel
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
    class JourneyDetail < HeroSignal::BaseModel
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
    class JourneyDetailEditing < HeroSignal::BaseModel
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
    class JourneyDetailIssuesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "code", :code, :string
      field "node_id", :node_id, :string
      field "edge_id", :edge_id, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # JourneyDetailSummary şeması.
    class JourneyDetailSummary < HeroSignal::BaseModel
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
    class JourneyPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Journey"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # JourneyPublishResult şeması.
    class JourneyPublishResult < HeroSignal::BaseModel
      # Zorunlu.
      field "journey", :journey, "Journey"
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "issues", :issues, [:array, "JourneyPublishResultIssuesItem"]
    end

    # JourneyPublishResultIssuesItem şeması.
    class JourneyPublishResultIssuesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "code", :code, :string
      field "node_id", :node_id, :string
      field "edge_id", :edge_id, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # JourneyRun şeması.
    class JourneyRun < HeroSignal::BaseModel
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
    class JourneyRunDetail < HeroSignal::BaseModel
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
    class JourneyRunDetailStepsItem < HeroSignal::BaseModel
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
    class JourneyRunPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "JourneyRun"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # JourneysCreateBody şeması.
    class JourneysCreateBody < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
      field "graph", :graph, "JourneysCreateBodyGraph"
      # Yeniden giriş, yalnızca yeni girenler, çıkış kuralları, çıkış tag'leri, hedefler, takvim (docs/journeys.md)
      field "settings", :settings, [:map, :any]
    end

    # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
    class JourneysCreateBodyGraph < HeroSignal::BaseModel
      # Zorunlu.
      field "nodes", :nodes, [:array, [:map, :any]]
      # Zorunlu.
      field "edges", :edges, [:array, [:map, :any]]
    end

    # JourneysSaveDraftBody şeması.
    class JourneysSaveDraftBody < HeroSignal::BaseModel
      # Zorunlu. React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
      field "graph", :graph, "JourneysSaveDraftBodyGraph"
      # Yeniden giriş, yalnızca yeni girenler, çıkış kuralları, çıkış tag'leri, hedefler, takvim (docs/journeys.md)
      field "settings", :settings, [:map, :any]
    end

    # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
    class JourneysSaveDraftBodyGraph < HeroSignal::BaseModel
      # Zorunlu.
      field "nodes", :nodes, [:array, [:map, :any]]
      # Zorunlu.
      field "edges", :edges, [:array, [:map, :any]]
    end

    # JourneyStats şeması.
    class JourneyStats < HeroSignal::BaseModel
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
    class JourneyStatsGoalsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "goal_id", :goal_id, :string
      # Zorunlu.
      field "reached", :reached, :integer
    end

    # JourneyStatsNodesItem şeması.
    class JourneyStatsNodesItem < HeroSignal::BaseModel
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
    class JourneyStatsNodesItemVariantsItem < HeroSignal::BaseModel
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
    class JourneyStatsSummary < HeroSignal::BaseModel
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
    class JourneySummary < HeroSignal::BaseModel
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
    class JourneyTriggerResult < HeroSignal::BaseModel
      # Zorunlu.
      field "entered", :entered, :boolean
      # Zorunlu.
      field "run", :run, "JourneyRun"
      # Zorunlu. Değerler: "inactive", "outside_schedule", "re_entry", "already_active", "unknown_user".
      field "reason", :reason, :string
    end

    # JourneyVersionList şeması.
    class JourneyVersionList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "JourneyVersionListDataItem"]
    end

    # JourneyVersionListDataItem şeması.
    class JourneyVersionListDataItem < HeroSignal::BaseModel
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

    # Member şeması.
    class Member < HeroSignal::BaseModel
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
    class MemberList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Member"]
    end

    # Message şeması.
    class Message < HeroSignal::BaseModel
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
    class MessageCategory < HeroSignal::BaseModel
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
    class MessageCategoryList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "MessageCategory"]
    end

    # MessageCounts şeması.
    class MessageCounts < HeroSignal::BaseModel
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
    class MessageList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Message"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # MessageRequestedBy şeması.
    class MessageRequestedBy < HeroSignal::BaseModel
      # Zorunlu. Değerler: "api_key", "account", "system".
      field "type", :type, :string
      field "id", :id, :string
    end

    # MessagesReport şeması.
    class MessagesReport < HeroSignal::BaseModel
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
    class MessagesReportPrevious < HeroSignal::BaseModel
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
    class MessagesReportRowsItem < HeroSignal::BaseModel
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
    class MessagesReportTotals < HeroSignal::BaseModel
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
    class MessageVariantsItem < HeroSignal::BaseModel
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
    class Ok < HeroSignal::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # Org şeması.
    class Org < HeroSignal::BaseModel
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
    end

    # OrgSettings şeması.
    class OrgSettings < HeroSignal::BaseModel
      field "mfaRequired", :mfa_required, :boolean
      field "ipAllowlist", :ip_allowlist, [:array, :string]
      field "retentionDays", :retention_days, :integer
      field "sessionMaxHours", :session_max_hours, :integer
    end

    # OverviewStats şeması.
    class OverviewStats < HeroSignal::BaseModel
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
    class OverviewStatsChannelsItem < HeroSignal::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "mock".
      field "provider", :provider, :string
      # Zorunlu. Değerler: "unconfigured", "active", "invalid", "suspended".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "active_subscriptions", :active_subscriptions, :integer
    end

    # OverviewStatsKpis şeması.
    class OverviewStatsKpis < HeroSignal::BaseModel
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
    class OverviewStatsRecentCampaignsItem < HeroSignal::BaseModel
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
    class OverviewStatsSeriesItem < HeroSignal::BaseModel
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
    class OverviewStatsTopErrorsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # PatchEventDefinitionDto şeması.
    class PatchEventDefinitionDto < HeroSignal::BaseModel
      field "display_name", :display_name, :string
      field "is_conversion", :is_conversion, :boolean
      field "outcome_unique", :outcome_unique, :boolean
      field "outcome_unattributed", :outcome_unattributed, :boolean
    end

    # PatchSubscriptionDto şeması.
    class PatchSubscriptionDto < HeroSignal::BaseModel
      field "token", :token, :string
      field "device", :device, "PatchSubscriptionDtoDevice"
      # Değerler: "subscribed", "unsubscribed".
      field "status", :status, :string
      field "test_device", :test_device, :boolean
      field "test_device_name", :test_device_name, :string
    end

    # PatchSubscriptionDtoDevice şeması.
    class PatchSubscriptionDtoDevice < HeroSignal::BaseModel
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
    class PatchUserDto < HeroSignal::BaseModel
      field "properties", :properties, [:map, :any]
      field "tags", :tags, [:map, :string]
      field "deltas", :deltas, "PatchUserDtoDeltas"
    end

    # PatchUserDtoDeltas şeması.
    class PatchUserDtoDeltas < HeroSignal::BaseModel
      field "session_count", :session_count, :integer
      field "session_time", :session_time, :integer
      field "purchases", :purchases, [:array, "PatchUserDtoDeltasPurchasesItem"]
    end

    # PatchUserDtoDeltasPurchasesItem şeması.
    class PatchUserDtoDeltasPurchasesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "sku", :sku, :string
      # Zorunlu.
      field "amount", :amount, :number
      field "iso", :iso, :string
      field "count", :count, :integer
    end

    # ProvidersReport şeması.
    class ProvidersReport < HeroSignal::BaseModel
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
    class ProvidersReportPrevious < HeroSignal::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
    end

    # ProvidersReportRowsItem şeması.
    class ProvidersReportRowsItem < HeroSignal::BaseModel
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
    class ProvidersReportRowsItemErrorsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "count", :count, :integer
    end

    # ProvidersReportTotals şeması.
    class ProvidersReportTotals < HeroSignal::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "failure_rate", :failure_rate, :number
    end

    # RenderPreview şeması.
    class RenderPreview < HeroSignal::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
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
    class RenderPreviewButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      # Zorunlu.
      field "url", :url, :string
    end

    # RenderPreviewEmail şeması.
    class RenderPreviewEmail < HeroSignal::BaseModel
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
    class RenderPreviewSms < HeroSignal::BaseModel
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
    class RenderTemplateDto < HeroSignal::BaseModel
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      field "language", :language, :string
      field "user", :user, "RenderTemplateDtoUser"
      field "custom_data", :custom_data, [:map, :any]
      field "content", :content, "RenderTemplateDtoContent"
      field "version", :version, :integer
    end

    # RenderTemplateDtoContent şeması.
    class RenderTemplateDtoContent < HeroSignal::BaseModel
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
    end

    # RenderTemplateDtoContentButtonsItem şeması.
    class RenderTemplateDtoContentButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # RenderTemplateDtoContentWebButtonsItem şeması.
    class RenderTemplateDtoContentWebButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # RenderTemplateDtoUser şeması.
    class RenderTemplateDtoUser < HeroSignal::BaseModel
      field "external_id", :external_id, :string
      field "tags", :tags, [:map, :string]
      field "properties", :properties, [:map, :any]
    end

    # RetentionReport şeması.
    class RetentionReport < HeroSignal::BaseModel
      # Zorunlu.
      field "weeks", :weeks, :integer
      # Zorunlu.
      field "cohorts", :cohorts, [:array, "RetentionReportCohortsItem"]
      # Zorunlu.
      field "average", :average, [:array, :number]
    end

    # RetentionReportCohortsItem şeması.
    class RetentionReportCohortsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "week", :week, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "retention", :retention, [:array, :number]
    end

    # ScheduleCampaignDto şeması.
    class ScheduleCampaignDto < HeroSignal::BaseModel
      field "send_at", :send_at, :string
      field "recurrence", :recurrence, "ScheduleCampaignDtoRecurrence"
    end

    # ScheduleCampaignDtoRecurrence şeması.
    class ScheduleCampaignDtoRecurrence < HeroSignal::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "until", :until_, :string
      field "timezone", :timezone, :string
    end

    # Segment şeması.
    class Segment < HeroSignal::BaseModel
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
    class SegmentCampaigns < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SegmentCampaignsDataItem"]
    end

    # SegmentCampaignsDataItem şeması.
    class SegmentCampaignsDataItem < HeroSignal::BaseModel
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
    class SegmentEstimate < HeroSignal::BaseModel
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
    class SegmentPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Segment"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SegmentPreview şeması.
    class SegmentPreview < HeroSignal::BaseModel
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
    class SegmentPreviewSampleItem < HeroSignal::BaseModel
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
    class SegmentsCreateBody < HeroSignal::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsCreateBodyDefinition"
      field "is_dynamic", :is_dynamic, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsCreateBodyDefinition < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SegmentsPreviewBody şeması.
    class SegmentsPreviewBody < HeroSignal::BaseModel
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsPreviewBodyDefinition"
      field "limit", :limit, :integer
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsPreviewBodyDefinition < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SegmentsUpdateBody şeması.
    class SegmentsUpdateBody < HeroSignal::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "SegmentsUpdateBodyDefinition"
      field "is_dynamic", :is_dynamic, :boolean
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class SegmentsUpdateBodyDefinition < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # SelectWinnerDto şeması.
    class SelectWinnerDto < HeroSignal::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # SetOwnerDto şeması.
    class SetOwnerDto < HeroSignal::BaseModel
      # Zorunlu.
      field "external_id", :external_id, :string
    end

    # SetPreferencesDto şeması.
    class SetPreferencesDto < HeroSignal::BaseModel
      # Zorunlu.
      field "preferences", :preferences, [:array, "SetPreferencesDtoPreferencesItem"]
    end

    # SetPreferencesDtoPreferencesItem şeması.
    class SetPreferencesDtoPreferencesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "category", :category, :string
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      # Zorunlu.
      field "opted_in", :opted_in, :boolean
    end

    # Subscription şeması.
    class Subscription < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
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
      field "unsubscribed_at", :unsubscribed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SubscriptionDevice şeması.
    class SubscriptionDevice < HeroSignal::BaseModel
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

    # SubscriptionsReport şeması.
    class SubscriptionsReport < HeroSignal::BaseModel
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
    class SubscriptionsReportByChannelItem < HeroSignal::BaseModel
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
    class SubscriptionsReportPrevious < HeroSignal::BaseModel
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
    class SubscriptionsReportRowsItem < HeroSignal::BaseModel
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
    class SubscriptionsReportTotals < HeroSignal::BaseModel
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
    class Suppression < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "email", "sms".
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
    class SuppressionPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Suppression"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # Template şeması.
    class Template < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
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
    class TemplatePage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Template"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # TemplateStats şeması.
    class TemplateStats < HeroSignal::BaseModel
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
    class TemplateVersionList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "TemplateVersionListDataItem"]
    end

    # TemplateVersionListDataItem şeması.
    class TemplateVersionListDataItem < HeroSignal::BaseModel
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

    # TriggerRunDto şeması.
    class TriggerRunDto < HeroSignal::BaseModel
      field "external_id", :external_id, :string
      field "user_id", :user_id, :string
      field "alias", :alias_, "TriggerRunDtoAlias"
      field "context", :context, [:map, :any]
    end

    # TriggerRunDtoAlias şeması.
    class TriggerRunDtoAlias < HeroSignal::BaseModel
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UpdateApiKeyDto şeması.
    class UpdateApiKeyDto < HeroSignal::BaseModel
      field "name", :name, :string
      # Değerler: "admin", "notifications:write", "users:read", "users:write", "events:write", "segments:read", "analytics:read".
      field "scopes", :scopes, [:array, :string]
      field "ip_allowlist", :ip_allowlist, [:array, :string]
      field "expires_at", :expires_at, :string
    end

    # UpdateAppDto şeması.
    class UpdateAppDto < HeroSignal::BaseModel
      field "name", :name, :string
      field "platform_flags", :platform_flags, "UpdateAppDtoPlatformFlags"
      field "icon_url", :icon_url, :string
      field "default_language", :default_language, :string
      field "timezone", :timezone, :string
      field "settings", :settings, "UpdateAppDtoSettings"
    end

    # UpdateAppDtoPlatformFlags şeması.
    class UpdateAppDtoPlatformFlags < HeroSignal::BaseModel
      field "ios", :ios, :boolean
      field "android", :android, :boolean
      field "web", :web, :boolean
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # UpdateAppDtoSettings şeması.
    class UpdateAppDtoSettings < HeroSignal::BaseModel
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
    class UpdateAppDtoSettingsAndroidChannelsItem < HeroSignal::BaseModel
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
    class UpdateAppDtoSettingsFrequencyCap < HeroSignal::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "windowHours", :window_hours, :integer
    end

    # UpdateAppDtoSettingsFrequencyCapsItem şeması.
    class UpdateAppDtoSettingsFrequencyCapsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "max", :max, :integer
      # Zorunlu.
      field "window", :window, "UpdateAppDtoSettingsFrequencyCapsItemWindow"
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
    end

    # UpdateAppDtoSettingsFrequencyCapsItemWindow şeması.
    class UpdateAppDtoSettingsFrequencyCapsItemWindow < HeroSignal::BaseModel
      # Zorunlu.
      field "value", :value, :integer
      # Zorunlu. Değerler: "minutes", "hours", "days", "weeks".
      field "unit", :unit, :string
    end

    # UpdateAppDtoSettingsInApp şeması.
    class UpdateAppDtoSettingsInApp < HeroSignal::BaseModel
      field "minIntervalSeconds", :min_interval_seconds, :integer
    end

    # UpdateAppDtoSettingsOnboarding şeması.
    class UpdateAppDtoSettingsOnboarding < HeroSignal::BaseModel
      # Zorunlu.
      field "step", :step, :integer
      field "simulation", :simulation, :boolean
      field "completed_at", :completed_at, :string
    end

    # UpdateAppDtoSettingsPreferenceCenter şeması.
    class UpdateAppDtoSettingsPreferenceCenter < HeroSignal::BaseModel
      field "enabled", :enabled, :boolean
      field "brandName", :brand_name, :string
      field "logoUrl", :logo_url, :string
      field "accentColor", :accent_color, :string
      field "customUnsubscribeUrl", :custom_unsubscribe_url, :string
      field "texts", :texts, [:map, "UpdateAppDtoSettingsPreferenceCenterTextsValue"]
    end

    # UpdateAppDtoSettingsPreferenceCenterTextsValue şeması.
    class UpdateAppDtoSettingsPreferenceCenterTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "unsubscribeAll", :unsubscribe_all, :string
      field "saved", :saved, :string
    end

    # UpdateAppDtoSettingsQuietHours şeması.
    class UpdateAppDtoSettingsQuietHours < HeroSignal::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
      # Zorunlu. Değerler: "user", "app".
      field "timezoneMode", :timezone_mode, :string
    end

    # UpdateAppDtoSettingsSdkSetup şeması.
    class UpdateAppDtoSettingsSdkSetup < HeroSignal::BaseModel
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
    class UpdateAppDtoSettingsSms < HeroSignal::BaseModel
      field "helpReply", :help_reply, :string
      field "stopReply", :stop_reply, :string
      field "autoReply", :auto_reply, :boolean
    end

    # UpdateAppDtoSettingsWebPush şeması.
    class UpdateAppDtoSettingsWebPush < HeroSignal::BaseModel
      field "serviceWorkerPath", :service_worker_path, :string
      field "serviceWorkerScope", :service_worker_scope, :string
      field "prompt", :prompt, "UpdateAppDtoSettingsWebPushPrompt"
      field "welcomeNotification", :welcome_notification, "UpdateAppDtoSettingsWebPushWelcomeNotification"
      field "clickBehavior", :click_behavior, "UpdateAppDtoSettingsWebPushClickBehavior"
      field "customLink", :custom_link, "UpdateAppDtoSettingsWebPushCustomLink"
      field "promptBackoffDays", :prompt_backoff_days, [:array, :integer]
    end

    # UpdateAppDtoSettingsWebPushClickBehavior şeması.
    class UpdateAppDtoSettingsWebPushClickBehavior < HeroSignal::BaseModel
      # Zorunlu. Değerler: "exact", "origin".
      field "match", :match, :string
      # Zorunlu. Değerler: "navigate", "focus".
      field "action", :action, :string
    end

    # UpdateAppDtoSettingsWebPushCustomLink şeması.
    class UpdateAppDtoSettingsWebPushCustomLink < HeroSignal::BaseModel
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
    class UpdateAppDtoSettingsWebPushCustomLinkColor < HeroSignal::BaseModel
      field "button", :button, :string
      field "text", :text, :string
    end

    # UpdateAppDtoSettingsWebPushCustomLinkTextsValue şeması.
    class UpdateAppDtoSettingsWebPushCustomLinkTextsValue < HeroSignal::BaseModel
      field "subscribe", :subscribe, :string
      field "unsubscribe", :unsubscribe, :string
      field "explanation", :explanation, :string
    end

    # UpdateAppDtoSettingsWebPushPrompt şeması.
    class UpdateAppDtoSettingsWebPushPrompt < HeroSignal::BaseModel
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
    class UpdateAppDtoSettingsWebPushPromptCategoriesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "tag", :tag, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # UpdateAppDtoSettingsWebPushPromptTextsValue şeması.
    class UpdateAppDtoSettingsWebPushPromptTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "message", :message, :string
      field "accept", :accept, :string
      field "cancel", :cancel, :string
    end

    # UpdateAppDtoSettingsWebPushWelcomeNotification şeması.
    class UpdateAppDtoSettingsWebPushWelcomeNotification < HeroSignal::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "url", :url, :string
      field "texts", :texts, [:map, "UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue"]
    end

    # UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue şeması.
    class UpdateAppDtoSettingsWebPushWelcomeNotificationTextsValue < HeroSignal::BaseModel
      field "title", :title, :string
      field "message", :message, :string
    end

    # UpdateCategoryDto şeması.
    class UpdateCategoryDto < HeroSignal::BaseModel
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # UpdateInAppDto şeması.
    class UpdateInAppDto < HeroSignal::BaseModel
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
    class UpdateInAppDtoAbTest < HeroSignal::BaseModel
      field "winner", :winner, "UpdateInAppDtoAbTestWinner"
    end

    # UpdateInAppDtoAbTestWinner şeması.
    class UpdateInAppDtoAbTestWinner < HeroSignal::BaseModel
      # Zorunlu. Değerler: "manual", "auto".
      field "mode", :mode, :string
      field "min_impressions", :min_impressions, :integer
      field "confidence", :confidence, :number
    end

    # UpdateInAppDtoAudience şeması.
    class UpdateInAppDtoAudience < HeroSignal::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
    end

    # UpdateInAppDtoDisplay şeması.
    class UpdateInAppDtoDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # UpdateInAppDtoFrequency şeması.
    class UpdateInAppDtoFrequency < HeroSignal::BaseModel
      field "max_impressions", :max_impressions, :integer
      field "min_interval_seconds", :min_interval_seconds, :integer
      field "stop_after_interaction", :stop_after_interaction, :boolean
    end

    # UpdateInAppDtoVariantsItem şeması.
    class UpdateInAppDtoVariantsItem < HeroSignal::BaseModel
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
    class UpdateInAppDtoVariantsItemDisplay < HeroSignal::BaseModel
      # Zorunlu. Değerler: "modal", "banner_top", "banner_bottom", "fullscreen".
      field "layout", :layout, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # UpdateJourneyDto şeması.
    class UpdateJourneyDto < HeroSignal::BaseModel
      field "name", :name, :string
      field "description", :description, :string
    end

    # UpdateNodeDto şeması.
    class UpdateNodeDto < HeroSignal::BaseModel
      field "data", :data, [:map, :any]
      field "position", :position, "UpdateNodeDtoPosition"
    end

    # UpdateNodeDtoPosition şeması.
    class UpdateNodeDtoPosition < HeroSignal::BaseModel
      # Zorunlu.
      field "x", :x, :number
      # Zorunlu.
      field "y", :y, :number
    end

    # UpdateTemplateDto şeması.
    class UpdateTemplateDto < HeroSignal::BaseModel
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channel", :channel, :string
      field "tags", :tags, [:array, :string]
      field "content", :content, "UpdateTemplateDtoContent"
    end

    # UpdateTemplateDtoContent şeması.
    class UpdateTemplateDtoContent < HeroSignal::BaseModel
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
    end

    # UpdateTemplateDtoContentButtonsItem şeması.
    class UpdateTemplateDtoContentButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # UpdateTemplateDtoContentWebButtonsItem şeması.
    class UpdateTemplateDtoContentWebButtonsItem < HeroSignal::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "text", :text, :string
      field "icon", :icon, :string
      field "url", :url, :string
    end

    # UpdateWebhookDto şeması.
    class UpdateWebhookDto < HeroSignal::BaseModel
      field "url", :url, :string
      field "description", :description, :string
      # Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited".
      field "events", :events, [:array, :string]
      field "event_filters", :event_filters, "UpdateWebhookDtoEventFilters"
      field "batch", :batch, :boolean
      field "headers", :headers, [:map, :string]
      # Değerler: "active", "disabled".
      field "status", :status, :string
    end

    # UpdateWebhookDtoEventFilters şeması.
    class UpdateWebhookDtoEventFilters < HeroSignal::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # UpsertUserDto şeması.
    class UpsertUserDto < HeroSignal::BaseModel
      field "identity", :identity, :any
      field "external_id", :external_id, :string
      field "properties", :properties, [:map, :any]
      field "tags", :tags, [:map, :string]
      field "subscriptions", :subscriptions, [:array, "AddSubscriptionDto"]
    end

    # UsageReport şeması.
    class UsageReport < HeroSignal::BaseModel
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
    class UsageReportAppsItem < HeroSignal::BaseModel
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
    class UsageReportDailyItem < HeroSignal::BaseModel
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
    class UsageReportMetricsItem < HeroSignal::BaseModel
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
    class UsageReportPeriod < HeroSignal::BaseModel
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
    end

    # User şeması.
    class User < HeroSignal::BaseModel
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
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
    end

    # UserDetail şeması.
    class UserDetail < HeroSignal::BaseModel
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
      # Zorunlu. Değerler: "ios_push", "android_push", "web_push", "email", "sms".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "aliases", :aliases, [:array, "UserDetailAliasesItem"]
      # Zorunlu.
      field "subscriptions", :subscriptions, [:array, "Subscription"]
    end

    # UserDetailAliasesItem şeması.
    class UserDetailAliasesItem < HeroSignal::BaseModel
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UserExport şeması.
    class UserExport < HeroSignal::BaseModel
      # Zorunlu.
      field "exported_at", :exported_at, :string
      # Zorunlu.
      field "user", :user, "UserDetail"
      # Zorunlu.
      field "events", :events, [:array, "UserExportEventsItem"]
    end

    # UserExportEventsItem şeması.
    class UserExportEventsItem < HeroSignal::BaseModel
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
    class UserIdentity < HeroSignal::BaseModel
      # Zorunlu.
      field "identity", :identity, [:map, :string]
    end

    # UserJourneyRuns şeması.
    class UserJourneyRuns < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "UserJourneyRunsDataItem"]
    end

    # UserJourneyRunsDataItem şeması.
    class UserJourneyRunsDataItem < HeroSignal::BaseModel
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
    class UserList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "User"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # UserPreferences şeması.
    class UserPreferences < HeroSignal::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "data", :data, [:array, "UserPreferencesDataItem"]
      # Zorunlu.
      field "categories", :categories, [:array, "MessageCategory"]
    end

    # UserPreferencesDataItem şeması.
    class UserPreferencesDataItem < HeroSignal::BaseModel
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
    class UsersSearchBody < HeroSignal::BaseModel
      # Zorunlu. Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
      field "definition", :definition, "UsersSearchBodyDefinition"
      field "limit", :limit, :integer
      field "cursor", :cursor, :string
    end

    # Filtre AST: all/any/none grupları ve { field, op, value } koşulları (docs/plan/05 §5.7).
    class UsersSearchBodyDefinition < HeroSignal::BaseModel
      field "all", :all, [:array, [:map, :any]]
      field "any", :any, [:array, [:map, :any]]
      field "none", :none, [:array, [:map, :any]]
    end

    # Webhook şeması.
    class Webhook < HeroSignal::BaseModel
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
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WebhookDeliveryDetail şeması.
    class WebhookDeliveryDetail < HeroSignal::BaseModel
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
    class WebhookDeliveryPage < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WebhookDeliveryPageDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WebhookDeliveryPageDataItem şeması.
    class WebhookDeliveryPageDataItem < HeroSignal::BaseModel
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
    class WebhookEventFilters < HeroSignal::BaseModel
      field "event_names", :event_names, [:array, :string]
    end

    # WebhookList şeması.
    class WebhookList < HeroSignal::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Webhook"]
    end

    # WebhookWithSecret şeması.
    class WebhookWithSecret < HeroSignal::BaseModel
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
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu. Yalnızca oluşturma ve rotasyon yanıtında bir kez döner.
      field "secret", :secret, :string
    end

    # WebhookWithSecretEventFilters şeması.
    class WebhookWithSecretEventFilters < HeroSignal::BaseModel
      field "event_names", :event_names, [:array, :string]
    end
  end
end
