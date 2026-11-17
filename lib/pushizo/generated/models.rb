# Bu dosya api/openapi.yaml'dan sdk/scripts/generate-server-sdks.mjs ile üretilmiştir; elle düzenlemeyin.
# frozen_string_literal: true

module Pushizo
  # API şemalarının model sınıfları (hash tabanlı; bilinmeyen alanlar korunur).
  module Models
    # AdAccount şeması.
    class AdAccount < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok", "linkedin".
      field "platform", :platform, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "timezone", :timezone, :string
      # Zorunlu. Değerler: "active", "error", "revoked".
      field "status", :status, :string
      # Zorunlu.
      field "scopes", :scopes, [:array, :string]
      # Zorunlu.
      field "login_customer_id", :login_customer_id, :string
      # Zorunlu.
      field "token_expires_at", :token_expires_at, :string
      # Zorunlu.
      field "last_refreshed_at", :last_refreshed_at, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_error_at", :last_error_at, :string
      # Zorunlu.
      field "terms_accepted_at", :terms_accepted_at, :string
      # Zorunlu.
      field "terms_version", :terms_version, :string
      # Zorunlu.
      field "audiences", :audiences, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AdAccountList şeması.
    class AdAccountList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdAccount"]
    end

    # AdAttributionReport şeması.
    class AdAttributionReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu. Değerler: "last_click", "first_click", "linear", "time_decay".
      field "model", :model, :string
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu.
      field "half_life_days", :half_life_days, :integer
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "group_by", :group_by, :string
      # Zorunlu.
      field "conversion_events", :conversion_events, [:array, :string]
      # Zorunlu.
      field "rows", :rows, [:array, "AdAttributionReportRowsItem"]
      # Zorunlu.
      field "totals", :totals, "AdAttributionReportTotals"
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "fx_missing", :fx_missing, [:array, :string]
    end

    # AdAttributionReportRowsItem şeması.
    class AdAttributionReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok", "linkedin", "microsoft", "other_paid", "utm", "push", "email", "sms", "whatsapp", "rcs", "direct".
      field "channel", :channel, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "paid", :paid, :boolean
      # Zorunlu.
      field "conversions", :conversions, :number
      # Zorunlu.
      field "revenue", :revenue, :number
      # Zorunlu.
      field "new_customers", :new_customers, :number
      # Zorunlu.
      field "spend", :spend, :number
      # Zorunlu.
      field "roas", :roas, :number
      # Zorunlu.
      field "cac", :cac, :number
    end

    # AdAttributionReportTotals şeması.
    class AdAttributionReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "conversions", :conversions, :number
      # Zorunlu.
      field "revenue", :revenue, :number
      # Zorunlu.
      field "spend", :spend, :number
      # Zorunlu.
      field "new_customers", :new_customers, :number
      # Zorunlu.
      field "roas", :roas, :number
      # Zorunlu.
      field "platform_roas", :platform_roas, :number
      # Zorunlu.
      field "cac", :cac, :number
      # Zorunlu.
      field "paid_cac", :paid_cac, :number
    end

    # AdAudience şeması.
    class AdAudience < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "ad_account_id", :ad_account_id, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok", "linkedin".
      field "platform", :platform, :string
      # Zorunlu. Değerler: "segment", "journey", "lookalike".
      field "source", :source, :string
      # Zorunlu.
      field "segment_id", :segment_id, :string
      # Zorunlu.
      field "segment_name", :segment_name, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "pending", "active", "paused", "error".
      field "status", :status, :string
      # Zorunlu. Değerler: "email", "phone", "maid".
      field "identifiers", :identifiers, [:array, :string]
      # Zorunlu.
      field "sync_interval_minutes", :sync_interval_minutes, :integer
      # Zorunlu.
      field "next_sync_at", :next_sync_at, :string
      # Zorunlu.
      field "last_synced_at", :last_synced_at, :string
      # Zorunlu. Değerler: "succeeded", "partial", "failed".
      field "last_sync_status", :last_sync_status, :string
      # Zorunlu.
      field "full_reload_requested", :full_reload_requested, :boolean
      # Zorunlu.
      field "member_count", :member_count, :integer
      # Zorunlu.
      field "estimated_size", :estimated_size, :integer
      # Zorunlu.
      field "match_rate", :match_rate, :number
      # Zorunlu.
      field "size_updated_at", :size_updated_at, :string
      # Zorunlu.
      field "lookalike_source_id", :lookalike_source_id, :string
      # Zorunlu.
      field "lookalike_spec", :lookalike_spec, "AdAudienceLookalikeSpec"
      # Zorunlu.
      field "consecutive_failures", :consecutive_failures, :integer
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_error_at", :last_error_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AdAudienceList şeması.
    class AdAudienceList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdAudience"]
    end

    # AdAudienceLookalikeSpec şeması.
    class AdAudienceLookalikeSpec < Pushizo::BaseModel
      # Zorunlu.
      field "country", :country, :string
      # Zorunlu.
      field "ratio", :ratio, :number
    end

    # AdAudienceSyncList şeması.
    class AdAudienceSyncList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdAudienceSyncListDataItem"]
    end

    # AdAudienceSyncListDataItem şeması.
    class AdAudienceSyncListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "audience_id", :audience_id, :string
      # Zorunlu. Değerler: "schedule", "manual", "journey".
      field "trigger", :trigger, :string
      # Zorunlu. Değerler: "incremental", "full".
      field "mode", :mode, :string
      # Zorunlu. Değerler: "running", "succeeded", "partial", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "added", :added, :integer
      # Zorunlu.
      field "removed", :removed, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "skipped_no_consent", :skipped_no_consent, :integer
      # Zorunlu.
      field "skipped_no_identifier", :skipped_no_identifier, :integer
      # Zorunlu.
      field "batches", :batches, :integer
      # Zorunlu.
      field "retries", :retries, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "finished_at", :finished_at, :string
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
    end

    # AdAudienceSyncQueued şeması.
    class AdAudienceSyncQueued < Pushizo::BaseModel
      # Zorunlu.
      field "queued", :queued, :boolean
      # Zorunlu.
      field "next_sync_at", :next_sync_at, :string
      # Zorunlu. Değerler: "incremental", "full".
      field "mode", :mode, :string
    end

    # AdBudgetAlertList şeması.
    class AdBudgetAlertList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdBudgetAlertListDataItem"]
    end

    # AdBudgetAlertListDataItem şeması.
    class AdBudgetAlertListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "rule_id", :rule_id, :string
      # Zorunlu.
      field "rule_name", :rule_name, :string
      # Zorunlu. Değerler: "daily_spend", "roas_drop", "budget_depletion".
      field "kind", :kind, :string
      # Zorunlu.
      field "day", :day, :string
      # Zorunlu.
      field "value", :value, :number
      # Zorunlu.
      field "threshold", :threshold, :number
      # Zorunlu.
      field "details", :details, [:map, :any]
      # Zorunlu.
      field "emailed", :emailed, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # AdBudgetAlertRule şeması.
    class AdBudgetAlertRule < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "daily_spend", "roas_drop", "budget_depletion".
      field "kind", :kind, :string
      # Zorunlu.
      field "ad_account_id", :ad_account_id, :string
      # Zorunlu.
      field "campaign_external_id", :campaign_external_id, :string
      # Zorunlu.
      field "threshold", :threshold, :number
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu.
      field "recipients", :recipients, [:array, :string]
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "last_value", :last_value, :number
      # Zorunlu.
      field "last_evaluated_at", :last_evaluated_at, :string
      # Zorunlu.
      field "last_triggered_on", :last_triggered_on, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AdBudgetAlertRuleList şeması.
    class AdBudgetAlertRuleList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdBudgetAlertRule"]
    end

    # AdCapiConfig şeması.
    class AdCapiConfig < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok".
      field "platform", :platform, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "ad_account_id", :ad_account_id, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "settings", :settings, "AdCapiConfigSettings"
      # Zorunlu.
      field "event_mappings", :event_mappings, [:array, "AdCapiConfigEventMappingsItem"]
      # Zorunlu.
      field "test_event_code", :test_event_code, :string
      # Zorunlu.
      field "test_mode", :test_mode, :boolean
      # Zorunlu. Değerler: "website", "app".
      field "action_source", :action_source, :string
      # Zorunlu.
      field "default_currency", :default_currency, :string
      # Zorunlu.
      field "has_access_token", :has_access_token, :boolean
      # Zorunlu.
      field "last_sent_at", :last_sent_at, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_error_at", :last_error_at, :string
      # Zorunlu.
      field "stats", :stats, "AdCapiConfigStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AdCapiConfigEventMappingsItem şeması.
    class AdCapiConfigEventMappingsItem < Pushizo::BaseModel
      # Zorunlu.
      field "event_name", :event_name, :string
      # Zorunlu.
      field "platform_event", :platform_event, :string
      # Zorunlu.
      field "value_property", :value_property, :string
      # Zorunlu.
      field "currency_property", :currency_property, :string
    end

    # AdCapiConfigList şeması.
    class AdCapiConfigList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdCapiConfig"]
    end

    # AdCapiConfigSettings şeması.
    class AdCapiConfigSettings < Pushizo::BaseModel
      # Zorunlu.
      field "pixel_id", :pixel_id, :string
      # Zorunlu.
      field "customer_id", :customer_id, :string
      # Zorunlu.
      field "login_customer_id", :login_customer_id, :string
      # Zorunlu.
      field "pixel_code", :pixel_code, :string
    end

    # AdCapiConfigStats şeması.
    class AdCapiConfigStats < Pushizo::BaseModel
      # Zorunlu.
      field "pending", :pending, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "skipped", :skipped, :integer
    end

    # AdCapiDelivery şeması.
    class AdCapiDelivery < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "config_id", :config_id, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok".
      field "platform", :platform, :string
      # Zorunlu.
      field "event_id", :event_id, :string
      # Zorunlu.
      field "event_name", :event_name, :string
      # Zorunlu.
      field "platform_event", :platform_event, :string
      # Zorunlu.
      field "dedup_id", :dedup_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "value", :value, :number
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu. Değerler: "pending", "sent", "failed", "skipped".
      field "status", :status, :string
      # Zorunlu.
      field "skip_reason", :skip_reason, :string
      # Zorunlu.
      field "attempts", :attempts, :integer
      # Zorunlu.
      field "next_attempt_at", :next_attempt_at, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "test", :test, :boolean
      # Zorunlu.
      field "event_occurred_at", :event_occurred_at, :string
      # Zorunlu.
      field "sent_at", :sent_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # AdCapiDeliveryList şeması.
    class AdCapiDeliveryList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdCapiDelivery"]
    end

    # AddAliasDto şeması.
    class AddAliasDto < Pushizo::BaseModel
      # Zorunlu.
      field "identity", :identity, [:map, :string]
    end

    # AddSubscriptionDto şeması.
    class AddSubscriptionDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "phone", "watch".
      field "form_factor", :form_factor, :string
      # Değerler: "alert", "voip", "app_clip".
      field "push_kind", :push_kind, :string
      field "manufacturer", :manufacturer, :string
      field "brand", :brand, :string
      field "rom", :rom, :string
      field "rom_version", :rom_version, :string
      field "delivery", :delivery, "AddSubscriptionDtoDeviceDelivery"
    end

    # AddSubscriptionDtoDeviceDelivery şeması.
    class AddSubscriptionDtoDeviceDelivery < Pushizo::BaseModel
      field "battery_optimization_exempt", :battery_optimization_exempt, :boolean
      field "background_restricted", :background_restricted, :boolean
      field "channel_blocked", :channel_blocked, :boolean
      field "power_save_mode", :power_save_mode, :boolean
      field "data_saver", :data_saver, :boolean
      # Değerler: "exempted", "active", "working_set", "frequent", "rare", "restricted".
      field "standby_bucket", :standby_bucket, :string
    end

    # AddSubscriptionDtoOptIn şeması.
    class AddSubscriptionDtoOptIn < Pushizo::BaseModel
      # Zorunlu.
      field "source", :source, :string
      field "at", :at, :string
    end

    # AdEntity şeması.
    class AdEntity < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "ad_account_id", :ad_account_id, :string
      # Zorunlu. Değerler: "meta", "google", "tiktok".
      field "platform", :platform, :string
      # Zorunlu. Değerler: "campaign", "ad_set", "ad".
      field "level", :level, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "campaign_external_id", :campaign_external_id, :string
      # Zorunlu.
      field "ad_set_external_id", :ad_set_external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "active", "paused", "pending", "rejected", "archived", "deleted", "unknown".
      field "status", :status, :string
      # Zorunlu.
      field "platform_status", :platform_status, :string
      # Zorunlu.
      field "objective", :objective, :string
      # Zorunlu.
      field "optimization_goal", :optimization_goal, :string
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "daily_budget", :daily_budget, :string
      # Zorunlu.
      field "lifetime_budget", :lifetime_budget, :string
      # Zorunlu.
      field "start_at", :start_at, :string
      # Zorunlu.
      field "end_at", :end_at, :string
      # Zorunlu.
      field "audience_external_ids", :audience_external_ids, [:array, :string]
      # Zorunlu.
      field "creative", :creative, "AdEntityCreative"
      # Zorunlu.
      field "budget_editable", :budget_editable, :boolean
      # Zorunlu.
      field "created_by_pushizo", :created_by_pushizo, :boolean
      # Zorunlu.
      field "last_seen_at", :last_seen_at, :string
      # Zorunlu.
      field "platform_url", :platform_url, :string
      # Zorunlu.
      field "metrics", :metrics, "AdEntityMetrics"
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AdEntityCreative şeması.
    class AdEntityCreative < Pushizo::BaseModel
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "link_url", :link_url, :string
      # Zorunlu.
      field "image_url", :image_url, :string
      # Zorunlu.
      field "call_to_action", :call_to_action, :string
    end

    # AdEntityList şeması.
    class AdEntityList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AdEntity"]
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "accounts", :accounts, [:array, "AdEntityListAccountsItem"]
    end

    # AdEntityListAccountsItem şeması.
    class AdEntityListAccountsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "campaigns_synced_at", :campaigns_synced_at, :string
      # Zorunlu.
      field "insights_synced_at", :insights_synced_at, :string
      # Zorunlu.
      field "campaigns_sync_error", :campaigns_sync_error, :string
      # Zorunlu.
      field "insights_sync_error", :insights_sync_error, :string
    end

    # AdEntityMetrics şeması.
    class AdEntityMetrics < Pushizo::BaseModel
      # Zorunlu.
      field "impressions", :impressions, :number
      # Zorunlu.
      field "clicks", :clicks, :number
      # Zorunlu.
      field "spend", :spend, :number
      # Zorunlu.
      field "conversions", :conversions, :number
      # Zorunlu.
      field "conversion_value", :conversion_value, :number
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "cpc", :cpc, :number
      # Zorunlu.
      field "roas", :roas, :number
    end

    # AdLtvReport şeması.
    class AdLtvReport < Pushizo::BaseModel
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "months", :months, :integer
      # Zorunlu.
      field "conversion_events", :conversion_events, [:array, :string]
      # Zorunlu.
      field "cohorts", :cohorts, [:array, "AdLtvReportCohortsItem"]
      # Zorunlu.
      field "average", :average, [:array, :number]
      # Zorunlu.
      field "fx_missing", :fx_missing, [:array, :string]
    end

    # AdLtvReportCohortsItem şeması.
    class AdLtvReportCohortsItem < Pushizo::BaseModel
      # Zorunlu.
      field "cohort", :cohort, :string
      # Zorunlu.
      field "size", :size, :integer
      # Zorunlu.
      field "revenue", :revenue, [:array, :number]
      # Zorunlu.
      field "ltv", :ltv, [:array, :number]
    end

    # AdOk şeması.
    class AdOk < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # AdRefreshQueued şeması.
    class AdRefreshQueued < Pushizo::BaseModel
      # Zorunlu.
      field "queued", :queued, :boolean
      # Zorunlu.
      field "next_sync_at", :next_sync_at, :string
    end

    # AdSpendReport şeması.
    class AdSpendReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "group_by", :group_by, :string
      # Zorunlu.
      field "rows", :rows, [:array, "AdSpendReportRowsItem"]
      # Zorunlu.
      field "totals", :totals, "AdSpendReportTotals"
      # Zorunlu.
      field "fx_missing", :fx_missing, [:array, :string]
      # Zorunlu. Değerler: "postgres", "clickhouse".
      field "store", :store, :string
    end

    # AdSpendReportRowsItem şeması.
    class AdSpendReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "platform", :platform, :string
      # Zorunlu.
      field "impressions", :impressions, :number
      # Zorunlu.
      field "clicks", :clicks, :number
      # Zorunlu.
      field "spend", :spend, :number
      # Zorunlu.
      field "conversions", :conversions, :number
      # Zorunlu.
      field "conversion_value", :conversion_value, :number
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "cpc", :cpc, :number
      # Zorunlu.
      field "cpa", :cpa, :number
      # Zorunlu.
      field "roas", :roas, :number
    end

    # AdSpendReportTotals şeması.
    class AdSpendReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "impressions", :impressions, :number
      # Zorunlu.
      field "clicks", :clicks, :number
      # Zorunlu.
      field "spend", :spend, :number
      # Zorunlu.
      field "conversions", :conversions, :number
      # Zorunlu.
      field "conversion_value", :conversion_value, :number
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "cpc", :cpc, :number
      # Zorunlu.
      field "cpa", :cpa, :number
      # Zorunlu.
      field "roas", :roas, :number
    end

    # AffinityConfig şeması.
    class AffinityConfig < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "attributes", :attributes_value, [:array, :string]
      # Zorunlu.
      field "events", :events, [:map, :number]
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu.
      field "half_life_days", :half_life_days, :integer
      # Zorunlu. Değerler: "idle", "queued", "running", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_users", :scored_users, :integer
    end

    # AffinityOverview şeması.
    class AffinityOverview < Pushizo::BaseModel
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_users", :scored_users, :integer
      # Zorunlu.
      field "attributes", :attributes_value, [:array, "AffinityOverviewAttributesItem"]
    end

    # AffinityOverviewAttributesItem şeması.
    class AffinityOverviewAttributesItem < Pushizo::BaseModel
      # Zorunlu.
      field "attribute", :attribute, :string
      # Zorunlu.
      field "values", :values, [:array, "AffinityOverviewAttributesItemValuesItem"]
    end

    # AffinityOverviewAttributesItemValuesItem şeması.
    class AffinityOverviewAttributesItemValuesItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "top_users", :top_users, :integer
    end

    # AiAgent şeması.
    class AiAgent < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "whatsapp", "sms", "rcs", "telegram", "viber", "chat".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "instructions", :instructions, :string
      # Zorunlu.
      field "faq", :faq, [:array, "AiAgentFaqItem"]
      # Zorunlu.
      field "tools", :tools, [:array, "AiAgentToolsItem"]
      # Zorunlu.
      field "handoff", :handoff, "AiAgentHandoff"
      # Zorunlu.
      field "limits", :limits, "AiAgentLimits"
      # Zorunlu.
      field "ai_sentiment", :ai_sentiment, :boolean
      # Zorunlu.
      field "has_tool_secret", :has_tool_secret, :boolean
      # Zorunlu.
      field "usage", :usage, "AiAgentUsage"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AiAgentFaqItem şeması.
    class AiAgentFaqItem < Pushizo::BaseModel
      # Zorunlu.
      field "question", :question, :string
      # Zorunlu.
      field "answer", :answer, :string
    end

    # AiAgentHandoff şeması.
    class AiAgentHandoff < Pushizo::BaseModel
      # Zorunlu.
      field "keywords", :keywords, [:array, :string]
      # Zorunlu.
      field "max_bot_replies", :max_bot_replies, :integer
      # Zorunlu.
      field "on_negative_sentiment", :on_negative_sentiment, :boolean
      # Zorunlu.
      field "message", :message, :string
    end

    # AiAgentLimits şeması.
    class AiAgentLimits < Pushizo::BaseModel
      # Zorunlu.
      field "monthly_token_cap", :monthly_token_cap, :integer
      # Zorunlu.
      field "max_steps", :max_steps, :integer
    end

    # AiAgentList şeması.
    class AiAgentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AiAgent"]
    end

    # AiAgentMetrics şeması.
    class AiAgentMetrics < Pushizo::BaseModel
      # Zorunlu.
      field "period_days", :period_days, :integer
      # Zorunlu.
      field "runs", :runs, :integer
      # Zorunlu.
      field "replied", :replied, :integer
      # Zorunlu.
      field "handed_off", :handed_off, :integer
      # Zorunlu.
      field "skipped_cap", :skipped_cap, :integer
      # Zorunlu.
      field "failed", :failed, :integer
      # Zorunlu.
      field "conversations", :conversations, :integer
      # Zorunlu.
      field "resolution_rate", :resolution_rate, :number
      # Zorunlu.
      field "avg_steps", :avg_steps, :number
      # Zorunlu.
      field "tool_calls", :tool_calls, :integer
      # Zorunlu.
      field "tool_error_rate", :tool_error_rate, :number
      # Zorunlu.
      field "tokens", :tokens, :integer
      # Zorunlu.
      field "handoff_reasons", :handoff_reasons, [:map, :integer]
    end

    # AiAgentRunList şeması.
    class AiAgentRunList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AiAgentRunListDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # AiAgentRunListDataItem şeması.
    class AiAgentRunListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "agent_id", :agent_id, :string
      # Zorunlu.
      field "conversation_id", :conversation_id, :string
      # Zorunlu. Değerler: "pending", "replied", "handed_off", "skipped_cap", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "steps", :steps, [:array, "AiAgentRunListDataItemStepsItem"]
      # Zorunlu.
      field "input_tokens", :input_tokens, :integer
      # Zorunlu.
      field "output_tokens", :output_tokens, :integer
      # Zorunlu.
      field "handoff_reason", :handoff_reason, :string
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "finished_at", :finished_at, :string
    end

    # AiAgentRunListDataItemStepsItem şeması.
    class AiAgentRunListDataItemStepsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "reply", "tool", "handoff".
      field "kind", :kind, :string
      field "tool", :tool, :string
      field "status", :status, :integer
      field "ok", :ok, :boolean
      field "duration_ms", :duration_ms, :integer
    end

    # AiAgentToolsItem şeması.
    class AiAgentToolsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "params", :params, [:array, "AiAgentToolsItemParamsItem"]
    end

    # AiAgentToolsItemParamsItem şeması.
    class AiAgentToolsItemParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "required", :required, :boolean
    end

    # AiAgentUsage şeması.
    class AiAgentUsage < Pushizo::BaseModel
      # Zorunlu.
      field "tokens_this_month", :tokens_this_month, :integer
      # Zorunlu.
      field "period_start", :period_start, :string
    end

    # AiAgentWithSecret şeması.
    class AiAgentWithSecret < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "whatsapp", "sms", "rcs", "telegram", "viber", "chat".
      field "channels", :channels, [:array, :string]
      # Zorunlu.
      field "instructions", :instructions, :string
      # Zorunlu.
      field "faq", :faq, [:array, "AiAgentWithSecretFaqItem"]
      # Zorunlu.
      field "tools", :tools, [:array, "AiAgentWithSecretToolsItem"]
      # Zorunlu.
      field "handoff", :handoff, "AiAgentWithSecretHandoff"
      # Zorunlu.
      field "limits", :limits, "AiAgentWithSecretLimits"
      # Zorunlu.
      field "ai_sentiment", :ai_sentiment, :boolean
      # Zorunlu.
      field "has_tool_secret", :has_tool_secret, :boolean
      # Zorunlu.
      field "usage", :usage, "AiAgentWithSecretUsage"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "tool_secret", :tool_secret, :string
    end

    # AiAgentWithSecretFaqItem şeması.
    class AiAgentWithSecretFaqItem < Pushizo::BaseModel
      # Zorunlu.
      field "question", :question, :string
      # Zorunlu.
      field "answer", :answer, :string
    end

    # AiAgentWithSecretHandoff şeması.
    class AiAgentWithSecretHandoff < Pushizo::BaseModel
      # Zorunlu.
      field "keywords", :keywords, [:array, :string]
      # Zorunlu.
      field "max_bot_replies", :max_bot_replies, :integer
      # Zorunlu.
      field "on_negative_sentiment", :on_negative_sentiment, :boolean
      # Zorunlu.
      field "message", :message, :string
    end

    # AiAgentWithSecretLimits şeması.
    class AiAgentWithSecretLimits < Pushizo::BaseModel
      # Zorunlu.
      field "monthly_token_cap", :monthly_token_cap, :integer
      # Zorunlu.
      field "max_steps", :max_steps, :integer
    end

    # AiAgentWithSecretToolsItem şeması.
    class AiAgentWithSecretToolsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "params", :params, [:array, "AiAgentWithSecretToolsItemParamsItem"]
    end

    # AiAgentWithSecretToolsItemParamsItem şeması.
    class AiAgentWithSecretToolsItemParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "required", :required, :boolean
    end

    # AiAgentWithSecretUsage şeması.
    class AiAgentWithSecretUsage < Pushizo::BaseModel
      # Zorunlu.
      field "tokens_this_month", :tokens_this_month, :integer
      # Zorunlu.
      field "period_start", :period_start, :string
    end

    # AndroidDeliveryReport şeması.
    class AndroidDeliveryReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "devices", :devices, "AndroidDeliveryReportDevices"
      # Zorunlu.
      field "totals", :totals, "AndroidDeliveryReportTotals"
      # Zorunlu.
      field "previous", :previous, "AndroidDeliveryReportPrevious"
      # Zorunlu.
      field "deprioritized", :deprioritized, :integer
      # Zorunlu.
      field "aggressive", :aggressive, "AndroidDeliveryReportAggressive"
      # Zorunlu.
      field "others", :others, "AndroidDeliveryReportOthers"
      # Zorunlu.
      field "vendors", :vendors, [:array, "AndroidDeliveryReportVendorsItem"]
      # Zorunlu.
      field "roms", :roms, [:array, "AndroidDeliveryReportRomsItem"]
      # Zorunlu. Değerler: "upgrade_sdk", "vendor_guidance", "background_restricted", "battery_exemption", "deprioritized", "notifications_blocked".
      field "recommendations", :recommendations, [:array, :string]
    end

    # AndroidDeliveryReportAggressive şeması.
    class AndroidDeliveryReportAggressive < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
    end

    # AndroidDeliveryReportDevices şeması.
    class AndroidDeliveryReportDevices < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "reporting", :reporting, :integer
      # Zorunlu.
      field "reporting_rate", :reporting_rate, :number
      # Zorunlu.
      field "restricted", :restricted, :integer
      # Zorunlu.
      field "restricted_rate", :restricted_rate, :number
      # Zorunlu.
      field "background_restricted", :background_restricted, :integer
      # Zorunlu.
      field "battery_optimized", :battery_optimized, :integer
      # Zorunlu.
      field "low_standby_bucket", :low_standby_bucket, :integer
      # Zorunlu.
      field "power_save", :power_save, :integer
      # Zorunlu.
      field "data_saver", :data_saver, :integer
      # Zorunlu.
      field "channel_blocked", :channel_blocked, :integer
      # Zorunlu.
      field "notifications_blocked", :notifications_blocked, :integer
      # Zorunlu.
      field "aggressive_vendor", :aggressive_vendor, :integer
      # Zorunlu.
      field "aggressive_vendor_rate", :aggressive_vendor_rate, :number
    end

    # AndroidDeliveryReportOthers şeması.
    class AndroidDeliveryReportOthers < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
    end

    # AndroidDeliveryReportPrevious şeması.
    class AndroidDeliveryReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "median_delay_seconds", :median_delay_seconds, :integer
      # Zorunlu.
      field "p90_delay_seconds", :p90_delay_seconds, :integer
    end

    # AndroidDeliveryReportRomsItem şeması.
    class AndroidDeliveryReportRomsItem < Pushizo::BaseModel
      # Zorunlu.
      field "rom", :rom, :string
      # Zorunlu.
      field "devices", :devices, :integer
      # Zorunlu.
      field "restricted", :restricted, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "median_delay_seconds", :median_delay_seconds, :integer
    end

    # AndroidDeliveryReportTotals şeması.
    class AndroidDeliveryReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "median_delay_seconds", :median_delay_seconds, :integer
      # Zorunlu.
      field "p90_delay_seconds", :p90_delay_seconds, :integer
    end

    # AndroidDeliveryReportVendorsItem şeması.
    class AndroidDeliveryReportVendorsItem < Pushizo::BaseModel
      # Zorunlu.
      field "vendor", :vendor, :string
      # Zorunlu.
      field "aggressive", :aggressive, :boolean
      # Zorunlu.
      field "devices", :devices, :integer
      # Zorunlu.
      field "reporting", :reporting, :integer
      # Zorunlu.
      field "restricted", :restricted, :integer
      # Zorunlu.
      field "battery_optimized", :battery_optimized, :integer
      # Zorunlu.
      field "sent", :sent, :integer
      # Zorunlu.
      field "delivered", :delivered, :integer
      # Zorunlu.
      field "opened", :opened, :integer
      # Zorunlu.
      field "delivery_rate", :delivery_rate, :number
      # Zorunlu.
      field "open_rate", :open_rate, :number
      # Zorunlu.
      field "median_delay_seconds", :median_delay_seconds, :integer
      # Zorunlu.
      field "p90_delay_seconds", :p90_delay_seconds, :integer
      # Zorunlu.
      field "deprioritized", :deprioritized, :integer
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

    # AppFlag şeması.
    class AppFlag < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "boolean", "string", "number", "json".
      field "value_type", :value_type, :string
      # Zorunlu.
      field "on_value", :on_value, :any
      # Zorunlu.
      field "off_value", :off_value, :any
      # Zorunlu.
      field "rollout_percent", :rollout_percent, :integer
      # Zorunlu.
      field "segment_id", :segment_id, :string
      # Zorunlu.
      field "rollout_schedule", :rollout_schedule, [:array, "AppFlagRolloutScheduleItem"]
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # AppFlagEvaluation şeması.
    class AppFlagEvaluation < Pushizo::BaseModel
      # Zorunlu.
      field "flags", :flags, [:map, "AppFlagEvaluationFlagsValue"]
    end

    # AppFlagEvaluationFlagsValue şeması.
    class AppFlagEvaluationFlagsValue < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "value", :value, :any
      # Zorunlu. Değerler: "on", "disabled", "segment", "rollout".
      field "reason", :reason, :string
    end

    # AppFlagList şeması.
    class AppFlagList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "AppFlag"]
    end

    # AppFlagRolloutScheduleItem şeması.
    class AppFlagRolloutScheduleItem < Pushizo::BaseModel
      # Zorunlu.
      field "at", :at, :string
      # Zorunlu.
      field "percent", :percent, :integer
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
      field "brandKit", :brand_kit, "AppSettingsBrandKit"
      field "defaultTtlSeconds", :default_ttl_seconds, :integer
      field "identityVerificationRequired", :identity_verification_required, :boolean
      # Değerler: "off", "full", "masked".
      field "ipCapture", :ip_capture, :string
      field "ipRetentionDays", :ip_retention_days, :integer
      field "adaptiveFrequency", :adaptive_frequency, "AppSettingsAdaptiveFrequency"
      field "allowedOrigins", :allowed_origins, [:array, :string]
      field "campaignApprovalRequired", :campaign_approval_required, :boolean
      field "webPush", :web_push, "AppSettingsWebPush"
      field "onboarding", :onboarding, "AppSettingsOnboarding"
      field "sdkSetup", :sdk_setup, "AppSettingsSdkSetup"
    end

    # AppSettingsAdaptiveFrequency şeması.
    class AppSettingsAdaptiveFrequency < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "min", :min, :integer
      # Zorunlu.
      field "max", :max, :integer
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

    # AppSettingsBrandKit şeması.
    class AppSettingsBrandKit < Pushizo::BaseModel
      field "website_url", :website_url, :string
      field "name", :name, :string
      field "primary_color", :primary_color, :string
      field "accent_color", :accent_color, :string
      field "font", :font, :string
      field "logo_url", :logo_url, :string
      field "tone", :tone, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "ios", "android", "huawei", "web", "amazon", "windows", "email", "sms".
      field "platforms", :platforms, [:array, :string]
      # Değerler: "native", "flutter", "react-native", "expo", "kmp", "unity", "capacitor", "cordova", "maui".
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

    # BatchMembersDto şeması.
    class BatchMembersDto < Pushizo::BaseModel
      # Zorunlu.
      field "members", :members, [:array, "BatchMembersDtoMembersItem"]
    end

    # BatchMembersDtoMembersItem şeması.
    class BatchMembersDtoMembersItem < Pushizo::BaseModel
      field "user_id", :user_id, :string
      field "external_id", :external_id, :string
      field "role", :role, :string
    end

    # BatchUpsertCompaniesDto şeması.
    class BatchUpsertCompaniesDto < Pushizo::BaseModel
      # Zorunlu.
      field "companies", :companies, [:array, "UpsertCompanyDto"]
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
      field "goals", :goals, "CampaignGoals"
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
      # Zorunlu.
      field "preflight", :preflight, "CampaignPreflight"
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
      # Değerler: "low", "normal", "high".
      field "frequency_priority", :frequency_priority, :string
      field "global_control_exempt", :global_control_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # CampaignEmailRisk şeması.
    class CampaignEmailRisk < Pushizo::BaseModel
      # Zorunlu.
      field "applies", :applies, :boolean
      # Zorunlu.
      field "recipients", :recipients, :integer
      # Zorunlu.
      field "flagged_invalid", :flagged_invalid, :integer
      # Zorunlu.
      field "sendable", :sendable, :integer
      # Zorunlu.
      field "valid", :valid, :integer
      # Zorunlu.
      field "unknown", :unknown, :integer
      # Zorunlu.
      field "unchecked", :unchecked, :integer
      # Zorunlu.
      field "estimated_invalid_ratio", :estimated_invalid_ratio, :number
      # Zorunlu.
      field "max_invalid_ratio", :max_invalid_ratio, :number
      # Zorunlu.
      field "blocked", :blocked, :boolean
      # Zorunlu.
      field "bounce_rate_7d", :bounce_rate_7d, :number
      # Zorunlu.
      field "bounce_rate_30d", :bounce_rate_30d, :number
    end

    # CampaignGoals şeması.
    class CampaignGoals < Pushizo::BaseModel
      field "primary", :primary, :string
      field "secondary", :secondary, [:array, :string]
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

    # CampaignPreflight şeması.
    class CampaignPreflight < Pushizo::BaseModel
      # Zorunlu.
      field "checked_at", :checked_at, :string
      # Zorunlu.
      field "summary", :summary, "CampaignPreflightSummary"
      # Zorunlu.
      field "codes", :codes, [:array, :string]
      field "acknowledged_by", :acknowledged_by, :string
      field "acknowledged_at", :acknowledged_at, :string
    end

    # CampaignPreflightReport şeması.
    class CampaignPreflightReport < Pushizo::BaseModel
      # Zorunlu.
      field "campaign_id", :campaign_id, :string
      # Zorunlu.
      field "checked_at", :checked_at, :string
      # Zorunlu.
      field "links_checked", :links_checked, :boolean
      # Zorunlu.
      field "summary", :summary, "CampaignPreflightReportSummary"
      # Zorunlu.
      field "findings", :findings, [:array, "CampaignPreflightReportFindingsItem"]
    end

    # CampaignPreflightReportFindingsItem şeması.
    class CampaignPreflightReportFindingsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "brand_name_casing", "off_brand_color", "off_brand_font", "banned_phrase", "phishing_term", "link_invalid", "link_insecure_http", "link_unsafe_host", "link_shortener", "link_missing_utm", "link_broken", "link_unreachable", "liquid_syntax_error", "liquid_missing_default", "liquid_unknown_variable", "liquid_undefined_property", "commercial_no_category", "iys_sms_filter_informational", "sms_missing_opt_out", "email_missing_postal_address", "send_time_outside_hours".
      field "code", :code, :string
      # Zorunlu. Değerler: "brand", "content", "links", "personalization", "compliance".
      field "category", :category, :string
      # Zorunlu. Değerler: "critical", "warning", "info".
      field "severity", :severity, :string
      field "field", :field, :string
      field "params", :params, [:map, :any]
    end

    # CampaignPreflightReportSummary şeması.
    class CampaignPreflightReportSummary < Pushizo::BaseModel
      # Zorunlu.
      field "critical", :critical, :integer
      # Zorunlu.
      field "warning", :warning, :integer
      # Zorunlu.
      field "info", :info, :integer
      # Zorunlu.
      field "blocked", :blocked, :boolean
    end

    # CampaignPreflightSummary şeması.
    class CampaignPreflightSummary < Pushizo::BaseModel
      # Zorunlu.
      field "critical", :critical, :integer
      # Zorunlu.
      field "warning", :warning, :integer
      # Zorunlu.
      field "info", :info, :integer
      # Zorunlu.
      field "blocked", :blocked, :boolean
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
      # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
      field "goals", :goals, "CampaignsCreateBodyGoals"
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "low", "normal", "high".
      field "frequency_priority", :frequency_priority, :string
      field "global_control_exempt", :global_control_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
    class CampaignsCreateBodyGoals < Pushizo::BaseModel
      field "primary", :primary, :string
      field "secondary", :secondary, [:array, :string]
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
      field "goals", :goals, [:array, "CampaignStatsGoalsItem"]
      # Zorunlu.
      field "cards", :cards, "CampaignStatsCards"
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

    # CampaignStatsCards şeması.
    class CampaignStatsCards < Pushizo::BaseModel
      # Zorunlu.
      field "created", :created, :integer
      # Zorunlu.
      field "viewed", :viewed, :integer
      # Zorunlu.
      field "clicked", :clicked, :integer
      # Zorunlu.
      field "dismissed", :dismissed, :integer
      # Zorunlu.
      field "view_rate", :view_rate, :number
      # Zorunlu.
      field "click_rate", :click_rate, :number
    end

    # CampaignStatsChannelsItem şeması.
    class CampaignStatsChannelsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # CampaignStatsGoalsItem şeması.
    class CampaignStatsGoalsItem < Pushizo::BaseModel
      # Zorunlu.
      field "event", :event, :string
      # Zorunlu.
      field "primary", :primary, :boolean
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
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
      # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
      field "goals", :goals, "CampaignsUpdateBodyGoals"
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "low", "normal", "high".
      field "frequency_priority", :frequency_priority, :string
      field "global_control_exempt", :global_control_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
    class CampaignsUpdateBodyGoals < Pushizo::BaseModel
      field "primary", :primary, :string
      field "secondary", :secondary, [:array, :string]
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
      # Zorunlu.
      field "goals", :goals, [:array, "CampaignVariantStatsVariantsItemGoalsItem"]
    end

    # CampaignVariantStatsVariantsItemGoalsItem şeması.
    class CampaignVariantStatsVariantsItemGoalsItem < Pushizo::BaseModel
      # Zorunlu.
      field "event", :event, :string
      # Zorunlu.
      field "primary", :primary, :boolean
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # CannedInputDto şeması.
    class CannedInputDto < Pushizo::BaseModel
      # Zorunlu.
      field "shortcut", :shortcut, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "body", :body, :string
      field "language", :language, :string
    end

    # CannedResponse şeması.
    class CannedResponse < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "shortcut", :shortcut, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "body", :body, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CannedResponseList şeması.
    class CannedResponseList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "CannedResponse"]
    end

    # CannedUpdateDto şeması.
    class CannedUpdateDto < Pushizo::BaseModel
      field "shortcut", :shortcut, :string
      field "title", :title, :string
      field "body", :body, :string
      field "language", :language, :string
    end

    # Catalog şeması.
    class Catalog < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "item_count", :item_count, :integer
      # Zorunlu.
      field "liquid", :liquid, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CatalogItem şeması.
    class CatalogItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "image_url", :image_url, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "price", :price, :number
      # Zorunlu.
      field "sale_price", :sale_price, :number
      # Zorunlu.
      field "currency", :currency, :string
      # Zorunlu.
      field "category", :category, :string
      # Zorunlu.
      field "brand", :brand, :string
      # Zorunlu.
      field "in_stock", :in_stock, :boolean
      # Zorunlu.
      field "attributes", :attributes_value, [:map, :string]
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CatalogItemsPage şeması.
    class CatalogItemsPage < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "data", :data, [:array, "CatalogItem"]
    end

    # CatalogList şeması.
    class CatalogList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Catalog"]
    end

    # CatalogUpsertResult şeması.
    class CatalogUpsertResult < Pushizo::BaseModel
      # Zorunlu.
      field "catalog", :catalog, "Catalog"
      # Zorunlu.
      field "upserted", :upserted, :integer
    end

    # ChannelConfig şeması.
    class ChannelConfig < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "hms", "adm", "wns", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "meta_whatsapp", "google_rbm", "telegram_bot", "viber_bot", "mock".
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
      field "verify_service_sid", :verify_service_sid, :string
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
      field "telegram_bot_username", :telegram_bot_username, :string
      field "viber_uri", :viber_uri, :string
      field "viber_sender_name", :viber_sender_name, :string
      field "viber_sender_avatar", :viber_sender_avatar, :string
      field "webhook_registered_at", :webhook_registered_at, :string
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

    # ChannelScoreConfig şeması.
    class ChannelScoreConfig < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu.
      field "min_sends", :min_sends, :integer
      # Zorunlu.
      field "count_email_opens", :count_email_opens, :boolean
      # Zorunlu. Değerler: "idle", "queued", "running", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_users", :scored_users, :integer
    end

    # ChannelScoreOverview şeması.
    class ChannelScoreOverview < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "low_population", :low_population, :boolean
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "channels", :channels, [:array, "ChannelScoreOverviewChannelsItem"]
    end

    # ChannelScoreOverviewChannelsItem şeması.
    class ChannelScoreOverviewChannelsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "push", "email", "whatsapp", "rcs", "sms".
      field "channel", :channel, :string
      # Zorunlu.
      field "best_users", :best_users, :integer
      # Zorunlu.
      field "share", :share, :number
      # Zorunlu.
      field "sends", :sends, :integer
      # Zorunlu.
      field "engaged", :engaged, :integer
      # Zorunlu.
      field "engagement_rate", :engagement_rate, :number
    end

    # ChannelScoreUser şeması.
    class ChannelScoreUser < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "push", "email", "whatsapp", "rcs", "sms".
      field "best_channel", :best_channel, :string
      # Zorunlu.
      field "scores", :scores, [:array, "ChannelScoreUserScoresItem"]
    end

    # ChannelScoreUserScoresItem şeması.
    class ChannelScoreUserScoresItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "push", "email", "whatsapp", "rcs", "sms".
      field "channel", :channel, :string
      # Zorunlu.
      field "sends", :sends, :integer
      # Zorunlu.
      field "engaged", :engaged, :integer
      # Zorunlu.
      field "score", :score, :number
    end

    # ChannelScoreUsersPage şeması.
    class ChannelScoreUsersPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ChannelScoreUser"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
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

    # CheckVerifyDto şeması.
    class CheckVerifyDto < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "code", :code, :string
    end

    # Company şeması.
    class Company < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "domain", :domain, :string
      # Zorunlu.
      field "properties", :properties, [:map, :any]
      # Zorunlu.
      field "member_count", :member_count, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CompanyBatchResult şeması.
    class CompanyBatchResult < Pushizo::BaseModel
      # Zorunlu.
      field "created", :created, :integer
      # Zorunlu.
      field "updated", :updated, :integer
      # Zorunlu.
      field "data", :data, [:array, "CompanyBatchResultDataItem"]
    end

    # CompanyBatchResultDataItem şeması.
    class CompanyBatchResultDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "created", :created, :boolean
    end

    # CompanyList şeması.
    class CompanyList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Company"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # CompanyMember şeması.
    class CompanyMember < Pushizo::BaseModel
      # Zorunlu.
      field "company_id", :company_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "role", :role, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CompanyMemberBatchResult şeması.
    class CompanyMemberBatchResult < Pushizo::BaseModel
      # Zorunlu.
      field "added", :added, :integer
      # Zorunlu.
      field "updated", :updated, :integer
      # Zorunlu.
      field "not_found", :not_found, [:array, "CompanyMemberBatchResultNotFoundItem"]
    end

    # CompanyMemberBatchResultNotFoundItem şeması.
    class CompanyMemberBatchResultNotFoundItem < Pushizo::BaseModel
      # Zorunlu.
      field "index", :index, :integer
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
    end

    # CompanyMemberList şeması.
    class CompanyMemberList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "CompanyMember"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
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
      # Zorunlu. Değerler: "sms", "whatsapp", "rcs", "telegram", "viber", "email", "chat".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "open", "pending", "resolved", "closed".
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
      # Zorunlu.
      field "assignee_id", :assignee_id, :string
      # Zorunlu.
      field "team_id", :team_id, :string
      # Zorunlu.
      field "assigned_at", :assigned_at, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "bot_active", :bot_active, :boolean
      # Zorunlu.
      field "last_seq", :last_seq, :integer
      # Zorunlu.
      field "visitor_last_read_seq", :visitor_last_read_seq, :integer
      # Zorunlu.
      field "visitor_last_delivered_seq", :visitor_last_delivered_seq, :integer
      # Zorunlu.
      field "agent_last_read_seq", :agent_last_read_seq, :integer
      # Zorunlu.
      field "waiting_since", :waiting_since, :string
      # Zorunlu.
      field "first_response_at", :first_response_at, :string
      # Zorunlu.
      field "sla_due_at", :sla_due_at, :string
      # Zorunlu.
      field "resolved_at", :resolved_at, :string
      # Zorunlu.
      field "visitor", :visitor, "ConversationVisitor"
    end

    # ConversationActivity şeması.
    class ConversationActivity < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ConversationActivityDataItem"]
    end

    # ConversationActivityDataItem şeması.
    class ConversationActivityDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "actor_type", :actor_type, :string
      # Zorunlu.
      field "actor_id", :actor_id, :string
      # Zorunlu.
      field "data", :data, [:map, :any]
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # ConversationAssignDto şeması.
    class ConversationAssignDto < Pushizo::BaseModel
      field "assignee_id", :assignee_id, :string
      field "team_id", :team_id, :string
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
      # Zorunlu.
      field "seq", :seq, :integer
      # Zorunlu.
      field "sender_type", :sender_type, :string
      # Zorunlu.
      field "client_message_id", :client_message_id, :string
      # Zorunlu.
      field "attachments", :attachments, [:array, "ConversationMessagePageDataItemAttachmentsItem"]
      # Zorunlu.
      field "quick_replies", :quick_replies, [:array, "ConversationMessagePageDataItemQuickRepliesItem"]
    end

    # ConversationMessagePageDataItemAttachmentsItem şeması.
    class ConversationMessagePageDataItemAttachmentsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "size", :size, :integer
    end

    # ConversationMessagePageDataItemQuickRepliesItem şeması.
    class ConversationMessagePageDataItemQuickRepliesItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "label", :label, :string
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
      field "client_message_id", :client_message_id, :string
      # Değerler: "manual", "canned", "ai_suggestion".
      field "source", :source, :string
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
      # Zorunlu.
      field "seq", :seq, :integer
      # Zorunlu.
      field "sender_type", :sender_type, :string
      # Zorunlu.
      field "client_message_id", :client_message_id, :string
      # Zorunlu.
      field "attachments", :attachments, [:array, "ConversationReplyResultConversationMessageAttachmentsItem"]
      # Zorunlu.
      field "quick_replies", :quick_replies, [:array, "ConversationReplyResultConversationMessageQuickRepliesItem"]
    end

    # ConversationReplyResultConversationMessageAttachmentsItem şeması.
    class ConversationReplyResultConversationMessageAttachmentsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "type", :type, :string
      # Zorunlu.
      field "size", :size, :integer
    end

    # ConversationReplyResultConversationMessageQuickRepliesItem şeması.
    class ConversationReplyResultConversationMessageQuickRepliesItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "label", :label, :string
    end

    # ConversationTagsDto şeması.
    class ConversationTagsDto < Pushizo::BaseModel
      field "add", :add, [:map, :string]
      field "remove", :remove, [:array, :string]
    end

    # ConversationTagsResult şeması.
    class ConversationTagsResult < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "tags", :tags, [:map, :any]
    end

    # ConversationUpdateDto şeması.
    class ConversationUpdateDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "open", "pending", "resolved", "closed".
      field "status", :status, :string
    end

    # ConversationVisitor şeması.
    class ConversationVisitor < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "email", :email, :string
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

    # CreateAdAudienceDto şeması.
    class CreateAdAudienceDto < Pushizo::BaseModel
      # Zorunlu.
      field "ad_account_id", :ad_account_id, :string
      # Zorunlu. Değerler: "segment", "journey".
      field "source", :source, :string
      field "segment_id", :segment_id, :string
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Değerler: "email", "phone", "maid".
      field "identifiers", :identifiers, [:array, :string]
      field "sync_interval_minutes", :sync_interval_minutes, :integer
    end

    # CreateAiAgentDto şeması.
    class CreateAiAgentDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "enabled", :enabled, :boolean
      # Değerler: "whatsapp", "sms", "rcs", "telegram", "viber", "chat".
      field "channels", :channels, [:array, :string]
      field "instructions", :instructions, :string
      field "faq", :faq, [:array, "CreateAiAgentDtoFaqItem"]
      field "tools", :tools, [:array, "CreateAiAgentDtoToolsItem"]
      field "handoff", :handoff, "CreateAiAgentDtoHandoff"
      field "limits", :limits, "CreateAiAgentDtoLimits"
      field "ai_sentiment", :ai_sentiment, :boolean
    end

    # CreateAiAgentDtoFaqItem şeması.
    class CreateAiAgentDtoFaqItem < Pushizo::BaseModel
      # Zorunlu.
      field "question", :question, :string
      # Zorunlu.
      field "answer", :answer, :string
    end

    # CreateAiAgentDtoHandoff şeması.
    class CreateAiAgentDtoHandoff < Pushizo::BaseModel
      field "keywords", :keywords, [:array, :string]
      field "max_bot_replies", :max_bot_replies, :integer
      field "on_negative_sentiment", :on_negative_sentiment, :boolean
      field "message", :message, :string
    end

    # CreateAiAgentDtoLimits şeması.
    class CreateAiAgentDtoLimits < Pushizo::BaseModel
      field "monthly_token_cap", :monthly_token_cap, :integer
      field "max_steps", :max_steps, :integer
    end

    # CreateAiAgentDtoToolsItem şeması.
    class CreateAiAgentDtoToolsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "url", :url, :string
      field "params", :params, [:array, "CreateAiAgentDtoToolsItemParamsItem"]
    end

    # CreateAiAgentDtoToolsItemParamsItem şeması.
    class CreateAiAgentDtoToolsItemParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "required", :required, :boolean
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

    # CreateAppFlagDto şeması.
    class CreateAppFlagDto < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      # Değerler: "boolean", "string", "number", "json".
      field "value_type", :value_type, :string
      field "on_value", :on_value, :any
      field "off_value", :off_value, :any
      field "rollout_percent", :rollout_percent, :integer
      field "segment_id", :segment_id, :string
      field "rollout_schedule", :rollout_schedule, [:array, "CreateAppFlagDtoRolloutScheduleItem"]
    end

    # CreateAppFlagDtoRolloutScheduleItem şeması.
    class CreateAppFlagDtoRolloutScheduleItem < Pushizo::BaseModel
      # Zorunlu.
      field "at", :at, :string
      # Zorunlu.
      field "percent", :percent, :integer
    end

    # CreateBudgetAlertRuleDto şeması.
    class CreateBudgetAlertRuleDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "daily_spend", "roas_drop", "budget_depletion".
      field "kind", :kind, :string
      field "ad_account_id", :ad_account_id, :string
      field "campaign_external_id", :campaign_external_id, :string
      # Zorunlu.
      field "threshold", :threshold, :number
      field "window_days", :window_days, :integer
      field "recipients", :recipients, [:array, :string]
      field "enabled", :enabled, :boolean
    end

    # CreateCatalogDto şeması.
    class CreateCatalogDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "currency", :currency, :string
    end

    # CreateCategoryDto şeması.
    class CreateCategoryDto < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # CreateCustomAgentDto şeması.
    class CreateCustomAgentDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      field "instructions", :instructions, :string
      # Değerler: "list_segments", "campaign_performance", "delivery_summary", "create_segment_draft", "create_campaign_draft".
      field "tools", :tools, [:array, :string]
      field "schedule", :schedule, "CreateCustomAgentDtoSchedule"
      field "limits", :limits, "CreateCustomAgentDtoLimits"
    end

    # CreateCustomAgentDtoLimits şeması.
    class CreateCustomAgentDtoLimits < Pushizo::BaseModel
      field "max_steps", :max_steps, :integer
      field "monthly_token_cap", :monthly_token_cap, :integer
    end

    # CreateCustomAgentDtoSchedule şeması.
    class CreateCustomAgentDtoSchedule < Pushizo::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "timezone", :timezone, :string
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

    # CreateDataSourceDto şeması.
    class CreateDataSourceDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "enabled", :enabled, :boolean
      # Değerler: "signature", "token".
      field "auth_mode", :auth_mode, :string
      field "mapping", :mapping, "CreateDataSourceDtoMapping"
      field "config", :config, "CreateDataSourceDtoConfig"
      field "auth_value", :auth_value, :string
      # Zorunlu. Değerler: "webhook", "http_pull".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
    end

    # CreateDataSourceDtoConfig şeması.
    class CreateDataSourceDtoConfig < Pushizo::BaseModel
      field "url", :url, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "headers", :headers, [:map, :string]
      field "body", :body, :string
      field "interval_minutes", :interval_minutes, :integer
      field "auth_header", :auth_header, :string
      field "next_cursor_path", :next_cursor_path, :string
      field "cursor_param", :cursor_param, :string
      field "resume_cursor", :resume_cursor, :boolean
    end

    # CreateDataSourceDtoMapping şeması.
    class CreateDataSourceDtoMapping < Pushizo::BaseModel
      field "records_path", :records_path, :string
      field "event_name", :event_name, :string
      field "event_name_path", :event_name_path, :string
      field "external_id_path", :external_id_path, :string
      field "occurred_at_path", :occurred_at_path, :string
      field "value_path", :value_path, :string
      field "event_id_path", :event_id_path, :string
      field "properties_path", :properties_path, :string
      field "tags_path", :tags_path, :string
    end

    # CreateDataTransformDto şeması.
    class CreateDataTransformDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Zorunlu. Değerler: "rules", "javascript".
      field "kind", :kind, :string
      field "position", :position, :integer
      field "rules", :rules, [:array, :any]
      field "code", :code, :string
      # Değerler: "sdk", "api", "import", "system", "webhook_source", "pull_source".
      field "sources", :sources, [:array, :string]
      field "event_names", :event_names, [:array, :string]
    end

    # CreateDecisionAgentDto şeması.
    class CreateDecisionAgentDto < Pushizo::BaseModel
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "arms", :arms, [:array, "CreateDecisionAgentDtoArmsItem"]
      # Zorunlu.
      field "reward_events", :reward_events, [:array, :string]
      field "reward_window_hours", :reward_window_hours, :integer
      field "holdout_percent", :holdout_percent, :integer
      field "context_prediction", :context_prediction, :string
      field "use_best_channel", :use_best_channel, :boolean
    end

    # CreateDecisionAgentDtoArmsItem şeması.
    class CreateDecisionAgentDtoArmsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "label", :label, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channel", :channel, :string
      field "segment_id", :segment_id, :string
    end

    # CreateFormDto şeması.
    class CreateFormDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "fields", :fields_value, [:array, "CreateFormDtoFieldsItem"]
      field "settings", :settings, "CreateFormDtoSettings"
      # Değerler: "active", "archived".
      field "status", :status, :string
    end

    # CreateFormDtoFieldsItem şeması.
    class CreateFormDtoFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "email", "phone", "first_name", "last_name", "full_name", "text", "textarea", "select", "radio", "checkbox", "consent".
      field "type", :type, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "CreateFormDtoFieldsItemOptionsItem"]
      field "maps_to", :maps_to, :string
      field "max_length", :max_length, :integer
      field "policy_url", :policy_url, :string
    end

    # CreateFormDtoFieldsItemOptionsItem şeması.
    class CreateFormDtoFieldsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # CreateFormDtoSettings şeması.
    class CreateFormDtoSettings < Pushizo::BaseModel
      field "submit_label", :submit_label, [:map, :string]
      field "success_message", :success_message, [:map, :string]
      field "redirect_url", :redirect_url, :string
      field "tags", :tags, [:map, :string]
      field "subscribe", :subscribe, "CreateFormDtoSettingsSubscribe"
      field "double_opt_in", :double_opt_in, "CreateFormDtoSettingsDoubleOptIn"
      field "event_name", :event_name, :string
      field "captcha", :captcha, :boolean
      field "default_language", :default_language, :string
    end

    # CreateFormDtoSettingsDoubleOptIn şeması.
    class CreateFormDtoSettingsDoubleOptIn < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "subject", :subject, [:map, :string]
      field "body", :body, [:map, :string]
    end

    # CreateFormDtoSettingsSubscribe şeması.
    class CreateFormDtoSettingsSubscribe < Pushizo::BaseModel
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # CreateGeofenceDto şeması.
    class CreateGeofenceDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "lat", :lat, :number
      # Zorunlu.
      field "lng", :lng, :number
      # Zorunlu.
      field "radius_m", :radius_m, :integer
      field "cooldown_minutes", :cooldown_minutes, :integer
      field "enabled", :enabled, :boolean
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
      field "placement", :placement, :string
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
      field "global_control_exempt", :global_control_exempt, :boolean
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
      # Değerler: "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # CreateLandingPageDto şeması.
    class CreateLandingPageDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "document", :document, "CreateLandingPageDtoDocument"
      field "seo", :seo, "CreateLandingPageDtoSeo"
      field "settings", :settings, "CreateLandingPageDtoSettings"
      field "custom_domain_id", :custom_domain_id, :string
    end

    # CreateLandingPageDtoDocument şeması.
    class CreateLandingPageDtoDocument < Pushizo::BaseModel
      # Zorunlu. Değerler: 1.
      field "version", :version, :number
      # Zorunlu.
      field "settings", :settings, "CreateLandingPageDtoDocumentSettings"
      # Zorunlu.
      field "sections", :sections, [:array, "CreateLandingPageDtoDocumentSectionsItem"]
    end

    # CreateLandingPageDtoDocumentSectionsItem şeması.
    class CreateLandingPageDtoDocumentSectionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "section".
      field "type", :type, :string
      field "background_color", :background_color, :string
      field "background_image", :background_image, :string
      field "padding", :padding, "CreateLandingPageDtoDocumentSectionsItemPadding"
      field "stack_on_mobile", :stack_on_mobile, :boolean
      # Zorunlu.
      field "columns", :columns, [:array, "CreateLandingPageDtoDocumentSectionsItemColumnsItem"]
    end

    # CreateLandingPageDtoDocumentSectionsItemColumnsItem şeması.
    class CreateLandingPageDtoDocumentSectionsItemColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      field "width_percent", :width_percent, :integer
      field "background_color", :background_color, :string
      # Değerler: "top", "middle", "bottom".
      field "vertical_align", :vertical_align, :string
      field "padding", :padding, "CreateLandingPageDtoDocumentSectionsItemColumnsItemPadding"
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # CreateLandingPageDtoDocumentSectionsItemColumnsItemPadding şeması.
    class CreateLandingPageDtoDocumentSectionsItemColumnsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # CreateLandingPageDtoDocumentSectionsItemPadding şeması.
    class CreateLandingPageDtoDocumentSectionsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # CreateLandingPageDtoDocumentSettings şeması.
    class CreateLandingPageDtoDocumentSettings < Pushizo::BaseModel
      field "width", :width, :integer
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
      # Değerler: "system", "arial", "georgia", "verdana", "trebuchet", "courier".
      field "font_family", :font_family, :string
      field "dark_mode", :dark_mode, "CreateLandingPageDtoDocumentSettingsDarkMode"
    end

    # CreateLandingPageDtoDocumentSettingsDarkMode şeması.
    class CreateLandingPageDtoDocumentSettingsDarkMode < Pushizo::BaseModel
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
    end

    # CreateLandingPageDtoSeo şeması.
    class CreateLandingPageDtoSeo < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "og_image", :og_image, :string
      field "canonical_url", :canonical_url, :string
      field "noindex", :noindex, :boolean
    end

    # CreateLandingPageDtoSettings şeması.
    class CreateLandingPageDtoSettings < Pushizo::BaseModel
      field "language", :language, :string
      field "form_id", :form_id, :string
      field "form_section_id", :form_section_id, :string
      field "cookie_consent", :cookie_consent, "CreateLandingPageDtoSettingsCookieConsent"
      field "web_sdk", :web_sdk, :boolean
      field "favicon_url", :favicon_url, :string
    end

    # CreateLandingPageDtoSettingsCookieConsent şeması.
    class CreateLandingPageDtoSettingsCookieConsent < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "text", :text, :string
      field "accept_label", :accept_label, :string
      field "reject_label", :reject_label, :string
      field "policy_url", :policy_url, :string
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

    # CreateLookalikeDto şeması.
    class CreateLookalikeDto < Pushizo::BaseModel
      field "name", :name, :string
      # Zorunlu.
      field "country", :country, :string
      # Zorunlu.
      field "ratio", :ratio, :number
    end

    # CreateMessengerLinkDto şeması.
    class CreateMessengerLinkDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "telegram", "viber".
      field "channel", :channel, :string
      field "user_id", :user_id, :string
      field "external_id", :external_id, :string
      field "ttl_seconds", :ttl_seconds, :integer
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
      field "ios_carousel", :ios_carousel, [:array, "CreateNotificationDtoIosCarouselItem"]
      field "android_live_update", :android_live_update, "CreateNotificationDtoAndroidLiveUpdate"
      field "voip", :voip, :boolean
      field "app_clip", :app_clip, :boolean
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
      field "messenger_image_url", :messenger_image_url, :string
      field "messenger_buttons", :messenger_buttons, [:array, :any]
      field "add_to_inbox", :add_to_inbox, :boolean
      field "inbox_ttl", :inbox_ttl, :integer
      field "content_card", :content_card, "CreateNotificationDtoContentCard"
      field "frequency_cap_exempt", :frequency_cap_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
      field "throttle_rate_per_minute", :throttle_rate_per_minute, :integer
      field "include_unsubscribed", :include_unsubscribed, :boolean
      field "name", :name, :string
      field "labels", :labels, [:array, :string]
      field "category", :category, :string
      # Değerler: "sms", "email".
      field "fallback_channel", :fallback_channel, :string
      # Değerler: "phone", "watch".
      field "form_factor", :form_factor, :string
    end

    # CreateNotificationDtoAndroidLiveUpdate şeması.
    class CreateNotificationDtoAndroidLiveUpdate < Pushizo::BaseModel
      # Zorunlu.
      field "progress", :progress, :integer
      field "ongoing", :ongoing, :boolean
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

    # CreateNotificationDtoContentCard şeması.
    class CreateNotificationDtoContentCard < Pushizo::BaseModel
      # Zorunlu. Değerler: "classic", "captioned_image", "image_only".
      field "type", :type, :string
      field "pinned", :pinned, :boolean
      field "priority", :priority, :integer
      field "button_text", :button_text, [:map, :string]
    end

    # CreateNotificationDtoIosCarouselItem şeması.
    class CreateNotificationDtoIosCarouselItem < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "title", :title, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # CreatePredictionDto şeması.
    class CreatePredictionDto < Pushizo::BaseModel
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "churn", "event".
      field "kind", :kind, :string
      field "event_names", :event_names, [:array, :string]
      field "horizon_days", :horizon_days, :integer
    end

    # CreatePromoCodeListDto şeması.
    class CreatePromoCodeListDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "expires_at", :expires_at, :string
    end

    # CreateSavedReportDto şeması.
    class CreateSavedReportDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "definition", :definition, "CreateSavedReportDtoDefinition"
    end

    # CreateSavedReportDtoDefinition şeması.
    class CreateSavedReportDtoDefinition < Pushizo::BaseModel
      # Zorunlu. Değerler: "deliveries", "events", "conversions".
      field "source", :source, :string
      # Zorunlu. Değerler: "sent", "delivered", "failed", "opened", "clicked", "delivery_rate", "open_rate", "click_rate", "failure_rate", "count", "unique_users", "value_sum", "value_avg", "conversions", "revenue".
      field "metrics", :metrics, [:array, :string]
      # Değerler: "day", "week", "month", "channel", "provider", "campaign", "status", "name", "source", "event_name", "kind".
      field "dimensions", :dimensions, [:array, :string]
      field "filters", :filters, [:map, [:array, :string]]
      field "sort", :sort, "CreateSavedReportDtoDefinitionSort"
      field "limit", :limit, :integer
      field "days", :days, :integer
      field "from", :from, :string
      field "to", :to, :string
    end

    # CreateSavedReportDtoDefinitionSort şeması.
    class CreateSavedReportDtoDefinitionSort < Pushizo::BaseModel
      # Zorunlu.
      field "by", :by, :string
      # Değerler: "asc", "desc".
      field "direction", :direction, :string
    end

    # CreateSiteSearchSourceDto şeması.
    class CreateSiteSearchSourceDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "sitemap", "urls".
      field "kind", :kind, :string
      field "url", :url, :string
      field "urls", :urls, [:array, :string]
      field "max_pages", :max_pages, :integer
      field "refresh_hours", :refresh_hours, :integer
      field "enabled", :enabled, :boolean
    end

    # CreateSqlSegmentDto şeması.
    class CreateSqlSegmentDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu.
      field "query", :query, :string
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
    end

    # CreateSuppressionDto şeması.
    class CreateSuppressionDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channel", :channel, :string
      # Zorunlu.
      field "value", :value, :string
      # Değerler: "manual", "bounce", "complaint", "unsubscribe_link", "stop".
      field "reason", :reason, :string
      field "expires_at", :expires_at, :string
      field "note", :note, :string
    end

    # CreateSurveyDto şeması.
    class CreateSurveyDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "questions", :questions, [:array, "CreateSurveyDtoQuestionsItem"]
      field "settings", :settings, "CreateSurveyDtoSettings"
    end

    # CreateSurveyDtoQuestionsItem şeması.
    class CreateSurveyDtoQuestionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "nps", "csat", "single_choice", "multiple_choice", "text".
      field "type", :type, :string
      # Zorunlu.
      field "text", :text, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "CreateSurveyDtoQuestionsItemOptionsItem"]
      field "low_label", :low_label, [:map, :string]
      field "high_label", :high_label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
    end

    # CreateSurveyDtoQuestionsItemOptionsItem şeması.
    class CreateSurveyDtoQuestionsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # CreateSurveyDtoSettings şeması.
    class CreateSurveyDtoSettings < Pushizo::BaseModel
      field "thank_you", :thank_you, [:map, :string]
      field "submit_label", :submit_label, [:map, :string]
      field "write_properties", :write_properties, :boolean
      field "allow_multiple", :allow_multiple, :boolean
      field "default_language", :default_language, :string
    end

    # CreateTemplateDto şeması.
    class CreateTemplateDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      field "content_card", :content_card, "CreateTemplateDtoContentContentCard"
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
      field "messenger_image_url", :messenger_image_url, :string
      field "messenger_buttons", :messenger_buttons, [:array, :any]
      field "ios_carousel", :ios_carousel, [:array, "CreateTemplateDtoContentIosCarouselItem"]
      field "android_live_update", :android_live_update, "CreateTemplateDtoContentAndroidLiveUpdate"
      field "voip", :voip, :boolean
      field "app_clip", :app_clip, :boolean
    end

    # CreateTemplateDtoContentAndroidLiveUpdate şeması.
    class CreateTemplateDtoContentAndroidLiveUpdate < Pushizo::BaseModel
      # Zorunlu.
      field "progress", :progress, :integer
      field "ongoing", :ongoing, :boolean
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

    # CreateTemplateDtoContentContentCard şeması.
    class CreateTemplateDtoContentContentCard < Pushizo::BaseModel
      # Zorunlu. Değerler: "classic", "captioned_image", "image_only".
      field "type", :type, :string
      field "pinned", :pinned, :boolean
      field "priority", :priority, :integer
      field "button_text", :button_text, [:map, :string]
    end

    # CreateTemplateDtoContentIosCarouselItem şeması.
    class CreateTemplateDtoContentIosCarouselItem < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "title", :title, :string
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

    # CreateWalletTemplateDto şeması.
    class CreateWalletTemplateDto < Pushizo::BaseModel
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "coupon", "loyalty", "event", "generic".
      field "kind", :kind, :string
      # Zorunlu.
      field "design", :design, "CreateWalletTemplateDtoDesign"
      field "images", :images, [:map, :string]
    end

    # CreateWalletTemplateDtoDesign şeması.
    class CreateWalletTemplateDtoDesign < Pushizo::BaseModel
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "organization", :organization, :string
      field "background_color", :background_color, :string
      field "foreground_color", :foreground_color, :string
      field "label_color", :label_color, :string
      # Değerler: "qr", "pdf417", "aztec", "code128".
      field "barcode", :barcode, :string
      field "fields", :fields_value, [:array, "CreateWalletTemplateDtoDesignFieldsItem"]
      field "expires_at", :expires_at, :string
      field "relevant_at", :relevant_at, :string
    end

    # CreateWalletTemplateDtoDesignFieldsItem şeması.
    class CreateWalletTemplateDtoDesignFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      field "label", :label, :string
      field "value", :value, :string
      # Değerler: "header", "primary", "secondary", "auxiliary", "back".
      field "section", :section, :string
    end

    # CreateWarehouseConnectionDto şeması.
    class CreateWarehouseConnectionDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "bigquery", "snowflake", "databricks".
      field "type", :type, :string
      # Zorunlu.
      field "config", :config, [:map, :any]
      # Zorunlu.
      field "credentials", :credentials, [:map, :any]
    end

    # CreateWarehouseSegmentDto şeması.
    class CreateWarehouseSegmentDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # Zorunlu.
      field "connection_id", :connection_id, :string
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "id_column", :id_column, :string
      # Değerler: "external_id", "user_id".
      field "id_type", :id_type, :string
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
      field "limits", :limits, "CreateWarehouseSegmentDtoLimits"
    end

    # CreateWarehouseSegmentDtoLimits şeması.
    class CreateWarehouseSegmentDtoLimits < Pushizo::BaseModel
      field "timeout_seconds", :timeout_seconds, :integer
      field "max_rows", :max_rows, :integer
      field "max_bytes_billed", :max_bytes_billed, :integer
      # Değerler: "X-Small", "Small", "Medium", "Large", "X-Large", "2X-Large", "3X-Large", "4X-Large", "5X-Large", "6X-Large".
      field "max_warehouse_size", :max_warehouse_size, :string
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

    # CreateWebCampaignDto şeması.
    class CreateWebCampaignDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "display", :display_value, "CreateWebCampaignDtoDisplay"
      field "variants", :variants, [:array, "CreateWebCampaignDtoVariantsItem"]
      # Zorunlu.
      field "trigger", :trigger, :any
      field "conditions", :conditions, "CreateWebCampaignDtoConditions"
      field "targeting", :targeting, "CreateWebCampaignDtoTargeting"
      field "frequency", :frequency, "CreateWebCampaignDtoFrequency"
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # CreateWebCampaignDtoConditions şeması.
    class CreateWebCampaignDtoConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "CreateWebCampaignDtoConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "CreateWebCampaignDtoConditionsUtmRulesItem"]
      field "visits", :visits, "CreateWebCampaignDtoConditionsVisits"
    end

    # CreateWebCampaignDtoConditionsUrlRulesItem şeması.
    class CreateWebCampaignDtoConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # CreateWebCampaignDtoConditionsUtmRulesItem şeması.
    class CreateWebCampaignDtoConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # CreateWebCampaignDtoConditionsVisits şeması.
    class CreateWebCampaignDtoConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # CreateWebCampaignDtoDisplay şeması.
    class CreateWebCampaignDtoDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # CreateWebCampaignDtoFrequency şeması.
    class CreateWebCampaignDtoFrequency < Pushizo::BaseModel
      field "max_per_session", :max_per_session, :integer
      field "max_per_day", :max_per_day, :integer
      field "max_total", :max_total, :integer
      field "hide_after_close_days", :hide_after_close_days, :integer
      field "stop_after_conversion", :stop_after_conversion, :boolean
    end

    # CreateWebCampaignDtoTargeting şeması.
    class CreateWebCampaignDtoTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # CreateWebCampaignDtoVariantsItem şeması.
    class CreateWebCampaignDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "CreateWebCampaignDtoVariantsItemDisplay"
    end

    # CreateWebCampaignDtoVariantsItemDisplay şeması.
    class CreateWebCampaignDtoVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # CreateWebhookDto şeması.
    class CreateWebhookDto < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "description", :description, :string
      # Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "conversation.created", "conversation.message", "conversation.assigned", "conversation.resolved", "audit.created", "form.submitted", "survey.responded", "ad_audience.synced", "ad_account.revoked", "ad_budget.alert", "ad_insights.imported".
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

    # CreateWebPersonalizationDto şeması.
    class CreateWebPersonalizationDto < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "changes", :changes, [:array, :any]
      field "variants", :variants, [:array, "CreateWebPersonalizationDtoVariantsItem"]
      field "conditions", :conditions, "CreateWebPersonalizationDtoConditions"
      field "targeting", :targeting, "CreateWebPersonalizationDtoTargeting"
      field "goal", :goal, :any
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # CreateWebPersonalizationDtoConditions şeması.
    class CreateWebPersonalizationDtoConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "CreateWebPersonalizationDtoConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "CreateWebPersonalizationDtoConditionsUtmRulesItem"]
      field "visits", :visits, "CreateWebPersonalizationDtoConditionsVisits"
    end

    # CreateWebPersonalizationDtoConditionsUrlRulesItem şeması.
    class CreateWebPersonalizationDtoConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # CreateWebPersonalizationDtoConditionsUtmRulesItem şeması.
    class CreateWebPersonalizationDtoConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # CreateWebPersonalizationDtoConditionsVisits şeması.
    class CreateWebPersonalizationDtoConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # CreateWebPersonalizationDtoTargeting şeması.
    class CreateWebPersonalizationDtoTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # CreateWebPersonalizationDtoVariantsItem şeması.
    class CreateWebPersonalizationDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "changes", :changes, [:array, :any]
    end

    # CustomAgent şeması.
    class CustomAgent < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "instructions", :instructions, :string
      # Zorunlu. Değerler: "list_segments", "campaign_performance", "delivery_summary", "create_segment_draft", "create_campaign_draft".
      field "tools", :tools, [:array, :string]
      # Zorunlu.
      field "schedule", :schedule, "CustomAgentSchedule"
      # Zorunlu.
      field "limits", :limits, "CustomAgentLimits"
      # Zorunlu.
      field "next_run_at", :next_run_at, :string
      # Zorunlu.
      field "last_run_at", :last_run_at, :string
      # Zorunlu.
      field "usage", :usage, "CustomAgentUsage"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # CustomAgentDraft şeması.
    class CustomAgentDraft < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "agent_id", :agent_id, :string
      # Zorunlu.
      field "run_id", :run_id, :string
      # Zorunlu. Değerler: "segment", "campaign".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "pending", "applied", "dismissed".
      field "status", :status, :string
      # Zorunlu.
      field "payload", :payload, [:map, :any]
      # Zorunlu.
      field "result_id", :result_id, :string
      # Zorunlu.
      field "decided_at", :decided_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # CustomAgentDraftList şeması.
    class CustomAgentDraftList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "CustomAgentDraft"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # CustomAgentLimits şeması.
    class CustomAgentLimits < Pushizo::BaseModel
      # Zorunlu.
      field "max_steps", :max_steps, :integer
      # Zorunlu.
      field "monthly_token_cap", :monthly_token_cap, :integer
    end

    # CustomAgentList şeması.
    class CustomAgentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "CustomAgent"]
    end

    # CustomAgentRun şeması.
    class CustomAgentRun < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "agent_id", :agent_id, :string
      # Zorunlu. Değerler: "schedule", "manual".
      field "trigger", :trigger, :string
      # Zorunlu. Değerler: "pending", "running", "succeeded", "failed", "skipped".
      field "status", :status, :string
      # Zorunlu.
      field "steps", :steps, [:array, "CustomAgentRunStepsItem"]
      # Zorunlu.
      field "summary", :summary, :string
      # Zorunlu.
      field "input_tokens", :input_tokens, :integer
      # Zorunlu.
      field "output_tokens", :output_tokens, :integer
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "drafts", :drafts, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "finished_at", :finished_at, :string
    end

    # CustomAgentRunList şeması.
    class CustomAgentRunList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "CustomAgentRun"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # CustomAgentRunStepsItem şeması.
    class CustomAgentRunStepsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "tool", "finish".
      field "kind", :kind, :string
      field "tool", :tool, :string
      field "ok", :ok, :boolean
      field "error", :error, :string
      field "duration_ms", :duration_ms, :integer
    end

    # CustomAgentSchedule şeması.
    class CustomAgentSchedule < Pushizo::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      # Zorunlu.
      field "timezone", :timezone, :string
    end

    # CustomAgentUsage şeması.
    class CustomAgentUsage < Pushizo::BaseModel
      # Zorunlu.
      field "tokens_this_month", :tokens_this_month, :integer
      # Zorunlu.
      field "period_start", :period_start, :string
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

    # DataQuarantineDiscardResult şeması.
    class DataQuarantineDiscardResult < Pushizo::BaseModel
      # Zorunlu.
      field "discarded", :discarded, :integer
    end

    # DataQuarantineList şeması.
    class DataQuarantineList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "DataQuarantineListDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
      # Zorunlu.
      field "pending_total", :pending_total, :integer
    end

    # DataQuarantineListDataItem şeması.
    class DataQuarantineListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "source_id", :source_id, :string
      # Zorunlu.
      field "transform_id", :transform_id, :string
      # Zorunlu.
      field "payload", :payload, [:map, :any]
      # Zorunlu. Değerler: "mapping_failed", "invalid_path", "cast_failed", "rule_failed", "invalid_output", "js_error", "js_timeout", "js_memory", "js_invalid_return", "sandbox_unavailable", "write_failed".
      field "error_code", :error_code, :string
      # Zorunlu.
      field "error_path", :error_path, :string
      # Zorunlu.
      field "error_message", :error_message, :string
      # Zorunlu. Değerler: "pending", "reprocessed", "discarded".
      field "status", :status, :string
      # Zorunlu.
      field "attempts", :attempts, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "resolved_at", :resolved_at, :string
    end

    # DataQuarantineReprocessResult şeması.
    class DataQuarantineReprocessResult < Pushizo::BaseModel
      # Zorunlu.
      field "reprocessed", :reprocessed, :integer
      # Zorunlu.
      field "dropped", :dropped, :integer
      # Zorunlu.
      field "failed", :failed, :integer
    end

    # DataSource şeması.
    class DataSource < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "webhook", "http_pull".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "signature", "token".
      field "auth_mode", :auth_mode, :string
      # Zorunlu.
      field "mapping", :mapping, "DataSourceMapping"
      # Zorunlu.
      field "config", :config, "DataSourceConfig"
      # Zorunlu.
      field "has_secret", :has_secret, :boolean
      # Zorunlu.
      field "webhook_url", :webhook_url, :string
      # Zorunlu.
      field "next_run_at", :next_run_at, :string
      # Zorunlu.
      field "last_run_at", :last_run_at, :string
      # Zorunlu.
      field "last_status", :last_status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_stats", :last_stats, [:map, :number]
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # DataSourceConfig şeması.
    class DataSourceConfig < Pushizo::BaseModel
      field "url", :url, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "headers", :headers, [:map, :string]
      field "body", :body, :string
      field "interval_minutes", :interval_minutes, :integer
      field "auth_header", :auth_header, :string
      field "next_cursor_path", :next_cursor_path, :string
      field "cursor_param", :cursor_param, :string
      field "resume_cursor", :resume_cursor, :boolean
    end

    # DataSourceList şeması.
    class DataSourceList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "DataSource"]
    end

    # DataSourceMapping şeması.
    class DataSourceMapping < Pushizo::BaseModel
      field "records_path", :records_path, :string
      field "event_name", :event_name, :string
      field "event_name_path", :event_name_path, :string
      field "external_id_path", :external_id_path, :string
      field "occurred_at_path", :occurred_at_path, :string
      field "value_path", :value_path, :string
      field "event_id_path", :event_id_path, :string
      field "properties_path", :properties_path, :string
      field "tags_path", :tags_path, :string
    end

    # DataSourceRunResult şeması.
    class DataSourceRunResult < Pushizo::BaseModel
      # Zorunlu. Değerler: "succeeded", "partial", "failed", "skipped".
      field "status", :status, :string
      # Zorunlu.
      field "stats", :stats, "DataSourceRunResultStats"
      # Zorunlu.
      field "error", :error, :string
    end

    # DataSourceRunResultStats şeması.
    class DataSourceRunResultStats < Pushizo::BaseModel
      # Zorunlu.
      field "received", :received, :integer
      # Zorunlu.
      field "processed", :processed, :integer
      # Zorunlu.
      field "dropped", :dropped, :integer
      # Zorunlu.
      field "quarantined", :quarantined, :integer
    end

    # DataSourceWithSecret şeması.
    class DataSourceWithSecret < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "webhook", "http_pull".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "signature", "token".
      field "auth_mode", :auth_mode, :string
      # Zorunlu.
      field "mapping", :mapping, "DataSourceWithSecretMapping"
      # Zorunlu.
      field "config", :config, "DataSourceWithSecretConfig"
      # Zorunlu.
      field "has_secret", :has_secret, :boolean
      # Zorunlu.
      field "webhook_url", :webhook_url, :string
      # Zorunlu.
      field "next_run_at", :next_run_at, :string
      # Zorunlu.
      field "last_run_at", :last_run_at, :string
      # Zorunlu.
      field "last_status", :last_status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_stats", :last_stats, [:map, :number]
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "secret", :secret, :string
    end

    # DataSourceWithSecretConfig şeması.
    class DataSourceWithSecretConfig < Pushizo::BaseModel
      field "url", :url, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "headers", :headers, [:map, :string]
      field "body", :body, :string
      field "interval_minutes", :interval_minutes, :integer
      field "auth_header", :auth_header, :string
      field "next_cursor_path", :next_cursor_path, :string
      field "cursor_param", :cursor_param, :string
      field "resume_cursor", :resume_cursor, :boolean
    end

    # DataSourceWithSecretMapping şeması.
    class DataSourceWithSecretMapping < Pushizo::BaseModel
      field "records_path", :records_path, :string
      field "event_name", :event_name, :string
      field "event_name_path", :event_name_path, :string
      field "external_id_path", :external_id_path, :string
      field "occurred_at_path", :occurred_at_path, :string
      field "value_path", :value_path, :string
      field "event_id_path", :event_id_path, :string
      field "properties_path", :properties_path, :string
      field "tags_path", :tags_path, :string
    end

    # DataTransform şeması.
    class DataTransform < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Zorunlu. Değerler: "rules", "javascript".
      field "kind", :kind, :string
      # Zorunlu.
      field "position", :position, :integer
      # Zorunlu. Değerler: "sdk", "api", "import", "system", "webhook_source", "pull_source".
      field "sources", :sources, [:array, :string]
      # Zorunlu.
      field "event_names", :event_names, [:array, :string]
      # Zorunlu.
      field "rules", :rules, [:array, [:map, :any]]
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "error_count", :error_count, :integer
      # Zorunlu. Değerler: "mapping_failed", "invalid_path", "cast_failed", "rule_failed", "invalid_output", "js_error", "js_timeout", "js_memory", "js_invalid_return", "sandbox_unavailable", "write_failed".
      field "last_error_code", :last_error_code, :string
      # Zorunlu.
      field "last_error_at", :last_error_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # DataTransformList şeması.
    class DataTransformList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "DataTransform"]
    end

    # DataTransformPreview şeması.
    class DataTransformPreview < Pushizo::BaseModel
      # Zorunlu.
      field "results", :results, [:array, "DataTransformPreviewResultsItem"]
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
    end

    # DataTransformPreviewResultsItem şeması.
    class DataTransformPreviewResultsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "kept", "dropped", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "record", :record, [:map, :any]
      # Zorunlu.
      field "transform_id", :transform_id, :string
      # Zorunlu. Değerler: "mapping_failed", "invalid_path", "cast_failed", "rule_failed", "invalid_output", "js_error", "js_timeout", "js_memory", "js_invalid_return", "sandbox_unavailable", "write_failed".
      field "error_code", :error_code, :string
      # Zorunlu.
      field "error_path", :error_path, :string
      # Zorunlu.
      field "error_message", :error_message, :string
      # Zorunlu.
      field "logs", :logs, [:array, :string]
    end

    # DecideDto şeması.
    class DecideDto < Pushizo::BaseModel
      # Zorunlu.
      field "external_id", :external_id, :string
    end

    # DecisionAgent şeması.
    class DecisionAgent < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "arms", :arms, [:array, "DecisionAgentArmsItem"]
      # Zorunlu.
      field "reward_events", :reward_events, [:array, :string]
      # Zorunlu.
      field "reward_window_hours", :reward_window_hours, :integer
      # Zorunlu.
      field "holdout_percent", :holdout_percent, :integer
      # Zorunlu.
      field "context_prediction", :context_prediction, :string
      # Zorunlu.
      field "use_best_channel", :use_best_channel, :boolean
      # Zorunlu. Değerler: "active", "paused".
      field "status", :status, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # DecisionAgentArmsItem şeması.
    class DecisionAgentArmsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "label", :label, :string
    end

    # DecisionAgentList şeması.
    class DecisionAgentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "DecisionAgent"]
    end

    # DecisionReport şeması.
    class DecisionReport < Pushizo::BaseModel
      # Zorunlu.
      field "agent_id", :agent_id, :string
      # Zorunlu.
      field "days", :days, :integer
      # Zorunlu.
      field "learned", :learned, "DecisionReportLearned"
      # Zorunlu.
      field "holdout", :holdout, "DecisionReportHoldout"
      # Zorunlu.
      field "lift", :lift, :number
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "arms", :arms, [:array, "DecisionReportArmsItem"]
      # Zorunlu.
      field "contexts", :contexts, [:array, "DecisionReportContextsItem"]
    end

    # DecisionReportArmsItem şeması.
    class DecisionReportArmsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "share", :share, :number
      # Zorunlu.
      field "assignments", :assignments, :integer
      # Zorunlu.
      field "settled", :settled, :integer
      # Zorunlu.
      field "rewards", :rewards, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # DecisionReportContextsItem şeması.
    class DecisionReportContextsItem < Pushizo::BaseModel
      # Zorunlu.
      field "context", :context, :string
      # Zorunlu.
      field "arm_id", :arm_id, :string
      # Zorunlu.
      field "settled", :settled, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # DecisionReportHoldout şeması.
    class DecisionReportHoldout < Pushizo::BaseModel
      # Zorunlu.
      field "assignments", :assignments, :integer
      # Zorunlu.
      field "settled", :settled, :integer
      # Zorunlu.
      field "rewards", :rewards, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # DecisionReportLearned şeması.
    class DecisionReportLearned < Pushizo::BaseModel
      # Zorunlu.
      field "assignments", :assignments, :integer
      # Zorunlu.
      field "settled", :settled, :integer
      # Zorunlu.
      field "rewards", :rewards, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # DecisionResult şeması.
    class DecisionResult < Pushizo::BaseModel
      # Zorunlu.
      field "arm_id", :arm_id, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu. Değerler: "thompson", "holdout".
      field "policy", :policy, :string
      # Zorunlu.
      field "context", :context, :string
    end

    # DeliverabilitySettingsDto şeması.
    class DeliverabilitySettingsDto < Pushizo::BaseModel
      field "bcc_address", :bcc_address, :string
      field "validation", :validation, "DeliverabilitySettingsDtoValidation"
      field "verifier", :verifier, "DeliverabilitySettingsDtoVerifier"
      field "volume_spike", :volume_spike, "DeliverabilitySettingsDtoVolumeSpike"
      field "max_invalid_ratio", :max_invalid_ratio, :number
      field "postmaster", :postmaster, "DeliverabilitySettingsDtoPostmaster"
    end

    # DeliverabilitySettingsDtoPostmaster şeması.
    class DeliverabilitySettingsDtoPostmaster < Pushizo::BaseModel
      # Zorunlu.
      field "domain", :domain, :string
      field "access_token", :access_token, :string
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

    # DeliverabilitySettingsDtoVolumeSpike şeması.
    class DeliverabilitySettingsDtoVolumeSpike < Pushizo::BaseModel
      # Zorunlu.
      field "multiplier", :multiplier, :integer
      # Zorunlu.
      field "floor", :floor, :integer
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
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # DiscardQuarantineDto şeması.
    class DiscardQuarantineDto < Pushizo::BaseModel
      # Zorunlu.
      field "ids", :ids, [:array, :string]
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
      # Zorunlu.
      field "volume_spike", :volume_spike, "EmailDeliverabilitySettingsVolumeSpike"
      # Zorunlu.
      field "postmaster", :postmaster, "EmailDeliverabilitySettingsPostmaster"
      # Zorunlu.
      field "max_invalid_ratio", :max_invalid_ratio, :number
    end

    # EmailDeliverabilitySettingsPostmaster şeması.
    class EmailDeliverabilitySettingsPostmaster < Pushizo::BaseModel
      # Zorunlu.
      field "domain", :domain, :string
      # Zorunlu.
      field "has_token", :has_token, :boolean
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

    # EmailDeliverabilitySettingsVolumeSpike şeması.
    class EmailDeliverabilitySettingsVolumeSpike < Pushizo::BaseModel
      # Zorunlu.
      field "multiplier", :multiplier, :integer
      # Zorunlu.
      field "floor", :floor, :integer
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # EvaluateAppFlagsDto şeması.
    class EvaluateAppFlagsDto < Pushizo::BaseModel
      field "external_id", :external_id, :string
      field "user_id", :user_id, :string
      field "subject", :subject, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # Form şeması.
    class Form < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "active", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "fields", :fields_value, [:array, "FormFieldsItem"]
      # Zorunlu.
      field "settings", :settings, "FormSettings"
      # Zorunlu.
      field "stats", :stats, "FormStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # FormFieldsItem şeması.
    class FormFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "email", "phone", "first_name", "last_name", "full_name", "text", "textarea", "select", "radio", "checkbox", "consent".
      field "type", :type, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "FormFieldsItemOptionsItem"]
      field "maps_to", :maps_to, :string
      field "max_length", :max_length, :integer
      field "policy_url", :policy_url, :string
    end

    # FormFieldsItemOptionsItem şeması.
    class FormFieldsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # FormPage şeması.
    class FormPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Form"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # FormSettings şeması.
    class FormSettings < Pushizo::BaseModel
      field "submit_label", :submit_label, [:map, :string]
      field "success_message", :success_message, [:map, :string]
      field "redirect_url", :redirect_url, :string
      field "tags", :tags, [:map, :string]
      field "subscribe", :subscribe, "FormSettingsSubscribe"
      field "double_opt_in", :double_opt_in, "FormSettingsDoubleOptIn"
      field "event_name", :event_name, :string
      field "captcha", :captcha, :boolean
      field "default_language", :default_language, :string
    end

    # FormSettingsDoubleOptIn şeması.
    class FormSettingsDoubleOptIn < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "subject", :subject, [:map, :string]
      field "body", :body, [:map, :string]
    end

    # FormSettingsSubscribe şeması.
    class FormSettingsSubscribe < Pushizo::BaseModel
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # FormStats şeması.
    class FormStats < Pushizo::BaseModel
      # Zorunlu.
      field "submissions", :submissions, :integer
      # Zorunlu.
      field "last_submission_at", :last_submission_at, :string
    end

    # FormSubmission şeması.
    class FormSubmission < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "form_id", :form_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "subscription_ids", :subscription_ids, [:array, :string]
      # Zorunlu. Değerler: "web_campaign", "landing_page", "sdk", "api".
      field "source", :source, :string
      # Zorunlu.
      field "source_id", :source_id, :string
      # Zorunlu. Değerler: "accepted", "pending_confirmation", "confirmed".
      field "status", :status, :string
      # Zorunlu.
      field "data", :data, [:map, :any]
      # Zorunlu.
      field "consent", :consent, [:array, "FormSubmissionConsentItem"]
      # Zorunlu.
      field "page_url", :page_url, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "confirmed_at", :confirmed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # FormSubmissionConsentItem şeması.
    class FormSubmissionConsentItem < Pushizo::BaseModel
      # Zorunlu.
      field "field_id", :field_id, :string
      # Zorunlu.
      field "given", :given, :boolean
      # Zorunlu.
      field "text", :text, :string
      # Zorunlu.
      field "text_hash", :text_hash, :string
      # Zorunlu.
      field "policy_url", :policy_url, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "at", :at, :string
    end

    # FormSubmissionPage şeması.
    class FormSubmissionPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "FormSubmission"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # FormSubmitResult şeması.
    class FormSubmitResult < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu. Değerler: "accepted", "pending_confirmation".
      field "status", :status, :string
      # Zorunlu.
      field "submission_id", :submission_id, :string
      # Zorunlu.
      field "success_message", :success_message, :string
      # Zorunlu.
      field "redirect_url", :redirect_url, :string
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

    # Geofence şeması.
    class Geofence < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "lat", :lat, :number
      # Zorunlu.
      field "lng", :lng, :number
      # Zorunlu.
      field "radius_m", :radius_m, :integer
      # Zorunlu.
      field "cooldown_minutes", :cooldown_minutes, :integer
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "enter_count", :enter_count, :integer
      # Zorunlu.
      field "exit_count", :exit_count, :integer
      # Zorunlu.
      field "inside_count", :inside_count, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # GeofenceList şeması.
    class GeofenceList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Geofence"]
    end

    # GlobalControl şeması.
    class GlobalControl < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "percent", :percent, :integer
      # Zorunlu.
      field "started_at", :started_at, :string
    end

    # GlobalControlReport şeması.
    class GlobalControlReport < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "percent", :percent, :integer
      # Zorunlu.
      field "started_at", :started_at, :string
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "events", :events, [:array, :string]
      # Zorunlu.
      field "control", :control, "GlobalControlReportControl"
      # Zorunlu.
      field "treatment", :treatment, "GlobalControlReportTreatment"
      # Zorunlu.
      field "lift_percent", :lift_percent, :number
      # Zorunlu.
      field "incremental_conversions", :incremental_conversions, :integer
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
      # Zorunlu.
      field "withheld_messages", :withheld_messages, :integer
    end

    # GlobalControlReportControl şeması.
    class GlobalControlReportControl < Pushizo::BaseModel
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # GlobalControlReportTreatment şeması.
    class GlobalControlReportTreatment < Pushizo::BaseModel
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "converted", :converted, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
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
      # Zorunlu. Değerler: "legacy_players", "csv_users".
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
      field "rejected_emails", :rejected_emails, :integer
      field "rejected_email_reasons", :rejected_email_reasons, [:map, :integer]
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
      field "placement", :placement, :string
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
      field "global_control_exempt", :global_control_exempt, :boolean
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

    # InboxAgent şeması.
    class InboxAgent < Pushizo::BaseModel
      # Zorunlu.
      field "account_id", :account_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "email", :email, :string
      # Zorunlu.
      field "role", :role, :string
      # Zorunlu. Değerler: "online", "busy", "offline".
      field "status", :status, :string
      # Zorunlu.
      field "last_heartbeat_at", :last_heartbeat_at, :string
      # Zorunlu.
      field "max_concurrent", :max_concurrent, :integer
      # Zorunlu.
      field "languages", :languages, [:array, :string]
      # Zorunlu.
      field "open_conversations", :open_conversations, :integer
      # Zorunlu.
      field "team_ids", :team_ids, [:array, :string]
    end

    # InboxAgentList şeması.
    class InboxAgentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "InboxAgent"]
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

    # InboxMetrics şeması.
    class InboxMetrics < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "first_response", :first_response, "InboxMetricsFirstResponse"
      # Zorunlu.
      field "resolution", :resolution, "InboxMetricsResolution"
      # Zorunlu.
      field "sla", :sla, "InboxMetricsSla"
      # Zorunlu.
      field "volume", :volume, "InboxMetricsVolume"
      # Zorunlu.
      field "agents", :agents, [:array, "InboxMetricsAgentsItem"]
      # Zorunlu.
      field "daily", :daily, [:array, "InboxMetricsDailyItem"]
    end

    # InboxMetricsAgentsItem şeması.
    class InboxMetricsAgentsItem < Pushizo::BaseModel
      # Zorunlu.
      field "account_id", :account_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "first_response", :first_response, "InboxMetricsAgentsItemFirstResponse"
      # Zorunlu.
      field "resolution", :resolution, "InboxMetricsAgentsItemResolution"
      # Zorunlu.
      field "resolved", :resolved, :integer
      # Zorunlu.
      field "open_now", :open_now, :integer
    end

    # InboxMetricsAgentsItemFirstResponse şeması.
    class InboxMetricsAgentsItemFirstResponse < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "avg_seconds", :avg_seconds, :number
      # Zorunlu.
      field "p90_seconds", :p90_seconds, :number
    end

    # InboxMetricsAgentsItemResolution şeması.
    class InboxMetricsAgentsItemResolution < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "avg_seconds", :avg_seconds, :number
      # Zorunlu.
      field "p90_seconds", :p90_seconds, :number
    end

    # InboxMetricsDailyItem şeması.
    class InboxMetricsDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "created", :created, :integer
      # Zorunlu.
      field "resolved", :resolved, :integer
      # Zorunlu.
      field "first_response_avg_seconds", :first_response_avg_seconds, :number
    end

    # InboxMetricsFirstResponse şeması.
    class InboxMetricsFirstResponse < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "avg_seconds", :avg_seconds, :number
      # Zorunlu.
      field "p90_seconds", :p90_seconds, :number
    end

    # InboxMetricsResolution şeması.
    class InboxMetricsResolution < Pushizo::BaseModel
      # Zorunlu.
      field "count", :count, :integer
      # Zorunlu.
      field "avg_seconds", :avg_seconds, :number
      # Zorunlu.
      field "p90_seconds", :p90_seconds, :number
    end

    # InboxMetricsSla şeması.
    class InboxMetricsSla < Pushizo::BaseModel
      # Zorunlu.
      field "target_seconds", :target_seconds, :integer
      # Zorunlu.
      field "met", :met, :integer
      # Zorunlu.
      field "breached", :breached, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # InboxMetricsVolume şeması.
    class InboxMetricsVolume < Pushizo::BaseModel
      # Zorunlu.
      field "created", :created, :integer
      # Zorunlu.
      field "resolved", :resolved, :integer
      # Zorunlu.
      field "open_now", :open_now, :integer
      # Zorunlu.
      field "unassigned_now", :unassigned_now, :integer
      # Zorunlu.
      field "by_channel", :by_channel, [:map, :integer]
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

    # InboxSettings şeması.
    class InboxSettings < Pushizo::BaseModel
      # Zorunlu.
      field "widget", :widget, "InboxSettingsWidget"
      # Zorunlu.
      field "business_hours", :business_hours, "InboxSettingsBusinessHours"
      # Zorunlu.
      field "routing", :routing, "InboxSettingsRouting"
      # Zorunlu.
      field "email", :email, "InboxSettingsEmail"
      # Zorunlu.
      field "timezone", :timezone, :string
      # Zorunlu.
      field "within_business_hours", :within_business_hours, :boolean
      # Zorunlu.
      field "install", :install, "InboxSettingsInstall"
    end

    # InboxSettingsBusinessHours şeması.
    class InboxSettingsBusinessHours < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "timezone", :timezone, :string
      field "days", :days, [:array, "InboxSettingsBusinessHoursDaysItem"]
      field "holidays", :holidays, [:array, :string]
    end

    # InboxSettingsBusinessHoursDaysItem şeması.
    class InboxSettingsBusinessHoursDaysItem < Pushizo::BaseModel
      # Zorunlu.
      field "day", :day, :integer
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
    end

    # InboxSettingsEmail şeması.
    class InboxSettingsEmail < Pushizo::BaseModel
      # Zorunlu.
      field "capture_replies", :capture_replies, :boolean
      # Zorunlu.
      field "reply_domain", :reply_domain, :string
    end

    # InboxSettingsInstall şeması.
    class InboxSettingsInstall < Pushizo::BaseModel
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "sdk_url", :sdk_url, :string
      # Zorunlu.
      field "api_url", :api_url, :string
    end

    # InboxSettingsRouting şeması.
    class InboxSettingsRouting < Pushizo::BaseModel
      # Zorunlu.
      field "auto_assign", :auto_assign, :boolean
      # Zorunlu. Değerler: "all", "team", "assigned".
      field "visibility", :visibility, :string
      # Zorunlu.
      field "show_unassigned", :show_unassigned, :boolean
      # Zorunlu.
      field "first_response_sla_seconds", :first_response_sla_seconds, :integer
      # Zorunlu.
      field "max_concurrent_default", :max_concurrent_default, :integer
    end

    # InboxSettingsUpdateDto şeması.
    class InboxSettingsUpdateDto < Pushizo::BaseModel
      field "widget", :widget, "InboxSettingsUpdateDtoWidget"
      field "business_hours", :business_hours, "InboxSettingsUpdateDtoBusinessHours"
      field "routing", :routing, "InboxSettingsUpdateDtoRouting"
      field "email", :email, "InboxSettingsUpdateDtoEmail"
    end

    # InboxSettingsUpdateDtoBusinessHours şeması.
    class InboxSettingsUpdateDtoBusinessHours < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "timezone", :timezone, :string
      field "days", :days, [:array, "InboxSettingsUpdateDtoBusinessHoursDaysItem"]
      field "holidays", :holidays, [:array, :string]
    end

    # InboxSettingsUpdateDtoBusinessHoursDaysItem şeması.
    class InboxSettingsUpdateDtoBusinessHoursDaysItem < Pushizo::BaseModel
      # Zorunlu.
      field "day", :day, :integer
      # Zorunlu.
      field "start", :start, :string
      # Zorunlu.
      field "end", :end_, :string
    end

    # InboxSettingsUpdateDtoEmail şeması.
    class InboxSettingsUpdateDtoEmail < Pushizo::BaseModel
      field "capture_replies", :capture_replies, :boolean
    end

    # InboxSettingsUpdateDtoRouting şeması.
    class InboxSettingsUpdateDtoRouting < Pushizo::BaseModel
      field "auto_assign", :auto_assign, :boolean
      # Değerler: "all", "team", "assigned".
      field "visibility", :visibility, :string
      field "show_unassigned", :show_unassigned, :boolean
      field "first_response_sla_seconds", :first_response_sla_seconds, :integer
      field "max_concurrent_default", :max_concurrent_default, :integer
    end

    # InboxSettingsUpdateDtoWidget şeması.
    class InboxSettingsUpdateDtoWidget < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "color", :color, :string
      field "text_color", :text_color, :string
      # Değerler: "right", "left".
      field "position", :position, :string
      # Değerler: "light", "dark", "auto".
      field "theme", :theme, :string
      field "title", :title, [:map, :string]
      field "greeting", :greeting, [:map, :string]
      field "offline_message", :offline_message, [:map, :string]
      field "collect_email_offline", :collect_email_offline, :boolean
      field "attachments", :attachments, :boolean
      field "require_email", :require_email, :boolean
    end

    # InboxSettingsWidget şeması.
    class InboxSettingsWidget < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "color", :color, :string
      field "text_color", :text_color, :string
      # Değerler: "right", "left".
      field "position", :position, :string
      # Değerler: "light", "dark", "auto".
      field "theme", :theme, :string
      field "title", :title, [:map, :string]
      field "greeting", :greeting, [:map, :string]
      field "offline_message", :offline_message, [:map, :string]
      field "collect_email_offline", :collect_email_offline, :boolean
      field "attachments", :attachments, :boolean
      field "require_email", :require_email, :boolean
    end

    # InboxTeam şeması.
    class InboxTeam < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "member_ids", :member_ids, [:array, :string]
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # InboxTeamList şeması.
    class InboxTeamList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "InboxTeam"]
    end

    # IntegrationOk şeması.
    class IntegrationOk < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
    end

    # IssueWalletPassDto şeması.
    class IssueWalletPassDto < Pushizo::BaseModel
      # Zorunlu.
      field "template_id", :template_id, :string
      field "external_id", :external_id, :string
      field "barcode_value", :barcode_value, :string
      field "values", :values, [:map, :string]
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

    # LandingPage şeması.
    class LandingPage < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu. Değerler: "draft", "published", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "seo", :seo, "LandingPageSeo"
      # Zorunlu.
      field "settings", :settings, "LandingPageSettings"
      # Zorunlu.
      field "custom_domain_id", :custom_domain_id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "published_version", :published_version, :integer
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "has_unpublished_changes", :has_unpublished_changes, :boolean
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "domain_url", :domain_url, :string
      # Zorunlu.
      field "stats", :stats, "LandingPageStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "document", :document, "LandingPageDocument"
    end

    # LandingPageDocument şeması.
    class LandingPageDocument < Pushizo::BaseModel
      # Zorunlu. Değerler: 1.
      field "version", :version, :number
      # Zorunlu.
      field "settings", :settings, "LandingPageDocumentSettings"
      # Zorunlu.
      field "sections", :sections, [:array, "LandingPageDocumentSectionsItem"]
    end

    # LandingPageDocumentSectionsItem şeması.
    class LandingPageDocumentSectionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "section".
      field "type", :type, :string
      field "background_color", :background_color, :string
      field "background_image", :background_image, :string
      field "padding", :padding, "LandingPageDocumentSectionsItemPadding"
      field "stack_on_mobile", :stack_on_mobile, :boolean
      # Zorunlu.
      field "columns", :columns, [:array, "LandingPageDocumentSectionsItemColumnsItem"]
    end

    # LandingPageDocumentSectionsItemColumnsItem şeması.
    class LandingPageDocumentSectionsItemColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      field "width_percent", :width_percent, :integer
      field "background_color", :background_color, :string
      # Değerler: "top", "middle", "bottom".
      field "vertical_align", :vertical_align, :string
      field "padding", :padding, "LandingPageDocumentSectionsItemColumnsItemPadding"
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # LandingPageDocumentSectionsItemColumnsItemPadding şeması.
    class LandingPageDocumentSectionsItemColumnsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # LandingPageDocumentSectionsItemPadding şeması.
    class LandingPageDocumentSectionsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # LandingPageDocumentSettings şeması.
    class LandingPageDocumentSettings < Pushizo::BaseModel
      field "width", :width, :integer
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
      # Değerler: "system", "arial", "georgia", "verdana", "trebuchet", "courier".
      field "font_family", :font_family, :string
      field "dark_mode", :dark_mode, "LandingPageDocumentSettingsDarkMode"
    end

    # LandingPageDocumentSettingsDarkMode şeması.
    class LandingPageDocumentSettingsDarkMode < Pushizo::BaseModel
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
    end

    # LandingPageList şeması.
    class LandingPageList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "LandingPageListDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # LandingPageListDataItem şeması.
    class LandingPageListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu. Değerler: "draft", "published", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "seo", :seo, "LandingPageListDataItemSeo"
      # Zorunlu.
      field "settings", :settings, "LandingPageListDataItemSettings"
      # Zorunlu.
      field "custom_domain_id", :custom_domain_id, :string
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "published_version", :published_version, :integer
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "has_unpublished_changes", :has_unpublished_changes, :boolean
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "domain_url", :domain_url, :string
      # Zorunlu.
      field "stats", :stats, "LandingPageListDataItemStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # LandingPageListDataItemSeo şeması.
    class LandingPageListDataItemSeo < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "og_image", :og_image, :string
      field "canonical_url", :canonical_url, :string
      field "noindex", :noindex, :boolean
    end

    # LandingPageListDataItemSettings şeması.
    class LandingPageListDataItemSettings < Pushizo::BaseModel
      field "language", :language, :string
      field "form_id", :form_id, :string
      field "form_section_id", :form_section_id, :string
      field "cookie_consent", :cookie_consent, "LandingPageListDataItemSettingsCookieConsent"
      field "web_sdk", :web_sdk, :boolean
      field "favicon_url", :favicon_url, :string
    end

    # LandingPageListDataItemSettingsCookieConsent şeması.
    class LandingPageListDataItemSettingsCookieConsent < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "text", :text, :string
      field "accept_label", :accept_label, :string
      field "reject_label", :reject_label, :string
      field "policy_url", :policy_url, :string
    end

    # LandingPageListDataItemStats şeması.
    class LandingPageListDataItemStats < Pushizo::BaseModel
      # Zorunlu.
      field "submissions", :submissions, :integer
    end

    # LandingPageSeo şeması.
    class LandingPageSeo < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "og_image", :og_image, :string
      field "canonical_url", :canonical_url, :string
      field "noindex", :noindex, :boolean
    end

    # LandingPageSettings şeması.
    class LandingPageSettings < Pushizo::BaseModel
      field "language", :language, :string
      field "form_id", :form_id, :string
      field "form_section_id", :form_section_id, :string
      field "cookie_consent", :cookie_consent, "LandingPageSettingsCookieConsent"
      field "web_sdk", :web_sdk, :boolean
      field "favicon_url", :favicon_url, :string
    end

    # LandingPageSettingsCookieConsent şeması.
    class LandingPageSettingsCookieConsent < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "text", :text, :string
      field "accept_label", :accept_label, :string
      field "reject_label", :reject_label, :string
      field "policy_url", :policy_url, :string
    end

    # LandingPageStats şeması.
    class LandingPageStats < Pushizo::BaseModel
      # Zorunlu.
      field "submissions", :submissions, :integer
    end

    # LandingPageVersions şeması.
    class LandingPageVersions < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "LandingPageVersionsDataItem"]
    end

    # LandingPageVersionsDataItem şeması.
    class LandingPageVersionsDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "published_at", :published_at, :string
      # Zorunlu.
      field "published_by", :published_by, :string
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
      # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
      field "goals", :goals, "McpCreateCampaignDraftBodyGoals"
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "low", "normal", "high".
      field "frequency_priority", :frequency_priority, :string
      field "global_control_exempt", :global_control_exempt, :boolean
      field "quiet_hours_exempt", :quiet_hours_exempt, :boolean
      field "one_per_user", :one_per_user, :boolean
    end

    # Dönüşüm hedefleri (ADR-0080): birincil A/B kazananını belirler; olaylar dönüşüm olayı olarak tanımlı olmalı.
    class McpCreateCampaignDraftBodyGoals < Pushizo::BaseModel
      field "primary", :primary, :string
      field "secondary", :secondary, [:array, :string]
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

    # McpCreateJourneyDraftBody şeması.
    class McpCreateJourneyDraftBody < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
      field "graph", :graph, "McpCreateJourneyDraftBodyGraph"
      # Yeniden giriş, yalnızca yeni girenler, çıkış kuralları, çıkış tag'leri, hedefler, takvim (docs/journeys.md)
      field "settings", :settings, [:map, :any]
    end

    # React Flow uyumlu journey grafı: { nodes: [{ id, type, position, data }], edges: [{ id, source, target, sourceHandle }] } (docs/journeys.md)
    class McpCreateJourneyDraftBodyGraph < Pushizo::BaseModel
      # Zorunlu.
      field "nodes", :nodes, [:array, [:map, :any]]
      # Zorunlu.
      field "edges", :edges, [:array, [:map, :any]]
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
      # Zorunlu. Değerler: "owner", "admin", "developer", "marketer", "analyst", "billing", "viewer", "composer", "agent".
      field "role", :role, :string
      # Zorunlu.
      field "app_scopes", :app_scopes, [:array, :string]
      # Zorunlu.
      field "app_roles", :app_roles, [:array, "MemberAppRolesItem"]
      # Zorunlu.
      field "accepted_at", :accepted_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "last_login_at", :last_login_at, :string
    end

    # MemberAppRolesItem şeması.
    class MemberAppRolesItem < Pushizo::BaseModel
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu. Değerler: "owner", "admin", "developer", "marketer", "analyst", "billing", "viewer", "composer", "agent".
      field "role", :role, :string
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

    # MessengerLink şeması.
    class MessengerLink < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "telegram", "viber".
      field "channel", :channel, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "token", :token, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
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
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channel", :channel, :string
      # Zorunlu. Değerler: "apns", "fcm", "hms", "adm", "wns", "webpush", "smtp", "ses", "resend", "twilio", "netgsm", "meta_whatsapp", "google_rbm", "telegram_bot", "viber_bot", "mock".
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
      # Değerler: "phone", "watch".
      field "form_factor", :form_factor, :string
      # Değerler: "alert", "voip", "app_clip".
      field "push_kind", :push_kind, :string
      field "manufacturer", :manufacturer, :string
      field "brand", :brand, :string
      field "rom", :rom, :string
      field "rom_version", :rom_version, :string
      field "delivery", :delivery, "PatchSubscriptionDtoDeviceDelivery"
    end

    # PatchSubscriptionDtoDeviceDelivery şeması.
    class PatchSubscriptionDtoDeviceDelivery < Pushizo::BaseModel
      field "battery_optimization_exempt", :battery_optimization_exempt, :boolean
      field "background_restricted", :background_restricted, :boolean
      field "channel_blocked", :channel_blocked, :boolean
      field "power_save_mode", :power_save_mode, :boolean
      field "data_saver", :data_saver, :boolean
      # Değerler: "exempted", "active", "working_set", "frequent", "rare", "restricted".
      field "standby_bucket", :standby_bucket, :string
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

    # PathBodyDto şeması.
    class PathBodyDto < Pushizo::BaseModel
      # Zorunlu.
      field "event", :event, :string
      # Değerler: "after", "before".
      field "direction", :direction, :string
      field "depth", :depth, :integer
      field "top", :top, :integer
      field "window_hours", :window_hours, :integer
      field "exclude", :exclude, [:array, :string]
      field "from", :from, :string
      field "to", :to, :string
      # Değerler: "json", "csv".
      field "format", :format_value, :string
    end

    # PathReport şeması.
    class PathReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "event", :event, :string
      # Zorunlu. Değerler: "after", "before".
      field "direction", :direction, :string
      # Zorunlu.
      field "window_hours", :window_hours, :integer
      # Zorunlu.
      field "total_users", :total_users, :integer
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "levels", :levels, [:array, "PathReportLevelsItem"]
      # Zorunlu.
      field "links", :links, [:array, "PathReportLinksItem"]
      # Zorunlu.
      field "top_paths", :top_paths, [:array, "PathReportTopPathsItem"]
    end

    # PathReportLevelsItem şeması.
    class PathReportLevelsItem < Pushizo::BaseModel
      # Zorunlu.
      field "step", :step, :integer
      # Zorunlu.
      field "nodes", :nodes, [:array, "PathReportLevelsItemNodesItem"]
    end

    # PathReportLevelsItemNodesItem şeması.
    class PathReportLevelsItemNodesItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "event", "other", "end".
      field "kind", :kind, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "share", :share, :number
    end

    # PathReportLinksItem şeması.
    class PathReportLinksItem < Pushizo::BaseModel
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "target", :target, :string
      # Zorunlu.
      field "users", :users, :integer
    end

    # PathReportTopPathsItem şeması.
    class PathReportTopPathsItem < Pushizo::BaseModel
      # Zorunlu.
      field "path", :path, [:array, :string]
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "share", :share, :number
    end

    # PostmasterStats şeması.
    class PostmasterStats < Pushizo::BaseModel
      # Zorunlu.
      field "domain", :domain, :string
      # Zorunlu.
      field "data", :data, [:array, "PostmasterStatsDataItem"]
    end

    # PostmasterStatsDataItem şeması.
    class PostmasterStatsDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "day", :day, :string
      # Zorunlu.
      field "domain_reputation", :domain_reputation, :string
      # Zorunlu.
      field "spam_rate", :spam_rate, :string
    end

    # PredictionModel şeması.
    class PredictionModel < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "churn", "event".
      field "kind", :kind, :string
      # Zorunlu.
      field "event_names", :event_names, [:array, :string]
      # Zorunlu.
      field "horizon_days", :horizon_days, :integer
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "idle", "queued", "running", "failed".
      field "status", :status, :string
      # Zorunlu. Değerler: "ready", "insufficient_data", "low_quality".
      field "outcome", :outcome, :string
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_users", :scored_users, :integer
      # Zorunlu.
      field "metrics", :metrics, "PredictionModelMetrics"
      # Zorunlu.
      field "distribution", :distribution, [:array, "PredictionModelDistributionItem"]
    end

    # PredictionModelDistributionItem şeması.
    class PredictionModelDistributionItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "low", "medium", "high".
      field "bucket", :bucket, :string
      # Zorunlu.
      field "users", :users, :integer
    end

    # PredictionModelList şeması.
    class PredictionModelList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "PredictionModel"]
    end

    # PredictionModelMetrics şeması.
    class PredictionModelMetrics < Pushizo::BaseModel
      # Zorunlu.
      field "auc", :auc, :number
      # Zorunlu.
      field "base_rate", :base_rate, :number
      # Zorunlu.
      field "train_users", :train_users, :integer
      # Zorunlu.
      field "holdout_users", :holdout_users, :integer
      # Zorunlu.
      field "positives", :positives, :integer
      # Zorunlu.
      field "negatives", :negatives, :integer
      # Zorunlu.
      field "calibration", :calibration, [:array, "PredictionModelMetricsCalibrationItem"]
      # Zorunlu.
      field "importance", :importance, [:array, "PredictionModelMetricsImportanceItem"]
    end

    # PredictionModelMetricsCalibrationItem şeması.
    class PredictionModelMetricsCalibrationItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "low", "medium", "high".
      field "bucket", :bucket, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "predicted", :predicted, :number
      # Zorunlu.
      field "actual", :actual, :number
    end

    # PredictionModelMetricsImportanceItem şeması.
    class PredictionModelMetricsImportanceItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "recency_days", "events_7", "events_30", "active_days_30", "target_30", "days_since_target", "tenure_days", "sent_30", "engaged_30".
      field "feature", :feature, :string
      # Zorunlu.
      field "weight", :weight, :number
    end

    # PredictionUsersPage şeması.
    class PredictionUsersPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "PredictionUsersPageDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
    end

    # PredictionUsersPageDataItem şeması.
    class PredictionUsersPageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "score", :score, :integer
      # Zorunlu. Değerler: "low", "medium", "high".
      field "bucket", :bucket, :string
    end

    # PreviewDataTransformDto şeması.
    class PreviewDataTransformDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "event", "person".
      field "target", :target, :string
      # Değerler: "sdk", "api", "import", "system", "webhook_source", "pull_source".
      field "source", :source, :string
      # Zorunlu.
      field "records", :records, [:array, [:map, :any]]
      field "transform", :transform, "PreviewDataTransformDtoTransform"
      field "transform_id", :transform_id, :string
    end

    # PreviewDataTransformDtoTransform şeması.
    class PreviewDataTransformDtoTransform < Pushizo::BaseModel
      # Zorunlu. Değerler: "rules", "javascript".
      field "kind", :kind, :string
      field "rules", :rules, [:array, :any]
      field "code", :code, :string
      # Değerler: "sdk", "api", "import", "system", "webhook_source", "pull_source".
      field "sources", :sources, [:array, :string]
      field "event_names", :event_names, [:array, :string]
    end

    # PreviewWarehouseQueryDto şeması.
    class PreviewWarehouseQueryDto < Pushizo::BaseModel
      # Zorunlu.
      field "connection_id", :connection_id, :string
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "id_column", :id_column, :string
      # Değerler: "external_id", "user_id".
      field "id_type", :id_type, :string
      field "limits", :limits, "PreviewWarehouseQueryDtoLimits"
      # Değerler: "dry_run", "sample".
      field "mode", :mode, :string
    end

    # PreviewWarehouseQueryDtoLimits şeması.
    class PreviewWarehouseQueryDtoLimits < Pushizo::BaseModel
      field "timeout_seconds", :timeout_seconds, :integer
      field "max_rows", :max_rows, :integer
      field "max_bytes_billed", :max_bytes_billed, :integer
      # Değerler: "X-Small", "Small", "Medium", "Large", "X-Large", "2X-Large", "3X-Large", "4X-Large", "5X-Large", "6X-Large".
      field "max_warehouse_size", :max_warehouse_size, :string
    end

    # PromoCodeList şeması.
    class PromoCodeList < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
      # Zorunlu.
      field "total_count", :total_count, :integer
      # Zorunlu.
      field "assigned_count", :assigned_count, :integer
      # Zorunlu.
      field "available_count", :available_count, :integer
      # Zorunlu.
      field "liquid", :liquid, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # PromoCodeListList şeması.
    class PromoCodeListList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "PromoCodeList"]
    end

    # PromoCodesPage şeması.
    class PromoCodesPage < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "data", :data, [:array, "PromoCodesPageDataItem"]
    end

    # PromoCodesPageDataItem şeması.
    class PromoCodesPageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "delivery_id", :delivery_id, :string
      # Zorunlu.
      field "message_id", :message_id, :string
      # Zorunlu.
      field "assigned_at", :assigned_at, :string
    end

    # PromoCodeUploadResult şeması.
    class PromoCodeUploadResult < Pushizo::BaseModel
      # Zorunlu.
      field "list", :list, "PromoCodeList"
      # Zorunlu.
      field "added", :added, :integer
      # Zorunlu.
      field "skipped", :skipped, :integer
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

    # PublicFormSubmitDto şeması.
    class PublicFormSubmitDto < Pushizo::BaseModel
      # Zorunlu.
      field "values", :values, [:map, :any]
      field "external_id", :external_id, :string
      field "page_url", :page_url, :string
      field "language", :language, :string
    end

    # PublicSurveyResponseDto şeması.
    class PublicSurveyResponseDto < Pushizo::BaseModel
      # Zorunlu.
      field "answers", :answers, [:map, :any]
      field "external_id", :external_id, :string
    end

    # PutSiteSearchDocumentDto şeması.
    class PutSiteSearchDocumentDto < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "title", :title, :string
      field "content", :content, :string
      field "html", :html, :string
      field "language", :language, :string
    end

    # RecommendationConfig şeması.
    class RecommendationConfig < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "view_events", :view_events, [:array, :string]
      # Zorunlu.
      field "purchase_events", :purchase_events, [:array, :string]
      # Zorunlu.
      field "item_property", :item_property, :string
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu. Değerler: "idle", "queued", "running", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_items", :scored_items, :integer
      # Zorunlu.
      field "scored_users", :scored_users, :integer
    end

    # Recommendations şeması.
    class Recommendations < Pushizo::BaseModel
      # Zorunlu. Değerler: "personalized", "popular", "trending", "similar", "category", "recently_viewed", "new_arrivals".
      field "strategy", :strategy, :string
      # Zorunlu. Değerler: "personalized", "popular", "trending", "similar", "category", "recently_viewed", "new_arrivals".
      field "source", :source, :string
      # Zorunlu.
      field "data", :data, [:array, "CatalogItem"]
    end

    # RenderPreview şeması.
    class RenderPreview < Pushizo::BaseModel
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      field "content_card", :content_card, "RenderTemplateDtoContentContentCard"
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
      field "messenger_image_url", :messenger_image_url, :string
      field "messenger_buttons", :messenger_buttons, [:array, :any]
      field "ios_carousel", :ios_carousel, [:array, "RenderTemplateDtoContentIosCarouselItem"]
      field "android_live_update", :android_live_update, "RenderTemplateDtoContentAndroidLiveUpdate"
      field "voip", :voip, :boolean
      field "app_clip", :app_clip, :boolean
    end

    # RenderTemplateDtoContentAndroidLiveUpdate şeması.
    class RenderTemplateDtoContentAndroidLiveUpdate < Pushizo::BaseModel
      # Zorunlu.
      field "progress", :progress, :integer
      field "ongoing", :ongoing, :boolean
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

    # RenderTemplateDtoContentContentCard şeması.
    class RenderTemplateDtoContentContentCard < Pushizo::BaseModel
      # Zorunlu. Değerler: "classic", "captioned_image", "image_only".
      field "type", :type, :string
      field "pinned", :pinned, :boolean
      field "priority", :priority, :integer
      field "button_text", :button_text, [:map, :string]
    end

    # RenderTemplateDtoContentIosCarouselItem şeması.
    class RenderTemplateDtoContentIosCarouselItem < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "title", :title, :string
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

    # ReportResult şeması.
    class ReportResult < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "columns", :columns, [:array, "ReportResultColumnsItem"]
      # Zorunlu.
      field "rows", :rows, [:array, [:map, :any]]
      # Zorunlu.
      field "totals", :totals, [:map, :number]
      # Zorunlu.
      field "truncated", :truncated, :boolean
    end

    # ReportResultColumnsItem şeması.
    class ReportResultColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu. Değerler: "dimension", "metric".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "text", "date", "number", "percent".
      field "format", :format_value, :string
    end

    # ReportRunBodyDto şeması.
    class ReportRunBodyDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "deliveries", "events", "conversions".
      field "source", :source, :string
      # Zorunlu. Değerler: "sent", "delivered", "failed", "opened", "clicked", "delivery_rate", "open_rate", "click_rate", "failure_rate", "count", "unique_users", "value_sum", "value_avg", "conversions", "revenue".
      field "metrics", :metrics, [:array, :string]
      # Değerler: "day", "week", "month", "channel", "provider", "campaign", "status", "name", "source", "event_name", "kind".
      field "dimensions", :dimensions, [:array, :string]
      field "filters", :filters, [:map, [:array, :string]]
      field "sort", :sort, "ReportRunBodyDtoSort"
      field "limit", :limit, :integer
      field "days", :days, :integer
      field "from", :from, :string
      field "to", :to, :string
      # Değerler: "json", "csv".
      field "format", :format_value, :string
    end

    # ReportRunBodyDtoSort şeması.
    class ReportRunBodyDtoSort < Pushizo::BaseModel
      # Zorunlu.
      field "by", :by, :string
      # Değerler: "asc", "desc".
      field "direction", :direction, :string
    end

    # ReprocessQuarantineDto şeması.
    class ReprocessQuarantineDto < Pushizo::BaseModel
      field "ids", :ids, [:array, :string]
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

    # ReverseEtlRun şeması.
    class ReverseEtlRun < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "sync_id", :sync_id, :string
      # Zorunlu. Değerler: "schedule", "manual".
      field "trigger", :trigger, :string
      # Zorunlu. Değerler: "queued", "running", "succeeded", "failed".
      field "status", :status, :string
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

    # ReverseEtlRunPage şeması.
    class ReverseEtlRunPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ReverseEtlRun"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # ReverseEtlSync şeması.
    class ReverseEtlSync < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "snowflake", "bigquery", "postgres", "mysql", "s3", "google_sheets", "clickhouse", "sqlserver", "trino", "athena", "elasticsearch", "kafka", "pubsub".
      field "source", :source, :string
      # Zorunlu. Değerler: "event", "user".
      field "target", :target, :string
      # Zorunlu.
      field "config", :config, [:map, :any]
      # Zorunlu.
      field "credentials_hint", :credentials_hint, :string
      # Zorunlu. Değerler: "every_5_minutes", "hourly", "daily".
      field "schedule", :schedule, :string
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "active", "paused", "failing".
      field "status", :status, :string
      # Zorunlu.
      field "cursor", :cursor, :string
      # Zorunlu.
      field "consecutive_failures", :consecutive_failures, :integer
      # Zorunlu.
      field "last_error", :last_error, :string
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

    # ReverseEtlSyncList şeması.
    class ReverseEtlSyncList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "ReverseEtlSync"]
    end

    # RfmConfig şeması.
    class RfmConfig < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "event_names", :event_names, [:array, :string]
      # Zorunlu.
      field "value_property", :value_property, :string
      # Zorunlu.
      field "use_monetary", :use_monetary, :boolean
      # Zorunlu.
      field "window_days", :window_days, :integer
      # Zorunlu. Değerler: "idle", "queued", "running", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "first_computed_at", :first_computed_at, :string
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "scored_users", :scored_users, :integer
    end

    # RfmOverview şeması.
    class RfmOverview < Pushizo::BaseModel
      # Zorunlu.
      field "total", :total, :integer
      # Zorunlu.
      field "low_population", :low_population, :boolean
      # Zorunlu.
      field "last_computed_at", :last_computed_at, :string
      # Zorunlu.
      field "segments", :segments, [:array, "RfmOverviewSegmentsItem"]
    end

    # RfmOverviewSegmentsItem şeması.
    class RfmOverviewSegmentsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "champions", "loyal", "potential", "new", "promising", "need_attention", "about_to_sleep", "at_risk", "cant_lose", "hibernating", "lost".
      field "segment", :segment, :string
      # Zorunlu.
      field "users", :users, :integer
      # Zorunlu.
      field "share", :share, :number
      # Zorunlu.
      field "avg_recency_days", :avg_recency_days, :number
      # Zorunlu.
      field "avg_frequency", :avg_frequency, :number
      # Zorunlu.
      field "avg_monetary", :avg_monetary, :number
    end

    # RfmTransitions şeması.
    class RfmTransitions < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "first_computed_at", :first_computed_at, :string
      # Zorunlu.
      field "transitions", :transitions, [:array, "RfmTransitionsTransitionsItem"]
    end

    # RfmTransitionsTransitionsItem şeması.
    class RfmTransitionsTransitionsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "champions", "loyal", "potential", "new", "promising", "need_attention", "about_to_sleep", "at_risk", "cant_lose", "hibernating", "lost".
      field "from", :from, :string
      # Zorunlu. Değerler: "champions", "loyal", "potential", "new", "promising", "need_attention", "about_to_sleep", "at_risk", "cant_lose", "hibernating", "lost".
      field "to", :to, :string
      # Zorunlu.
      field "users", :users, :integer
    end

    # RfmUsersPage şeması.
    class RfmUsersPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "RfmUsersPageDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
    end

    # RfmUsersPageDataItem şeması.
    class RfmUsersPageDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu. Değerler: "champions", "loyal", "potential", "new", "promising", "need_attention", "about_to_sleep", "at_risk", "cant_lose", "hibernating", "lost".
      field "segment", :segment, :string
      # Zorunlu.
      field "r", :r, :integer
      # Zorunlu.
      field "f", :f, :integer
      # Zorunlu.
      field "m", :m, :integer
      # Zorunlu.
      field "recency_days", :recency_days, :integer
      # Zorunlu.
      field "frequency", :frequency, :integer
      # Zorunlu.
      field "monetary", :monetary, :number
      # Zorunlu.
      field "last_event_at", :last_event_at, :string
      # Zorunlu.
      field "segment_since", :segment_since, :string
    end

    # RunSqlQueryDto şeması.
    class RunSqlQueryDto < Pushizo::BaseModel
      # Zorunlu.
      field "query", :query, :string
      field "row_limit", :row_limit, :integer
      field "timeout_ms", :timeout_ms, :integer
    end

    # SavedReport şeması.
    class SavedReport < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "definition", :definition, "SavedReportDefinition"
      # Zorunlu.
      field "created_by", :created_by, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SavedReportDefinition şeması.
    class SavedReportDefinition < Pushizo::BaseModel
      # Zorunlu. Değerler: "deliveries", "events", "conversions".
      field "source", :source, :string
      # Zorunlu. Değerler: "sent", "delivered", "failed", "opened", "clicked", "delivery_rate", "open_rate", "click_rate", "failure_rate", "count", "unique_users", "value_sum", "value_avg", "conversions", "revenue".
      field "metrics", :metrics, [:array, :string]
      # Zorunlu. Değerler: "day", "week", "month", "channel", "provider", "campaign", "status", "name", "source", "event_name", "kind".
      field "dimensions", :dimensions, [:array, :string]
      # Zorunlu.
      field "filters", :filters, [:map, [:array, :string]]
      field "sort", :sort, "SavedReportDefinitionSort"
      # Zorunlu.
      field "limit", :limit, :integer
      field "days", :days, :integer
      field "from", :from, :string
      field "to", :to, :string
    end

    # SavedReportDefinitionSort şeması.
    class SavedReportDefinitionSort < Pushizo::BaseModel
      # Zorunlu.
      field "by", :by, :string
      # Zorunlu. Değerler: "asc", "desc".
      field "direction", :direction, :string
    end

    # SavedReportList şeması.
    class SavedReportList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SavedReport"]
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
      # Zorunlu.
      field "sql", :sql, "SegmentSql"
      # Zorunlu.
      field "warehouse", :warehouse, "SegmentWarehouse"
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

    # SegmentSql şeması.
    class SegmentSql < Pushizo::BaseModel
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
      # Zorunlu.
      field "refreshed_at", :refreshed_at, :string
      # Zorunlu.
      field "member_count", :member_count, :integer
      # Zorunlu.
      field "last_error", :last_error, :string
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

    # SegmentWarehouse şeması.
    class SegmentWarehouse < Pushizo::BaseModel
      # Zorunlu.
      field "connection_id", :connection_id, :string
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "id_column", :id_column, :string
      # Zorunlu. Değerler: "external_id", "user_id".
      field "id_type", :id_type, :string
      # Zorunlu.
      field "limits", :limits, "SegmentWarehouseLimits"
      # Zorunlu.
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
      # Zorunlu. Değerler: "queued", "failed", "ok", "never".
      field "refresh_state", :refresh_state, :string
      # Zorunlu.
      field "refresh_requested_at", :refresh_requested_at, :string
      # Zorunlu.
      field "refreshed_at", :refreshed_at, :string
      # Zorunlu.
      field "member_count", :member_count, :integer
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "bytes_processed", :bytes_processed, :number
    end

    # SegmentWarehouseLimits şeması.
    class SegmentWarehouseLimits < Pushizo::BaseModel
      # Zorunlu.
      field "timeout_seconds", :timeout_seconds, :integer
      # Zorunlu.
      field "max_rows", :max_rows, :integer
      # Zorunlu.
      field "max_bytes_billed", :max_bytes_billed, :number
      # Zorunlu. Değerler: "X-Small", "Small", "Medium", "Large", "X-Large", "2X-Large", "3X-Large", "4X-Large", "5X-Large", "6X-Large".
      field "max_warehouse_size", :max_warehouse_size, :string
    end

    # SelectWinnerDto şeması.
    class SelectWinnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # SetMemberDto şeması.
    class SetMemberDto < Pushizo::BaseModel
      field "role", :role, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channel", :channel, :string
      # Zorunlu.
      field "opted_in", :opted_in, :boolean
    end

    # SiteSearchCrawlRequest şeması.
    class SiteSearchCrawlRequest < Pushizo::BaseModel
      # Zorunlu.
      field "queued", :queued, :boolean
      # Zorunlu.
      field "source", :source, "SiteSearchSource"
    end

    # SiteSearchDocument şeması.
    class SiteSearchDocument < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "source_id", :source_id, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "chunks", :chunks, :integer
      # Zorunlu.
      field "chars", :chars, :integer
      # Zorunlu.
      field "indexed_at", :indexed_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SiteSearchDocumentPage şeması.
    class SiteSearchDocumentPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SiteSearchDocument"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SiteSearchDocumentResult şeması.
    class SiteSearchDocumentResult < Pushizo::BaseModel
      # Zorunlu. Değerler: "created", "updated", "unchanged".
      field "outcome", :outcome, :string
      # Zorunlu.
      field "document", :document, "SiteSearchDocument"
    end

    # SiteSearchOverview şeması.
    class SiteSearchOverview < Pushizo::BaseModel
      # Zorunlu.
      field "settings", :settings, "SiteSearchOverviewSettings"
      # Zorunlu.
      field "index", :index, "SiteSearchOverviewIndex"
      # Zorunlu.
      field "usage", :usage, "SiteSearchOverviewUsage"
      # Zorunlu.
      field "ai", :ai, "SiteSearchOverviewAi"
    end

    # SiteSearchOverviewAi şeması.
    class SiteSearchOverviewAi < Pushizo::BaseModel
      # Zorunlu.
      field "available", :available, :boolean
      # Zorunlu. Değerler: "disabled", "unavailable", "cap_reached".
      field "reason", :reason, :string
    end

    # SiteSearchOverviewIndex şeması.
    class SiteSearchOverviewIndex < Pushizo::BaseModel
      # Zorunlu.
      field "documents", :documents, :integer
      # Zorunlu.
      field "chunks", :chunks, :integer
      # Zorunlu.
      field "sources", :sources, :integer
      # Zorunlu.
      field "last_indexed_at", :last_indexed_at, :string
    end

    # SiteSearchOverviewSettings şeması.
    class SiteSearchOverviewSettings < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "ai_answers", :ai_answers, :boolean
      # Zorunlu.
      field "allowed_origins", :allowed_origins, [:array, :string]
      # Zorunlu.
      field "language", :language, :string
      # Zorunlu.
      field "text_search_config", :text_search_config, :string
      # Zorunlu.
      field "monthly_token_cap", :monthly_token_cap, :integer
      # Zorunlu.
      field "query_retention_days", :query_retention_days, :integer
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SiteSearchOverviewUsage şeması.
    class SiteSearchOverviewUsage < Pushizo::BaseModel
      # Zorunlu.
      field "tokens_this_month", :tokens_this_month, :integer
      # Zorunlu.
      field "monthly_token_cap", :monthly_token_cap, :integer
      # Zorunlu.
      field "period_start", :period_start, :string
    end

    # SiteSearchReport şeması.
    class SiteSearchReport < Pushizo::BaseModel
      # Zorunlu.
      field "period_days", :period_days, :integer
      # Zorunlu.
      field "searches", :searches, :integer
      # Zorunlu.
      field "zero_results", :zero_results, :integer
      # Zorunlu.
      field "click_through_rate", :click_through_rate, :number
      # Zorunlu.
      field "answers_requested", :answers_requested, :integer
      # Zorunlu.
      field "answered", :answered, :integer
      # Zorunlu.
      field "not_found", :not_found, :integer
      # Zorunlu.
      field "answer_fallbacks", :answer_fallbacks, :integer
      # Zorunlu.
      field "tokens", :tokens, :integer
      # Zorunlu.
      field "top_queries", :top_queries, [:array, "SiteSearchReportTopQueriesItem"]
      # Zorunlu.
      field "zero_result_queries", :zero_result_queries, [:array, "SiteSearchReportZeroResultQueriesItem"]
      # Zorunlu.
      field "daily", :daily, [:array, "SiteSearchReportDailyItem"]
    end

    # SiteSearchReportDailyItem şeması.
    class SiteSearchReportDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "searches", :searches, :integer
      # Zorunlu.
      field "zero_results", :zero_results, :integer
      # Zorunlu.
      field "answered", :answered, :integer
    end

    # SiteSearchReportTopQueriesItem şeması.
    class SiteSearchReportTopQueriesItem < Pushizo::BaseModel
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "searches", :searches, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "avg_results", :avg_results, :number
    end

    # SiteSearchReportZeroResultQueriesItem şeması.
    class SiteSearchReportZeroResultQueriesItem < Pushizo::BaseModel
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "searches", :searches, :integer
    end

    # SiteSearchSource şeması.
    class SiteSearchSource < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "sitemap", "urls".
      field "kind", :kind, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "urls", :urls, [:array, :string]
      # Zorunlu.
      field "max_pages", :max_pages, :integer
      # Zorunlu.
      field "refresh_hours", :refresh_hours, :integer
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu. Değerler: "idle", "queued", "crawling", "ok", "partial", "failed".
      field "status", :status, :string
      # Zorunlu.
      field "documents", :documents, :integer
      # Zorunlu.
      field "crawl_requested_at", :crawl_requested_at, :string
      # Zorunlu.
      field "last_crawled_at", :last_crawled_at, :string
      # Zorunlu.
      field "next_crawl_at", :next_crawl_at, :string
      # Zorunlu.
      field "last_error", :last_error, :string
      # Zorunlu.
      field "stats", :stats, "SiteSearchSourceStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SiteSearchSourceList şeması.
    class SiteSearchSourceList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SiteSearchSource"]
    end

    # SiteSearchSourceStats şeması.
    class SiteSearchSourceStats < Pushizo::BaseModel
      # Zorunlu.
      field "pages_found", :pages_found, :integer
      # Zorunlu.
      field "pages_indexed", :pages_indexed, :integer
      # Zorunlu.
      field "pages_unchanged", :pages_unchanged, :integer
      # Zorunlu.
      field "pages_skipped", :pages_skipped, :integer
      # Zorunlu.
      field "pages_failed", :pages_failed, :integer
      # Zorunlu.
      field "pages_removed", :pages_removed, :integer
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
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
      # Zorunlu. Değerler: "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # SmsVerification şeması.
    class SmsVerification < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "expires_at", :expires_at, :string
    end

    # SmsVerificationCheck şeması.
    class SmsVerificationCheck < Pushizo::BaseModel
      # Zorunlu.
      field "verified", :verified, :boolean
    end

    # SqlQueryResult şeması.
    class SqlQueryResult < Pushizo::BaseModel
      # Zorunlu.
      field "run_id", :run_id, :string
      # Zorunlu.
      field "columns", :columns, [:array, "SqlQueryResultColumnsItem"]
      # Zorunlu.
      field "rows", :rows, [:array, [:array, :any]]
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
    end

    # SqlQueryResultColumnsItem şeması.
    class SqlQueryResultColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "text", "integer", "number", "boolean", "timestamp", "json", "unknown".
      field "type", :type, :string
    end

    # SqlRunList şeması.
    class SqlRunList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SqlRunListDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SqlRunListDataItem şeması.
    class SqlRunListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "segment_id", :segment_id, :string
      # Zorunlu. Değerler: "panel", "api", "schedule".
      field "source", :source, :string
      # Zorunlu.
      field "actor_id", :actor_id, :string
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "query_hash", :query_hash, :string
      # Zorunlu. Değerler: "ok", "rejected", "timeout", "failed".
      field "status", :status, :string
      # Zorunlu. Değerler: "empty", "too_long", "syntax", "multiple_statements", "not_select", "forbidden_relation", "forbidden_function", "forbidden_construct", "forbidden_type".
      field "reason", :reason, :string
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SqlSchema şeması.
    class SqlSchema < Pushizo::BaseModel
      # Zorunlu.
      field "views", :views, [:array, "SqlSchemaViewsItem"]
      # Zorunlu.
      field "limits", :limits, "SqlSchemaLimits"
      # Zorunlu.
      field "refresh_intervals", :refresh_intervals, [:array, :integer]
    end

    # SqlSchemaLimits şeması.
    class SqlSchemaLimits < Pushizo::BaseModel
      # Zorunlu.
      field "query_max", :query_max, :integer
      # Zorunlu.
      field "row_limit_default", :row_limit_default, :integer
      # Zorunlu.
      field "row_limit_max", :row_limit_max, :integer
      # Zorunlu.
      field "timeout_default_ms", :timeout_default_ms, :integer
      # Zorunlu.
      field "timeout_max_ms", :timeout_max_ms, :integer
      # Zorunlu.
      field "segment_max_members", :segment_max_members, :integer
    end

    # SqlSchemaViewsItem şeması.
    class SqlSchemaViewsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "columns", :columns, [:array, "SqlSchemaViewsItemColumnsItem"]
    end

    # SqlSchemaViewsItemColumnsItem şeması.
    class SqlSchemaViewsItemColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "text", "integer", "number", "boolean", "timestamp", "json".
      field "type", :type, :string
    end

    # SqlSegmentList şeması.
    class SqlSegmentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Segment"]
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

    # StartVerifyDto şeması.
    class StartVerifyDto < Pushizo::BaseModel
      # Zorunlu.
      field "phone", :phone, :string
      field "locale", :locale, :string
    end

    # Subscription şeması.
    class Subscription < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "phone", "watch".
      field "form_factor", :form_factor, :string
      # Değerler: "alert", "voip", "app_clip".
      field "push_kind", :push_kind, :string
      field "manufacturer", :manufacturer, :string
      field "brand", :brand, :string
      field "rom", :rom, :string
      field "rom_version", :rom_version, :string
      field "delivery", :delivery, "SubscriptionDeviceDelivery"
    end

    # SubscriptionDeviceDelivery şeması.
    class SubscriptionDeviceDelivery < Pushizo::BaseModel
      field "battery_optimization_exempt", :battery_optimization_exempt, :boolean
      field "background_restricted", :background_restricted, :boolean
      field "channel_blocked", :channel_blocked, :boolean
      field "power_save_mode", :power_save_mode, :boolean
      field "data_saver", :data_saver, :boolean
      # Değerler: "exempted", "active", "working_set", "frequent", "rare", "restricted".
      field "standby_bucket", :standby_bucket, :string
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
      # Zorunlu. Değerler: "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # Survey şeması.
    class Survey < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "draft", "active", "closed".
      field "status", :status, :string
      # Zorunlu.
      field "questions", :questions, [:array, "SurveyQuestionsItem"]
      # Zorunlu.
      field "settings", :settings, "SurveySettings"
      # Zorunlu.
      field "in_app_message_id", :in_app_message_id, :string
      # Zorunlu.
      field "stats", :stats, "SurveyStats"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # SurveyPage şeması.
    class SurveyPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Survey"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SurveyQuestionsItem şeması.
    class SurveyQuestionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "nps", "csat", "single_choice", "multiple_choice", "text".
      field "type", :type, :string
      # Zorunlu.
      field "text", :text, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "SurveyQuestionsItemOptionsItem"]
      field "low_label", :low_label, [:map, :string]
      field "high_label", :high_label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
    end

    # SurveyQuestionsItemOptionsItem şeması.
    class SurveyQuestionsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # SurveyReport şeması.
    class SurveyReport < Pushizo::BaseModel
      # Zorunlu.
      field "survey_id", :survey_id, :string
      # Zorunlu.
      field "days", :days, :integer
      # Zorunlu.
      field "responses", :responses, :integer
      # Zorunlu.
      field "nps", :nps, "SurveyReportNps"
      # Zorunlu.
      field "csat", :csat, "SurveyReportCsat"
      # Zorunlu.
      field "trend", :trend, [:array, "SurveyReportTrendItem"]
      # Zorunlu.
      field "channels", :channels, [:map, :integer]
      # Zorunlu.
      field "questions", :questions, [:array, "SurveyReportQuestionsItem"]
    end

    # SurveyReportCsat şeması.
    class SurveyReportCsat < Pushizo::BaseModel
      # Zorunlu.
      field "responses", :responses, :integer
      # Zorunlu.
      field "average", :average, :number
      # Zorunlu.
      field "distribution", :distribution, [:map, :integer]
    end

    # SurveyReportNps şeması.
    class SurveyReportNps < Pushizo::BaseModel
      # Zorunlu.
      field "responses", :responses, :integer
      # Zorunlu.
      field "promoters", :promoters, :integer
      # Zorunlu.
      field "passives", :passives, :integer
      # Zorunlu.
      field "detractors", :detractors, :integer
      # Zorunlu.
      field "nps", :nps, :number
    end

    # SurveyReportQuestionsItem şeması.
    class SurveyReportQuestionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "nps", "csat", "single_choice", "multiple_choice", "text".
      field "type", :type, :string
      # Zorunlu.
      field "counts", :counts, [:map, :integer]
    end

    # SurveyReportTrendItem şeması.
    class SurveyReportTrendItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "responses", :responses, :integer
      # Zorunlu.
      field "promoters", :promoters, :integer
      # Zorunlu.
      field "passives", :passives, :integer
      # Zorunlu.
      field "detractors", :detractors, :integer
      # Zorunlu.
      field "nps", :nps, :number
    end

    # SurveyResponse şeması.
    class SurveyResponse < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "survey_id", :survey_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "visitor_id", :visitor_id, :string
      # Zorunlu. Değerler: "in_app", "web", "email", "api", "sdk".
      field "channel", :channel, :string
      # Zorunlu.
      field "answers", :answers, [:map, :any]
      # Zorunlu.
      field "nps_score", :nps_score, :integer
      # Zorunlu. Değerler: "promoter", "passive", "detractor".
      field "nps_category", :nps_category, :string
      # Zorunlu.
      field "csat_score", :csat_score, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
    end

    # SurveyResponsePage şeması.
    class SurveyResponsePage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "SurveyResponse"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # SurveyResponseResult şeması.
    class SurveyResponseResult < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "response_id", :response_id, :string
      # Zorunlu.
      field "duplicate", :duplicate, :boolean
      # Zorunlu.
      field "thank_you", :thank_you, :string
    end

    # SurveySettings şeması.
    class SurveySettings < Pushizo::BaseModel
      field "thank_you", :thank_you, [:map, :string]
      field "submit_label", :submit_label, [:map, :string]
      field "write_properties", :write_properties, :boolean
      field "allow_multiple", :allow_multiple, :boolean
      field "default_language", :default_language, :string
    end

    # SurveyStats şeması.
    class SurveyStats < Pushizo::BaseModel
      # Zorunlu.
      field "responses", :responses, :integer
      # Zorunlu.
      field "nps", :nps, :number
      # Zorunlu.
      field "last_response_at", :last_response_at, :string
    end

    # SurveyStatusDto şeması.
    class SurveyStatusDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "draft", "active", "closed".
      field "status", :status, :string
    end

    # SyncAdAudienceDto şeması.
    class SyncAdAudienceDto < Pushizo::BaseModel
      field "full", :full, :boolean
    end

    # Template şeması.
    class Template < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # TestPushDto şeması.
    class TestPushDto < Pushizo::BaseModel
      field "subscription_ids", :subscription_ids, [:array, :string]
      field "headings", :headings, [:map, :string]
      # Zorunlu.
      field "contents", :contents, [:map, :string]
      field "url", :url, :string
      field "data", :data, [:map, :string]
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

    # UninstallReport şeması.
    class UninstallReport < Pushizo::BaseModel
      # Zorunlu.
      field "from", :from, :string
      # Zorunlu.
      field "to", :to, :string
      # Zorunlu.
      field "totals", :totals, "UninstallReportTotals"
      # Zorunlu.
      field "previous", :previous, "UninstallReportPrevious"
      # Zorunlu.
      field "rows", :rows, [:array, "UninstallReportRowsItem"]
      # Zorunlu.
      field "by_channel", :by_channel, [:array, "UninstallReportByChannelItem"]
      # Zorunlu.
      field "last_messages", :last_messages, [:array, "UninstallReportLastMessagesItem"]
    end

    # UninstallReportByChannelItem şeması.
    class UninstallReportByChannelItem < Pushizo::BaseModel
      # Zorunlu.
      field "channel", :channel, :string
      # Zorunlu.
      field "uninstalls", :uninstalls, :integer
      # Zorunlu.
      field "active", :active, :integer
    end

    # UninstallReportLastMessagesItem şeması.
    class UninstallReportLastMessagesItem < Pushizo::BaseModel
      # Zorunlu.
      field "campaign_id", :campaign_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "uninstalls", :uninstalls, :integer
    end

    # UninstallReportPrevious şeması.
    class UninstallReportPrevious < Pushizo::BaseModel
      # Zorunlu.
      field "uninstalls", :uninstalls, :integer
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # UninstallReportRowsItem şeması.
    class UninstallReportRowsItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "uninstalls", :uninstalls, :integer
    end

    # UninstallReportTotals şeması.
    class UninstallReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "uninstalls", :uninstalls, :integer
      # Zorunlu.
      field "active", :active, :integer
      # Zorunlu.
      field "rate", :rate, :number
    end

    # UpdateAdAudienceDto şeması.
    class UpdateAdAudienceDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "segment_id", :segment_id, :string
      # Değerler: "email", "phone", "maid".
      field "identifiers", :identifiers, [:array, :string]
      field "sync_interval_minutes", :sync_interval_minutes, :integer
      # Değerler: "active", "paused".
      field "status", :status, :string
    end

    # UpdateAdCampaignDto şeması.
    class UpdateAdCampaignDto < Pushizo::BaseModel
      # Değerler: "active", "paused".
      field "status", :status, :string
      field "daily_budget", :daily_budget, :any
    end

    # UpdateAffinityConfigDto şeması.
    class UpdateAffinityConfigDto < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "attributes", :attributes_value, [:array, :string]
      # Zorunlu.
      field "events", :events, [:map, :number]
      field "window_days", :window_days, :integer
      field "half_life_days", :half_life_days, :integer
    end

    # UpdateAiAgentDto şeması.
    class UpdateAiAgentDto < Pushizo::BaseModel
      field "name", :name, :string
      field "enabled", :enabled, :boolean
      # Değerler: "whatsapp", "sms", "rcs", "telegram", "viber", "chat".
      field "channels", :channels, [:array, :string]
      field "instructions", :instructions, :string
      field "faq", :faq, [:array, "UpdateAiAgentDtoFaqItem"]
      field "tools", :tools, [:array, "UpdateAiAgentDtoToolsItem"]
      field "handoff", :handoff, "UpdateAiAgentDtoHandoff"
      field "limits", :limits, "UpdateAiAgentDtoLimits"
      field "ai_sentiment", :ai_sentiment, :boolean
    end

    # UpdateAiAgentDtoFaqItem şeması.
    class UpdateAiAgentDtoFaqItem < Pushizo::BaseModel
      # Zorunlu.
      field "question", :question, :string
      # Zorunlu.
      field "answer", :answer, :string
    end

    # UpdateAiAgentDtoHandoff şeması.
    class UpdateAiAgentDtoHandoff < Pushizo::BaseModel
      field "keywords", :keywords, [:array, :string]
      field "max_bot_replies", :max_bot_replies, :integer
      field "on_negative_sentiment", :on_negative_sentiment, :boolean
      field "message", :message, :string
    end

    # UpdateAiAgentDtoLimits şeması.
    class UpdateAiAgentDtoLimits < Pushizo::BaseModel
      field "monthly_token_cap", :monthly_token_cap, :integer
      field "max_steps", :max_steps, :integer
    end

    # UpdateAiAgentDtoToolsItem şeması.
    class UpdateAiAgentDtoToolsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "url", :url, :string
      field "params", :params, [:array, "UpdateAiAgentDtoToolsItemParamsItem"]
    end

    # UpdateAiAgentDtoToolsItemParamsItem şeması.
    class UpdateAiAgentDtoToolsItemParamsItem < Pushizo::BaseModel
      # Zorunlu.
      field "name", :name, :string
      field "description", :description, :string
      field "required", :required, :boolean
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
      field "brandKit", :brand_kit, "UpdateAppDtoSettingsBrandKit"
      field "defaultTtlSeconds", :default_ttl_seconds, :integer
      field "identityVerificationRequired", :identity_verification_required, :boolean
      # Değerler: "off", "full", "masked".
      field "ipCapture", :ip_capture, :string
      field "ipRetentionDays", :ip_retention_days, :integer
      field "adaptiveFrequency", :adaptive_frequency, "UpdateAppDtoSettingsAdaptiveFrequency"
      field "allowedOrigins", :allowed_origins, [:array, :string]
      field "campaignApprovalRequired", :campaign_approval_required, :boolean
      field "webPush", :web_push, "UpdateAppDtoSettingsWebPush"
      field "onboarding", :onboarding, "UpdateAppDtoSettingsOnboarding"
      field "sdkSetup", :sdk_setup, "UpdateAppDtoSettingsSdkSetup"
    end

    # UpdateAppDtoSettingsAdaptiveFrequency şeması.
    class UpdateAppDtoSettingsAdaptiveFrequency < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "min", :min, :integer
      # Zorunlu.
      field "max", :max, :integer
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

    # UpdateAppDtoSettingsBrandKit şeması.
    class UpdateAppDtoSettingsBrandKit < Pushizo::BaseModel
      field "website_url", :website_url, :string
      field "name", :name, :string
      field "primary_color", :primary_color, :string
      field "accent_color", :accent_color, :string
      field "font", :font, :string
      field "logo_url", :logo_url, :string
      field "tone", :tone, :string
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
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Değerler: "ios", "android", "huawei", "web", "amazon", "windows", "email", "sms".
      field "platforms", :platforms, [:array, :string]
      # Değerler: "native", "flutter", "react-native", "expo", "kmp", "unity", "capacitor", "cordova", "maui".
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

    # UpdateAppFlagDto şeması.
    class UpdateAppFlagDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      # Değerler: "boolean", "string", "number", "json".
      field "value_type", :value_type, :string
      field "on_value", :on_value, :any
      field "off_value", :off_value, :any
      field "rollout_percent", :rollout_percent, :integer
      field "segment_id", :segment_id, :string
      field "rollout_schedule", :rollout_schedule, [:array, "UpdateAppFlagDtoRolloutScheduleItem"]
    end

    # UpdateAppFlagDtoRolloutScheduleItem şeması.
    class UpdateAppFlagDtoRolloutScheduleItem < Pushizo::BaseModel
      # Zorunlu.
      field "at", :at, :string
      # Zorunlu.
      field "percent", :percent, :integer
    end

    # UpdateBudgetAlertRuleDto şeması.
    class UpdateBudgetAlertRuleDto < Pushizo::BaseModel
      field "name", :name, :string
      field "ad_account_id", :ad_account_id, :string
      field "campaign_external_id", :campaign_external_id, :string
      field "threshold", :threshold, :number
      field "window_days", :window_days, :integer
      field "recipients", :recipients, [:array, :string]
      field "enabled", :enabled, :boolean
    end

    # UpdateCatalogDto şeması.
    class UpdateCatalogDto < Pushizo::BaseModel
      field "description", :description, :string
      field "currency", :currency, :string
    end

    # UpdateCategoryDto şeması.
    class UpdateCategoryDto < Pushizo::BaseModel
      field "name", :name, [:map, :string]
      field "description", :description, [:map, :string]
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channels", :channels, [:array, :string]
      field "default_opted_in", :default_opted_in, :boolean
      field "position", :position, :integer
    end

    # UpdateChannelScoreConfigDto şeması.
    class UpdateChannelScoreConfigDto < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "window_days", :window_days, :integer
      field "min_sends", :min_sends, :integer
      field "count_email_opens", :count_email_opens, :boolean
    end

    # UpdateCompanyDto şeması.
    class UpdateCompanyDto < Pushizo::BaseModel
      field "external_id", :external_id, :string
      field "name", :name, :string
      field "domain", :domain, :string
      field "properties", :properties, [:map, :any]
    end

    # UpdateContentTableDto şeması.
    class UpdateContentTableDto < Pushizo::BaseModel
      field "description", :description, :string
    end

    # UpdateCustomAgentDto şeması.
    class UpdateCustomAgentDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      field "instructions", :instructions, :string
      # Değerler: "list_segments", "campaign_performance", "delivery_summary", "create_segment_draft", "create_campaign_draft".
      field "tools", :tools, [:array, :string]
      field "schedule", :schedule, "UpdateCustomAgentDtoSchedule"
      field "limits", :limits, "UpdateCustomAgentDtoLimits"
    end

    # UpdateCustomAgentDtoLimits şeması.
    class UpdateCustomAgentDtoLimits < Pushizo::BaseModel
      field "max_steps", :max_steps, :integer
      field "monthly_token_cap", :monthly_token_cap, :integer
    end

    # UpdateCustomAgentDtoSchedule şeması.
    class UpdateCustomAgentDtoSchedule < Pushizo::BaseModel
      # Zorunlu.
      field "cron", :cron, :string
      field "timezone", :timezone, :string
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

    # UpdateDataSourceDto şeması.
    class UpdateDataSourceDto < Pushizo::BaseModel
      field "name", :name, :string
      field "enabled", :enabled, :boolean
      # Değerler: "signature", "token".
      field "auth_mode", :auth_mode, :string
      field "mapping", :mapping, "UpdateDataSourceDtoMapping"
      field "config", :config, "UpdateDataSourceDtoConfig"
      field "auth_value", :auth_value, :string
    end

    # UpdateDataSourceDtoConfig şeması.
    class UpdateDataSourceDtoConfig < Pushizo::BaseModel
      field "url", :url, :string
      # Değerler: "GET", "POST".
      field "method", :method_value, :string
      field "headers", :headers, [:map, :string]
      field "body", :body, :string
      field "interval_minutes", :interval_minutes, :integer
      field "auth_header", :auth_header, :string
      field "next_cursor_path", :next_cursor_path, :string
      field "cursor_param", :cursor_param, :string
      field "resume_cursor", :resume_cursor, :boolean
    end

    # UpdateDataSourceDtoMapping şeması.
    class UpdateDataSourceDtoMapping < Pushizo::BaseModel
      field "records_path", :records_path, :string
      field "event_name", :event_name, :string
      field "event_name_path", :event_name_path, :string
      field "external_id_path", :external_id_path, :string
      field "occurred_at_path", :occurred_at_path, :string
      field "value_path", :value_path, :string
      field "event_id_path", :event_id_path, :string
      field "properties_path", :properties_path, :string
      field "tags_path", :tags_path, :string
    end

    # UpdateDataTransformDto şeması.
    class UpdateDataTransformDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "enabled", :enabled, :boolean
      field "position", :position, :integer
      field "rules", :rules, [:array, :any]
      field "code", :code, :string
      # Değerler: "sdk", "api", "import", "system", "webhook_source", "pull_source".
      field "sources", :sources, [:array, :string]
      field "event_names", :event_names, [:array, :string]
    end

    # UpdateDecisionAgentDto şeması.
    class UpdateDecisionAgentDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "active", "paused".
      field "status", :status, :string
      field "reward_events", :reward_events, [:array, :string]
      field "reward_window_hours", :reward_window_hours, :integer
      field "holdout_percent", :holdout_percent, :integer
    end

    # UpdateFormDto şeması.
    class UpdateFormDto < Pushizo::BaseModel
      field "name", :name, :string
      field "fields", :fields_value, [:array, "UpdateFormDtoFieldsItem"]
      field "settings", :settings, "UpdateFormDtoSettings"
      # Değerler: "active", "archived".
      field "status", :status, :string
    end

    # UpdateFormDtoFieldsItem şeması.
    class UpdateFormDtoFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "email", "phone", "first_name", "last_name", "full_name", "text", "textarea", "select", "radio", "checkbox", "consent".
      field "type", :type, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "UpdateFormDtoFieldsItemOptionsItem"]
      field "maps_to", :maps_to, :string
      field "max_length", :max_length, :integer
      field "policy_url", :policy_url, :string
    end

    # UpdateFormDtoFieldsItemOptionsItem şeması.
    class UpdateFormDtoFieldsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # UpdateFormDtoSettings şeması.
    class UpdateFormDtoSettings < Pushizo::BaseModel
      field "submit_label", :submit_label, [:map, :string]
      field "success_message", :success_message, [:map, :string]
      field "redirect_url", :redirect_url, :string
      field "tags", :tags, [:map, :string]
      field "subscribe", :subscribe, "UpdateFormDtoSettingsSubscribe"
      field "double_opt_in", :double_opt_in, "UpdateFormDtoSettingsDoubleOptIn"
      field "event_name", :event_name, :string
      field "captcha", :captcha, :boolean
      field "default_language", :default_language, :string
    end

    # UpdateFormDtoSettingsDoubleOptIn şeması.
    class UpdateFormDtoSettingsDoubleOptIn < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "subject", :subject, [:map, :string]
      field "body", :body, [:map, :string]
    end

    # UpdateFormDtoSettingsSubscribe şeması.
    class UpdateFormDtoSettingsSubscribe < Pushizo::BaseModel
      field "email", :email, :boolean
      field "sms", :sms, :boolean
    end

    # UpdateGeofenceDto şeması.
    class UpdateGeofenceDto < Pushizo::BaseModel
      field "name", :name, :string
      field "lat", :lat, :number
      field "lng", :lng, :number
      field "radius_m", :radius_m, :integer
      field "cooldown_minutes", :cooldown_minutes, :integer
      field "enabled", :enabled, :boolean
    end

    # UpdateGlobalControlDto şeması.
    class UpdateGlobalControlDto < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "percent", :percent, :integer
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
      field "placement", :placement, :string
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
      field "global_control_exempt", :global_control_exempt, :boolean
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
      # Değerler: "sms", "whatsapp", "rcs", "telegram", "viber".
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

    # UpdateLandingPageDto şeması.
    class UpdateLandingPageDto < Pushizo::BaseModel
      field "name", :name, :string
      field "slug", :slug, :string
      field "document", :document, "UpdateLandingPageDtoDocument"
      field "seo", :seo, "UpdateLandingPageDtoSeo"
      field "settings", :settings, "UpdateLandingPageDtoSettings"
      field "custom_domain_id", :custom_domain_id, :string
    end

    # UpdateLandingPageDtoDocument şeması.
    class UpdateLandingPageDtoDocument < Pushizo::BaseModel
      # Zorunlu. Değerler: 1.
      field "version", :version, :number
      # Zorunlu.
      field "settings", :settings, "UpdateLandingPageDtoDocumentSettings"
      # Zorunlu.
      field "sections", :sections, [:array, "UpdateLandingPageDtoDocumentSectionsItem"]
    end

    # UpdateLandingPageDtoDocumentSectionsItem şeması.
    class UpdateLandingPageDtoDocumentSectionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "section".
      field "type", :type, :string
      field "background_color", :background_color, :string
      field "background_image", :background_image, :string
      field "padding", :padding, "UpdateLandingPageDtoDocumentSectionsItemPadding"
      field "stack_on_mobile", :stack_on_mobile, :boolean
      # Zorunlu.
      field "columns", :columns, [:array, "UpdateLandingPageDtoDocumentSectionsItemColumnsItem"]
    end

    # UpdateLandingPageDtoDocumentSectionsItemColumnsItem şeması.
    class UpdateLandingPageDtoDocumentSectionsItemColumnsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      field "width_percent", :width_percent, :integer
      field "background_color", :background_color, :string
      # Değerler: "top", "middle", "bottom".
      field "vertical_align", :vertical_align, :string
      field "padding", :padding, "UpdateLandingPageDtoDocumentSectionsItemColumnsItemPadding"
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
    end

    # UpdateLandingPageDtoDocumentSectionsItemColumnsItemPadding şeması.
    class UpdateLandingPageDtoDocumentSectionsItemColumnsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # UpdateLandingPageDtoDocumentSectionsItemPadding şeması.
    class UpdateLandingPageDtoDocumentSectionsItemPadding < Pushizo::BaseModel
      # Zorunlu.
      field "top", :top, :integer
      # Zorunlu.
      field "right", :right, :integer
      # Zorunlu.
      field "bottom", :bottom, :integer
      # Zorunlu.
      field "left", :left, :integer
    end

    # UpdateLandingPageDtoDocumentSettings şeması.
    class UpdateLandingPageDtoDocumentSettings < Pushizo::BaseModel
      field "width", :width, :integer
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
      # Değerler: "system", "arial", "georgia", "verdana", "trebuchet", "courier".
      field "font_family", :font_family, :string
      field "dark_mode", :dark_mode, "UpdateLandingPageDtoDocumentSettingsDarkMode"
    end

    # UpdateLandingPageDtoDocumentSettingsDarkMode şeması.
    class UpdateLandingPageDtoDocumentSettingsDarkMode < Pushizo::BaseModel
      field "background_color", :background_color, :string
      field "content_background_color", :content_background_color, :string
      field "text_color", :text_color, :string
      field "link_color", :link_color, :string
    end

    # UpdateLandingPageDtoSeo şeması.
    class UpdateLandingPageDtoSeo < Pushizo::BaseModel
      field "title", :title, :string
      field "description", :description, :string
      field "og_image", :og_image, :string
      field "canonical_url", :canonical_url, :string
      field "noindex", :noindex, :boolean
    end

    # UpdateLandingPageDtoSettings şeması.
    class UpdateLandingPageDtoSettings < Pushizo::BaseModel
      field "language", :language, :string
      field "form_id", :form_id, :string
      field "form_section_id", :form_section_id, :string
      field "cookie_consent", :cookie_consent, "UpdateLandingPageDtoSettingsCookieConsent"
      field "web_sdk", :web_sdk, :boolean
      field "favicon_url", :favicon_url, :string
    end

    # UpdateLandingPageDtoSettingsCookieConsent şeması.
    class UpdateLandingPageDtoSettingsCookieConsent < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "text", :text, :string
      field "accept_label", :accept_label, :string
      field "reject_label", :reject_label, :string
      field "policy_url", :policy_url, :string
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

    # UpdatePredictionDto şeması.
    class UpdatePredictionDto < Pushizo::BaseModel
      field "name", :name, :string
      field "enabled", :enabled, :boolean
      field "event_names", :event_names, [:array, :string]
      field "horizon_days", :horizon_days, :integer
    end

    # UpdatePromoCodeListDto şeması.
    class UpdatePromoCodeListDto < Pushizo::BaseModel
      field "description", :description, :string
      field "expires_at", :expires_at, :string
    end

    # UpdateRecommendationConfigDto şeması.
    class UpdateRecommendationConfigDto < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      field "view_events", :view_events, [:array, :string]
      field "purchase_events", :purchase_events, [:array, :string]
      field "item_property", :item_property, :string
      field "window_days", :window_days, :integer
    end

    # UpdateReverseEtlDto şeması.
    class UpdateReverseEtlDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "every_5_minutes", "hourly", "daily".
      field "schedule", :schedule, :string
      field "enabled", :enabled, :boolean
      field "config", :config, [:map, :any]
      field "credentials", :credentials, [:map, :any]
    end

    # UpdateRfmConfigDto şeması.
    class UpdateRfmConfigDto < Pushizo::BaseModel
      # Zorunlu.
      field "enabled", :enabled, :boolean
      # Zorunlu.
      field "event_names", :event_names, [:array, :string]
      field "value_property", :value_property, :string
      field "use_monetary", :use_monetary, :boolean
      field "window_days", :window_days, :integer
    end

    # UpdateSavedReportDto şeması.
    class UpdateSavedReportDto < Pushizo::BaseModel
      field "name", :name, :string
      field "definition", :definition, "UpdateSavedReportDtoDefinition"
    end

    # UpdateSavedReportDtoDefinition şeması.
    class UpdateSavedReportDtoDefinition < Pushizo::BaseModel
      # Zorunlu. Değerler: "deliveries", "events", "conversions".
      field "source", :source, :string
      # Zorunlu. Değerler: "sent", "delivered", "failed", "opened", "clicked", "delivery_rate", "open_rate", "click_rate", "failure_rate", "count", "unique_users", "value_sum", "value_avg", "conversions", "revenue".
      field "metrics", :metrics, [:array, :string]
      # Değerler: "day", "week", "month", "channel", "provider", "campaign", "status", "name", "source", "event_name", "kind".
      field "dimensions", :dimensions, [:array, :string]
      field "filters", :filters, [:map, [:array, :string]]
      field "sort", :sort, "UpdateSavedReportDtoDefinitionSort"
      field "limit", :limit, :integer
      field "days", :days, :integer
      field "from", :from, :string
      field "to", :to, :string
    end

    # UpdateSavedReportDtoDefinitionSort şeması.
    class UpdateSavedReportDtoDefinitionSort < Pushizo::BaseModel
      # Zorunlu.
      field "by", :by, :string
      # Değerler: "asc", "desc".
      field "direction", :direction, :string
    end

    # UpdateSiteSearchSettingsDto şeması.
    class UpdateSiteSearchSettingsDto < Pushizo::BaseModel
      field "enabled", :enabled, :boolean
      field "ai_answers", :ai_answers, :boolean
      field "allowed_origins", :allowed_origins, [:array, :string]
      field "language", :language, :string
      field "monthly_token_cap", :monthly_token_cap, :integer
      field "query_retention_days", :query_retention_days, :integer
    end

    # UpdateSiteSearchSourceDto şeması.
    class UpdateSiteSearchSourceDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "sitemap", "urls".
      field "kind", :kind, :string
      field "url", :url, :string
      field "urls", :urls, [:array, :string]
      field "max_pages", :max_pages, :integer
      field "refresh_hours", :refresh_hours, :integer
      field "enabled", :enabled, :boolean
    end

    # UpdateSqlSegmentDto şeması.
    class UpdateSqlSegmentDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "query", :query, :string
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
    end

    # UpdateSurveyDto şeması.
    class UpdateSurveyDto < Pushizo::BaseModel
      field "name", :name, :string
      field "questions", :questions, [:array, "UpdateSurveyDtoQuestionsItem"]
      field "settings", :settings, "UpdateSurveyDtoSettings"
    end

    # UpdateSurveyDtoQuestionsItem şeması.
    class UpdateSurveyDtoQuestionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu. Değerler: "nps", "csat", "single_choice", "multiple_choice", "text".
      field "type", :type, :string
      # Zorunlu.
      field "text", :text, [:map, :string]
      field "required", :required, :boolean
      field "options", :options, [:array, "UpdateSurveyDtoQuestionsItemOptionsItem"]
      field "low_label", :low_label, [:map, :string]
      field "high_label", :high_label, [:map, :string]
      field "placeholder", :placeholder, [:map, :string]
    end

    # UpdateSurveyDtoQuestionsItemOptionsItem şeması.
    class UpdateSurveyDtoQuestionsItemOptionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "label", :label, [:map, :string]
    end

    # UpdateSurveyDtoSettings şeması.
    class UpdateSurveyDtoSettings < Pushizo::BaseModel
      field "thank_you", :thank_you, [:map, :string]
      field "submit_label", :submit_label, [:map, :string]
      field "write_properties", :write_properties, :boolean
      field "allow_multiple", :allow_multiple, :boolean
      field "default_language", :default_language, :string
    end

    # UpdateTemplateDto şeması.
    class UpdateTemplateDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      field "content_card", :content_card, "UpdateTemplateDtoContentContentCard"
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
      field "messenger_image_url", :messenger_image_url, :string
      field "messenger_buttons", :messenger_buttons, [:array, :any]
      field "ios_carousel", :ios_carousel, [:array, "UpdateTemplateDtoContentIosCarouselItem"]
      field "android_live_update", :android_live_update, "UpdateTemplateDtoContentAndroidLiveUpdate"
      field "voip", :voip, :boolean
      field "app_clip", :app_clip, :boolean
    end

    # UpdateTemplateDtoContentAndroidLiveUpdate şeması.
    class UpdateTemplateDtoContentAndroidLiveUpdate < Pushizo::BaseModel
      # Zorunlu.
      field "progress", :progress, :integer
      field "ongoing", :ongoing, :boolean
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

    # UpdateTemplateDtoContentContentCard şeması.
    class UpdateTemplateDtoContentContentCard < Pushizo::BaseModel
      # Zorunlu. Değerler: "classic", "captioned_image", "image_only".
      field "type", :type, :string
      field "pinned", :pinned, :boolean
      field "priority", :priority, :integer
      field "button_text", :button_text, [:map, :string]
    end

    # UpdateTemplateDtoContentIosCarouselItem şeması.
    class UpdateTemplateDtoContentIosCarouselItem < Pushizo::BaseModel
      # Zorunlu.
      field "url", :url, :string
      field "title", :title, :string
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

    # UpdateWalletConfigDto şeması.
    class UpdateWalletConfigDto < Pushizo::BaseModel
      field "apple", :apple, "UpdateWalletConfigDtoApple"
      field "google", :google, "UpdateWalletConfigDtoGoogle"
    end

    # UpdateWalletConfigDtoApple şeması.
    class UpdateWalletConfigDtoApple < Pushizo::BaseModel
      # Zorunlu.
      field "pass_type_id", :pass_type_id, :string
      # Zorunlu.
      field "team_id", :team_id, :string
      # Zorunlu.
      field "certificate_pem", :certificate_pem, :string
      # Zorunlu.
      field "private_key_pem", :private_key_pem, :string
      field "key_passphrase", :key_passphrase, :string
      # Zorunlu.
      field "wwdr_pem", :wwdr_pem, :string
    end

    # UpdateWalletConfigDtoGoogle şeması.
    class UpdateWalletConfigDtoGoogle < Pushizo::BaseModel
      # Zorunlu.
      field "issuer_id", :issuer_id, :string
      # Zorunlu.
      field "service_account_json", :service_account_json, :string
    end

    # UpdateWalletPassDto şeması.
    class UpdateWalletPassDto < Pushizo::BaseModel
      field "barcode_value", :barcode_value, :string
      field "values", :values, [:map, :string]
    end

    # UpdateWalletTemplateDto şeması.
    class UpdateWalletTemplateDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "active", "archived".
      field "status", :status, :string
      field "design", :design, "UpdateWalletTemplateDtoDesign"
      field "images", :images, [:map, :string]
    end

    # UpdateWalletTemplateDtoDesign şeması.
    class UpdateWalletTemplateDtoDesign < Pushizo::BaseModel
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "organization", :organization, :string
      field "background_color", :background_color, :string
      field "foreground_color", :foreground_color, :string
      field "label_color", :label_color, :string
      # Değerler: "qr", "pdf417", "aztec", "code128".
      field "barcode", :barcode, :string
      field "fields", :fields_value, [:array, "UpdateWalletTemplateDtoDesignFieldsItem"]
      field "expires_at", :expires_at, :string
      field "relevant_at", :relevant_at, :string
    end

    # UpdateWalletTemplateDtoDesignFieldsItem şeması.
    class UpdateWalletTemplateDtoDesignFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      field "label", :label, :string
      field "value", :value, :string
      # Değerler: "header", "primary", "secondary", "auxiliary", "back".
      field "section", :section, :string
    end

    # UpdateWarehouseConnectionDto şeması.
    class UpdateWarehouseConnectionDto < Pushizo::BaseModel
      field "name", :name, :string
      field "config", :config, [:map, :any]
      field "credentials", :credentials, [:map, :any]
    end

    # UpdateWarehouseExportDto şeması.
    class UpdateWarehouseExportDto < Pushizo::BaseModel
      field "name", :name, :string
      # Değerler: "deliveries", "delivery_events", "events", "conversions", "users", "subscriptions".
      field "tables", :tables, [:array, :string]
      # Değerler: "every_15_minutes", "hourly", "daily".
      field "schedule", :schedule, :string
      field "enabled", :enabled, :boolean
      field "config", :config, [:map, :any]
      field "credentials", :credentials, [:map, :any]
    end

    # UpdateWarehouseSegmentDto şeması.
    class UpdateWarehouseSegmentDto < Pushizo::BaseModel
      field "name", :name, :string
      field "description", :description, :string
      field "connection_id", :connection_id, :string
      field "query", :query, :string
      field "id_column", :id_column, :string
      # Değerler: "external_id", "user_id".
      field "id_type", :id_type, :string
      field "refresh_interval_minutes", :refresh_interval_minutes, :integer
      field "limits", :limits, "UpdateWarehouseSegmentDtoLimits"
    end

    # UpdateWarehouseSegmentDtoLimits şeması.
    class UpdateWarehouseSegmentDtoLimits < Pushizo::BaseModel
      field "timeout_seconds", :timeout_seconds, :integer
      field "max_rows", :max_rows, :integer
      field "max_bytes_billed", :max_bytes_billed, :integer
      # Değerler: "X-Small", "Small", "Medium", "Large", "X-Large", "2X-Large", "3X-Large", "4X-Large", "5X-Large", "6X-Large".
      field "max_warehouse_size", :max_warehouse_size, :string
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

    # UpdateWebCampaignDto şeması.
    class UpdateWebCampaignDto < Pushizo::BaseModel
      field "name", :name, :string
      field "display", :display_value, "UpdateWebCampaignDtoDisplay"
      field "variants", :variants, [:array, "UpdateWebCampaignDtoVariantsItem"]
      field "trigger", :trigger, :any
      field "conditions", :conditions, "UpdateWebCampaignDtoConditions"
      field "targeting", :targeting, "UpdateWebCampaignDtoTargeting"
      field "frequency", :frequency, "UpdateWebCampaignDtoFrequency"
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # UpdateWebCampaignDtoConditions şeması.
    class UpdateWebCampaignDtoConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "UpdateWebCampaignDtoConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "UpdateWebCampaignDtoConditionsUtmRulesItem"]
      field "visits", :visits, "UpdateWebCampaignDtoConditionsVisits"
    end

    # UpdateWebCampaignDtoConditionsUrlRulesItem şeması.
    class UpdateWebCampaignDtoConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UpdateWebCampaignDtoConditionsUtmRulesItem şeması.
    class UpdateWebCampaignDtoConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # UpdateWebCampaignDtoConditionsVisits şeması.
    class UpdateWebCampaignDtoConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # UpdateWebCampaignDtoDisplay şeması.
    class UpdateWebCampaignDtoDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # UpdateWebCampaignDtoFrequency şeması.
    class UpdateWebCampaignDtoFrequency < Pushizo::BaseModel
      field "max_per_session", :max_per_session, :integer
      field "max_per_day", :max_per_day, :integer
      field "max_total", :max_total, :integer
      field "hide_after_close_days", :hide_after_close_days, :integer
      field "stop_after_conversion", :stop_after_conversion, :boolean
    end

    # UpdateWebCampaignDtoTargeting şeması.
    class UpdateWebCampaignDtoTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # UpdateWebCampaignDtoVariantsItem şeması.
    class UpdateWebCampaignDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "UpdateWebCampaignDtoVariantsItemDisplay"
    end

    # UpdateWebCampaignDtoVariantsItemDisplay şeması.
    class UpdateWebCampaignDtoVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # UpdateWebhookDto şeması.
    class UpdateWebhookDto < Pushizo::BaseModel
      field "url", :url, :string
      field "description", :description, :string
      # Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "conversation.created", "conversation.message", "conversation.assigned", "conversation.resolved", "audit.created", "form.submitted", "survey.responded", "ad_audience.synced", "ad_account.revoked", "ad_budget.alert", "ad_insights.imported".
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

    # UpdateWebPersonalizationDto şeması.
    class UpdateWebPersonalizationDto < Pushizo::BaseModel
      field "name", :name, :string
      field "changes", :changes, [:array, :any]
      field "variants", :variants, [:array, "UpdateWebPersonalizationDtoVariantsItem"]
      field "conditions", :conditions, "UpdateWebPersonalizationDtoConditions"
      field "targeting", :targeting, "UpdateWebPersonalizationDtoTargeting"
      field "goal", :goal, :any
      field "priority", :priority, :integer
      field "start_at", :start_at, :string
      field "end_at", :end_at, :string
    end

    # UpdateWebPersonalizationDtoConditions şeması.
    class UpdateWebPersonalizationDtoConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "UpdateWebPersonalizationDtoConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "UpdateWebPersonalizationDtoConditionsUtmRulesItem"]
      field "visits", :visits, "UpdateWebPersonalizationDtoConditionsVisits"
    end

    # UpdateWebPersonalizationDtoConditionsUrlRulesItem şeması.
    class UpdateWebPersonalizationDtoConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # UpdateWebPersonalizationDtoConditionsUtmRulesItem şeması.
    class UpdateWebPersonalizationDtoConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # UpdateWebPersonalizationDtoConditionsVisits şeması.
    class UpdateWebPersonalizationDtoConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # UpdateWebPersonalizationDtoTargeting şeması.
    class UpdateWebPersonalizationDtoTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # UpdateWebPersonalizationDtoVariantsItem şeması.
    class UpdateWebPersonalizationDtoVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "changes", :changes, [:array, :any]
    end

    # UpsertCatalogItemsDto şeması.
    class UpsertCatalogItemsDto < Pushizo::BaseModel
      # Zorunlu.
      field "items", :items, [:array, "UpsertCatalogItemsDtoItemsItem"]
    end

    # UpsertCatalogItemsDtoItemsItem şeması.
    class UpsertCatalogItemsDtoItemsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "title", :title, :string
      field "description", :description, :string
      field "image_url", :image_url, :string
      field "url", :url, :string
      field "price", :price, :number
      field "sale_price", :sale_price, :number
      field "currency", :currency, :string
      field "category", :category, :string
      field "brand", :brand, :string
      field "in_stock", :in_stock, :boolean
      field "attributes", :attributes_value, [:map, :string]
    end

    # UpsertCompanyDto şeması.
    class UpsertCompanyDto < Pushizo::BaseModel
      # Zorunlu.
      field "external_id", :external_id, :string
      field "name", :name, :string
      field "domain", :domain, :string
      field "properties", :properties, [:map, :any]
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
      field "overage", :overage, "UsageReportOverage"
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

    # UsageReportOverage şeması.
    class UsageReportOverage < Pushizo::BaseModel
      # Zorunlu.
      field "lines", :lines, [:array, "UsageReportOverageLinesItem"]
      # Zorunlu.
      field "totals", :totals, "UsageReportOverageTotals"
    end

    # UsageReportOverageLinesItem şeması.
    class UsageReportOverageLinesItem < Pushizo::BaseModel
      # Zorunlu.
      field "metric", :metric, :string
      # Zorunlu.
      field "included", :included, :number
      # Zorunlu.
      field "used", :used, :number
      # Zorunlu.
      field "billable", :billable, :number
      # Zorunlu.
      field "amounts", :amounts, "UsageReportOverageLinesItemAmounts"
    end

    # UsageReportOverageLinesItemAmounts şeması.
    class UsageReportOverageLinesItemAmounts < Pushizo::BaseModel
      # Zorunlu.
      field "USD", :usd, :number
      # Zorunlu.
      field "TRY", :try, :number
    end

    # UsageReportOverageTotals şeması.
    class UsageReportOverageTotals < Pushizo::BaseModel
      # Zorunlu.
      field "USD", :usd, :number
      # Zorunlu.
      field "TRY", :try, :number
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
      field "last_ip", :last_ip, :string
      # Zorunlu.
      field "last_ip_at", :last_ip_at, :string
      # Zorunlu. Değerler: "positive", "negative", "neutral".
      field "last_sentiment", :last_sentiment, :string
      # Zorunlu.
      field "last_sentiment_at", :last_sentiment_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "subscription_count", :subscription_count, :integer
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
      field "channels", :channels, [:array, :string]
    end

    # UserAffinity şeması.
    class UserAffinity < Pushizo::BaseModel
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "affinities", :affinities, [:array, "UserAffinityAffinitiesItem"]
      # Zorunlu.
      field "weekly_cap", :weekly_cap, :integer
      # Zorunlu.
      field "engagement", :engagement, :number
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserAffinityAffinitiesItem şeması.
    class UserAffinityAffinitiesItem < Pushizo::BaseModel
      # Zorunlu.
      field "attribute", :attribute, :string
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "score", :score, :number
      # Zorunlu.
      field "rank", :rank, :integer
    end

    # UserCompanyList şeması.
    class UserCompanyList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "UserCompanyListDataItem"]
    end

    # UserCompanyListDataItem şeması.
    class UserCompanyListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "company", :company, "UserCompanyListDataItemCompany"
      # Zorunlu.
      field "role", :role, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # UserCompanyListDataItemCompany şeması.
    class UserCompanyListDataItemCompany < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "domain", :domain, :string
      # Zorunlu.
      field "properties", :properties, [:map, :any]
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
      field "last_ip", :last_ip, :string
      # Zorunlu.
      field "last_ip_at", :last_ip_at, :string
      # Zorunlu. Değerler: "positive", "negative", "neutral".
      field "last_sentiment", :last_sentiment, :string
      # Zorunlu.
      field "last_sentiment_at", :last_sentiment_at, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
      # Zorunlu.
      field "subscription_count", :subscription_count, :integer
      # Zorunlu. Değerler: "ios_push", "android_push", "hms_push", "adm_push", "wns_push", "web_push", "email", "sms", "whatsapp", "rcs", "telegram", "viber".
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
      # Zorunlu.
      field "derived", :derived, "UserExportDerived"
    end

    # UserExportDerived şeması.
    class UserExportDerived < Pushizo::BaseModel
      # Zorunlu.
      field "wallet_passes", :wallet_passes, [:array, "UserExportDerivedWalletPassesItem"]
      # Zorunlu.
      field "rfm", :rfm, "UserExportDerivedRfm"
      # Zorunlu.
      field "predictions", :predictions, [:array, "UserExportDerivedPredictionsItem"]
      # Zorunlu.
      field "channel_scores", :channel_scores, [:array, "UserExportDerivedChannelScoresItem"]
      # Zorunlu.
      field "decisions", :decisions, [:array, "UserExportDerivedDecisionsItem"]
      # Zorunlu.
      field "recommendations", :recommendations, [:array, "UserExportDerivedRecommendationsItem"]
      # Zorunlu.
      field "affinities", :affinities, [:array, "UserExportDerivedAffinitiesItem"]
      # Zorunlu.
      field "frequency_cap", :frequency_cap, "UserExportDerivedFrequencyCap"
      # Zorunlu.
      field "companies", :companies, [:array, "UserExportDerivedCompaniesItem"]
    end

    # UserExportDerivedAffinitiesItem şeması.
    class UserExportDerivedAffinitiesItem < Pushizo::BaseModel
      # Zorunlu.
      field "attribute", :attribute, :string
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu.
      field "score", :score, :number
      # Zorunlu.
      field "rank", :rank, :number
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedChannelScoresItem şeması.
    class UserExportDerivedChannelScoresItem < Pushizo::BaseModel
      # Zorunlu.
      field "channel", :channel, :string
      # Zorunlu.
      field "sends", :sends, :number
      # Zorunlu.
      field "engaged", :engaged, :number
      # Zorunlu.
      field "score", :score, :number
      # Zorunlu.
      field "is_best", :is_best, :boolean
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedCompaniesItem şeması.
    class UserExportDerivedCompaniesItem < Pushizo::BaseModel
      # Zorunlu.
      field "company_id", :company_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "role", :role, :string
      # Zorunlu.
      field "joined_at", :joined_at, :string
    end

    # UserExportDerivedDecisionsItem şeması.
    class UserExportDerivedDecisionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "agent", :agent, :string
      # Zorunlu.
      field "arm_id", :arm_id, :string
      # Zorunlu.
      field "context", :context, :string
      # Zorunlu.
      field "assigned_at", :assigned_at, :string
      # Zorunlu.
      field "rewarded_at", :rewarded_at, :string
    end

    # UserExportDerivedFrequencyCap şeması.
    class UserExportDerivedFrequencyCap < Pushizo::BaseModel
      # Zorunlu.
      field "weekly_cap", :weekly_cap, :number
      # Zorunlu.
      field "engagement", :engagement, :number
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedPredictionsItem şeması.
    class UserExportDerivedPredictionsItem < Pushizo::BaseModel
      # Zorunlu.
      field "model", :model, :string
      # Zorunlu.
      field "score", :score, :number
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedRecommendationsItem şeması.
    class UserExportDerivedRecommendationsItem < Pushizo::BaseModel
      # Zorunlu.
      field "catalog_id", :catalog_id, :string
      # Zorunlu.
      field "personalized", :personalized, [:array, :string]
      # Zorunlu.
      field "recent", :recent, [:array, :string]
      # Zorunlu.
      field "purchased", :purchased, [:array, :string]
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedRfm şeması.
    class UserExportDerivedRfm < Pushizo::BaseModel
      # Zorunlu.
      field "segment", :segment, :string
      # Zorunlu.
      field "segment_since", :segment_since, :string
      # Zorunlu.
      field "r", :r, :number
      # Zorunlu.
      field "f", :f, :number
      # Zorunlu.
      field "m", :m, :number
      # Zorunlu.
      field "frequency", :frequency, :number
      # Zorunlu.
      field "monetary", :monetary, :number
      # Zorunlu.
      field "last_event_at", :last_event_at, :string
      # Zorunlu.
      field "computed_at", :computed_at, :string
    end

    # UserExportDerivedWalletPassesItem şeması.
    class UserExportDerivedWalletPassesItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "template_id", :template_id, :string
      # Zorunlu.
      field "status", :status, :string
      # Zorunlu.
      field "barcode_value", :barcode_value, :string
      # Zorunlu.
      field "values", :values, [:map, :string]
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
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
      # Zorunlu.
      field "consents", :consents, [:array, "UserPreferencesConsentsItem"]
    end

    # UserPreferencesConsentsItem şeması.
    class UserPreferencesConsentsItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "ads_personalization".
      field "purpose", :purpose, :string
      # Zorunlu.
      field "granted", :granted, :boolean
      # Zorunlu.
      field "source", :source, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
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

    # WalletConfig şeması.
    class WalletConfig < Pushizo::BaseModel
      # Zorunlu.
      field "apple", :apple, "WalletConfigApple"
      # Zorunlu.
      field "google", :google, "WalletConfigGoogle"
    end

    # WalletConfigApple şeması.
    class WalletConfigApple < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "pass_type_id", :pass_type_id, :string
      # Zorunlu.
      field "team_id", :team_id, :string
      # Zorunlu.
      field "certificate_expires_at", :certificate_expires_at, :string
    end

    # WalletConfigGoogle şeması.
    class WalletConfigGoogle < Pushizo::BaseModel
      # Zorunlu.
      field "configured", :configured, :boolean
      # Zorunlu.
      field "issuer_id", :issuer_id, :string
    end

    # WalletPass şeması.
    class WalletPass < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "template_id", :template_id, :string
      # Zorunlu.
      field "user_id", :user_id, :string
      # Zorunlu.
      field "external_id", :external_id, :string
      # Zorunlu.
      field "barcode_value", :barcode_value, :string
      # Zorunlu.
      field "values", :values, [:map, :string]
      # Zorunlu. Değerler: "active", "voided".
      field "status", :status, :string
      # Zorunlu.
      field "url", :url, :string
      # Zorunlu.
      field "apple_url", :apple_url, :string
      # Zorunlu.
      field "google_url", :google_url, :string
      # Zorunlu.
      field "apple_devices", :apple_devices, :integer
      # Zorunlu.
      field "version", :version, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WalletPassPage şeması.
    class WalletPassPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WalletPass"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
    end

    # WalletTemplate şeması.
    class WalletTemplate < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "slug", :slug, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "coupon", "loyalty", "event", "generic".
      field "kind", :kind, :string
      # Zorunlu. Değerler: "active", "archived".
      field "status", :status, :string
      # Zorunlu.
      field "design", :design, "WalletTemplateDesign"
      # Zorunlu.
      field "images", :images, [:array, :string]
      # Zorunlu.
      field "passes", :passes, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WalletTemplateDesign şeması.
    class WalletTemplateDesign < Pushizo::BaseModel
      # Zorunlu.
      field "title", :title, :string
      # Zorunlu.
      field "description", :description, :string
      # Zorunlu.
      field "organization", :organization, :string
      # Zorunlu.
      field "background_color", :background_color, :string
      # Zorunlu.
      field "foreground_color", :foreground_color, :string
      # Zorunlu.
      field "label_color", :label_color, :string
      # Zorunlu. Değerler: "qr", "pdf417", "aztec", "code128".
      field "barcode", :barcode, :string
      # Zorunlu.
      field "fields", :fields_value, [:array, "WalletTemplateDesignFieldsItem"]
      field "expires_at", :expires_at, :string
      field "relevant_at", :relevant_at, :string
    end

    # WalletTemplateDesignFieldsItem şeması.
    class WalletTemplateDesignFieldsItem < Pushizo::BaseModel
      # Zorunlu.
      field "key", :key, :string
      # Zorunlu.
      field "label", :label, :string
      # Zorunlu.
      field "value", :value, :string
      # Zorunlu. Değerler: "header", "primary", "secondary", "auxiliary", "back".
      field "section", :section, :string
    end

    # WalletTemplateList şeması.
    class WalletTemplateList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WalletTemplate"]
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
      # Zorunlu. Değerler: "bigquery", "snowflake", "s3_parquet", "redshift", "databricks".
      field "destination", :destination, :string
      # Zorunlu.
      field "config", :config, [:map, :any]
      # Zorunlu.
      field "credentials_hint", :credentials_hint, :string
      # Zorunlu. Değerler: "deliveries", "delivery_events", "events", "conversions", "users", "subscriptions".
      field "tables", :tables, [:array, :string]
      # Zorunlu. Değerler: "every_15_minutes", "hourly", "daily".
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

    # WarehouseSegmentConnection şeması.
    class WarehouseSegmentConnection < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "app_id", :app_id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu. Değerler: "bigquery", "snowflake", "databricks".
      field "type", :type, :string
      # Zorunlu.
      field "config", :config, [:map, :any]
      # Zorunlu.
      field "credentials_hint", :credentials_hint, :string
      # Zorunlu.
      field "segment_count", :segment_count, :integer
      # Zorunlu.
      field "last_tested_at", :last_tested_at, :string
      # Zorunlu.
      field "last_test_error", :last_test_error, :string
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WarehouseSegmentConnectionList şeması.
    class WarehouseSegmentConnectionList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WarehouseSegmentConnection"]
    end

    # WarehouseSegmentConnectionTest şeması.
    class WarehouseSegmentConnectionTest < Pushizo::BaseModel
      # Zorunlu.
      field "ok", :ok, :boolean
      # Zorunlu.
      field "error", :error, "WarehouseSegmentConnectionTestError"
    end

    # WarehouseSegmentConnectionTestError şeması.
    class WarehouseSegmentConnectionTestError < Pushizo::BaseModel
      # Zorunlu.
      field "code", :code, :string
      # Zorunlu.
      field "message", :message, :string
    end

    # WarehouseSegmentList şeması.
    class WarehouseSegmentList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "Segment"]
    end

    # WarehouseSegmentOptions şeması.
    class WarehouseSegmentOptions < Pushizo::BaseModel
      # Zorunlu. Değerler: "bigquery", "snowflake", "databricks".
      field "types", :types, [:array, :string]
      # Zorunlu. Değerler: "external_id", "user_id".
      field "id_types", :id_types, [:array, :string]
      # Zorunlu. Değerler: "X-Small", "Small", "Medium", "Large", "X-Large", "2X-Large", "3X-Large", "4X-Large", "5X-Large", "6X-Large".
      field "snowflake_warehouse_sizes", :snowflake_warehouse_sizes, [:array, :string]
      # Zorunlu.
      field "refresh_intervals", :refresh_intervals, [:array, :integer]
      # Zorunlu.
      field "limits", :limits, "WarehouseSegmentOptionsLimits"
    end

    # WarehouseSegmentOptionsLimits şeması.
    class WarehouseSegmentOptionsLimits < Pushizo::BaseModel
      # Zorunlu.
      field "query_max", :query_max, :integer
      # Zorunlu.
      field "timeout_default_seconds", :timeout_default_seconds, :integer
      # Zorunlu.
      field "timeout_min_seconds", :timeout_min_seconds, :integer
      # Zorunlu.
      field "timeout_max_seconds", :timeout_max_seconds, :integer
      # Zorunlu.
      field "max_rows_default", :max_rows_default, :integer
      # Zorunlu.
      field "max_rows_max", :max_rows_max, :integer
      # Zorunlu.
      field "max_bytes_billed_default", :max_bytes_billed_default, :integer
      # Zorunlu.
      field "max_bytes_billed_min", :max_bytes_billed_min, :integer
      # Zorunlu.
      field "max_bytes_billed_max", :max_bytes_billed_max, :integer
      # Zorunlu.
      field "preview_sample", :preview_sample, :integer
      # Zorunlu.
      field "connections_per_app", :connections_per_app, :integer
    end

    # WarehouseSegmentPreview şeması.
    class WarehouseSegmentPreview < Pushizo::BaseModel
      # Zorunlu.
      field "run_id", :run_id, :string
      # Zorunlu. Değerler: "dry_run", "sample".
      field "mode", :mode, :string
      # Zorunlu.
      field "estimated_bytes", :estimated_bytes, :number
      # Zorunlu.
      field "max_bytes_billed", :max_bytes_billed, :number
      # Zorunlu.
      field "within_limit", :within_limit, :boolean
      # Zorunlu.
      field "sample", :sample, [:array, :string]
      # Zorunlu.
      field "sample_truncated", :sample_truncated, :boolean
      # Zorunlu.
      field "sample_matched", :sample_matched, :integer
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
    end

    # WarehouseSegmentRunList şeması.
    class WarehouseSegmentRunList < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WarehouseSegmentRunListDataItem"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WarehouseSegmentRunListDataItem şeması.
    class WarehouseSegmentRunListDataItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "segment_id", :segment_id, :string
      # Zorunlu.
      field "connection_id", :connection_id, :string
      # Zorunlu. Değerler: "bigquery", "snowflake", "databricks".
      field "warehouse_type", :warehouse_type, :string
      # Zorunlu. Değerler: "panel", "api", "schedule".
      field "source", :source, :string
      # Zorunlu.
      field "actor_id", :actor_id, :string
      # Zorunlu.
      field "query", :query, :string
      # Zorunlu.
      field "query_hash", :query_hash, :string
      # Zorunlu. Değerler: "ok", "rejected", "timeout", "failed".
      field "status", :status, :string
      # Zorunlu. Değerler: "empty", "too_long", "syntax", "multiple_statements", "not_select", "forbidden_relation", "forbidden_function", "forbidden_construct", "forbidden_type".
      field "reason", :reason, :string
      # Zorunlu.
      field "error", :error, :string
      # Zorunlu.
      field "row_count", :row_count, :integer
      # Zorunlu.
      field "matched_count", :matched_count, :integer
      # Zorunlu.
      field "bytes_processed", :bytes_processed, :number
      # Zorunlu.
      field "truncated", :truncated, :boolean
      # Zorunlu.
      field "duration_ms", :duration_ms, :integer
      # Zorunlu.
      field "created_at", :created_at, :string
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

    # WebCampaign şeması.
    class WebCampaign < Pushizo::BaseModel
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
      field "display", :display_value, "WebCampaignDisplay"
      # Zorunlu.
      field "variants", :variants, [:array, "WebCampaignVariantsItem"]
      # Zorunlu.
      field "ab_test", :ab_test, "WebCampaignAbTest"
      # Zorunlu.
      field "trigger", :trigger, :any
      # Zorunlu.
      field "conditions", :conditions, "WebCampaignConditions"
      # Zorunlu.
      field "targeting", :targeting, "WebCampaignTargeting"
      # Zorunlu.
      field "frequency", :frequency, "WebCampaignFrequency"
      # Zorunlu.
      field "start_at", :start_at, :string
      # Zorunlu.
      field "end_at", :end_at, :string
      # Zorunlu.
      field "stats", :stats, "WebCampaignStats"
      # Zorunlu.
      field "variant_stats", :variant_stats, [:array, "WebCampaignVariantStatsItem"]
      # Zorunlu.
      field "variant_significance", :variant_significance, "WebCampaignVariantSignificance"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WebCampaignAbTest şeması.
    class WebCampaignAbTest < Pushizo::BaseModel
      # Zorunlu.
      field "winner_variant_id", :winner_variant_id, :string
      # Zorunlu.
      field "decided_at", :decided_at, :string
      # Zorunlu.
      field "decided_by", :decided_by, :string
    end

    # WebCampaignConditions şeması.
    class WebCampaignConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "WebCampaignConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "WebCampaignConditionsUtmRulesItem"]
      field "visits", :visits, "WebCampaignConditionsVisits"
    end

    # WebCampaignConditionsUrlRulesItem şeması.
    class WebCampaignConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # WebCampaignConditionsUtmRulesItem şeması.
    class WebCampaignConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # WebCampaignConditionsVisits şeması.
    class WebCampaignConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # WebCampaignDisplay şeması.
    class WebCampaignDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # WebCampaignFrequency şeması.
    class WebCampaignFrequency < Pushizo::BaseModel
      field "max_per_session", :max_per_session, :integer
      field "max_per_day", :max_per_day, :integer
      field "max_total", :max_total, :integer
      field "hide_after_close_days", :hide_after_close_days, :integer
      field "stop_after_conversion", :stop_after_conversion, :boolean
    end

    # WebCampaignPage şeması.
    class WebCampaignPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WebCampaign"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WebCampaignReport şeması.
    class WebCampaignReport < Pushizo::BaseModel
      # Zorunlu.
      field "campaign_id", :campaign_id, :string
      # Zorunlu.
      field "days", :days, :integer
      # Zorunlu.
      field "daily", :daily, [:array, "WebCampaignReportDailyItem"]
      # Zorunlu.
      field "totals", :totals, "WebCampaignReportTotals"
    end

    # WebCampaignReportDailyItem şeması.
    class WebCampaignReportDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "closes", :closes, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
    end

    # WebCampaignReportTotals şeması.
    class WebCampaignReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "closes", :closes, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "unique_visitors", :unique_visitors, :integer
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # WebCampaignStats şeması.
    class WebCampaignStats < Pushizo::BaseModel
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "closes", :closes, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "unique_visitors", :unique_visitors, :integer
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # WebCampaignStatusDto şeması.
    class WebCampaignStatusDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
    end

    # WebCampaignTargeting şeması.
    class WebCampaignTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # WebCampaignVariantSignificance şeması.
    class WebCampaignVariantSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "leader", :leader, :string
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
    end

    # WebCampaignVariantsItem şeması.
    class WebCampaignVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "display", :display_value, "WebCampaignVariantsItemDisplay"
    end

    # WebCampaignVariantsItemDisplay şeması.
    class WebCampaignVariantsItemDisplay < Pushizo::BaseModel
      # Zorunlu. Değerler: "popup", "banner_top", "banner_bottom", "slide_in", "fullscreen".
      field "layout", :layout, :string
      # Değerler: "left", "right".
      field "position", :position, :string
      field "background_color", :background_color, :string
      field "text_color", :text_color, :string
      field "dismissible", :dismissible, :boolean
      field "auto_dismiss_seconds", :auto_dismiss_seconds, :integer
      field "max_width", :max_width, :integer
      # Zorunlu.
      field "blocks", :blocks, [:array, :any]
      field "form_id", :form_id, :string
      field "survey_id", :survey_id, :string
    end

    # WebCampaignVariantStatsItem şeması.
    class WebCampaignVariantStatsItem < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
      # Zorunlu.
      field "impressions", :impressions, :integer
      # Zorunlu.
      field "clicks", :clicks, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "ctr", :ctr, :number
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # WebCampaignWinnerDto şeması.
    class WebCampaignWinnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
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
      # Zorunlu. Değerler: "message.queued", "message.completed", "message.failed", "delivery.sent", "delivery.delivered", "delivery.failed", "delivery.opened", "delivery.clicked", "delivery.bounced", "delivery.complained", "delivery.unsubscribed", "in_app.impression", "in_app.clicked", "in_app.dismissed", "subscription.created", "subscription.unsubscribed", "subscription.invalidated", "user.created", "user.updated", "user.merged", "user.deleted", "event.received", "conversion.created", "campaign.scheduled", "campaign.started", "campaign.completed", "journey.entered", "journey.step_completed", "journey.completed", "journey.exited", "conversation.created", "conversation.message", "conversation.assigned", "conversation.resolved", "audit.created", "form.submitted", "survey.responded", "ad_audience.synced", "ad_account.revoked", "ad_budget.alert", "ad_insights.imported", "webhook.test".
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

    # WebPersonalization şeması.
    class WebPersonalization < Pushizo::BaseModel
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
      field "changes", :changes, [:array, :any]
      # Zorunlu.
      field "variants", :variants, [:array, "WebPersonalizationVariantsItem"]
      # Zorunlu.
      field "ab_test", :ab_test, "WebPersonalizationAbTest"
      # Zorunlu.
      field "conditions", :conditions, "WebPersonalizationConditions"
      # Zorunlu.
      field "targeting", :targeting, "WebPersonalizationTargeting"
      # Zorunlu.
      field "goal", :goal, :any
      # Zorunlu.
      field "start_at", :start_at, :string
      # Zorunlu.
      field "end_at", :end_at, :string
      # Zorunlu.
      field "stats", :stats, "WebPersonalizationStats"
      # Zorunlu.
      field "variant_stats", :variant_stats, [:array, "WebPersonalizationVariantStatsItem"]
      # Zorunlu.
      field "variant_significance", :variant_significance, "WebPersonalizationVariantSignificance"
      # Zorunlu.
      field "created_at", :created_at, :string
      # Zorunlu.
      field "updated_at", :updated_at, :string
    end

    # WebPersonalizationAbTest şeması.
    class WebPersonalizationAbTest < Pushizo::BaseModel
      # Zorunlu.
      field "winner_variant_id", :winner_variant_id, :string
      # Zorunlu.
      field "decided_at", :decided_at, :string
      # Zorunlu.
      field "decided_by", :decided_by, :string
    end

    # WebPersonalizationConditions şeması.
    class WebPersonalizationConditions < Pushizo::BaseModel
      field "url_rules", :url_rules, [:array, "WebPersonalizationConditionsUrlRulesItem"]
      field "utm_rules", :utm_rules, [:array, "WebPersonalizationConditionsUtmRulesItem"]
      field "visits", :visits, "WebPersonalizationConditionsVisits"
    end

    # WebPersonalizationConditionsUrlRulesItem şeması.
    class WebPersonalizationConditionsUrlRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "equals", "contains", "starts_with", "not_contains", "matches".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :string
    end

    # WebPersonalizationConditionsUtmRulesItem şeması.
    class WebPersonalizationConditionsUtmRulesItem < Pushizo::BaseModel
      # Zorunlu. Değerler: "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content".
      field "param", :param, :string
      # Zorunlu. Değerler: "equals", "contains", "exists".
      field "op", :op, :string
      field "value", :value, :string
    end

    # WebPersonalizationConditionsVisits şeması.
    class WebPersonalizationConditionsVisits < Pushizo::BaseModel
      # Zorunlu. Değerler: "gte", "lte", "eq".
      field "op", :op, :string
      # Zorunlu.
      field "value", :value, :integer
    end

    # WebPersonalizationPage şeması.
    class WebPersonalizationPage < Pushizo::BaseModel
      # Zorunlu.
      field "data", :data, [:array, "WebPersonalization"]
      # Zorunlu.
      field "next_cursor", :next_cursor, :string
      # Zorunlu.
      field "has_more", :has_more, :boolean
    end

    # WebPersonalizationReport şeması.
    class WebPersonalizationReport < Pushizo::BaseModel
      # Zorunlu.
      field "personalization_id", :personalization_id, :string
      # Zorunlu.
      field "days", :days, :integer
      # Zorunlu.
      field "daily", :daily, [:array, "WebPersonalizationReportDailyItem"]
      # Zorunlu.
      field "totals", :totals, "WebPersonalizationReportTotals"
    end

    # WebPersonalizationReportDailyItem şeması.
    class WebPersonalizationReportDailyItem < Pushizo::BaseModel
      # Zorunlu.
      field "date", :date, :string
      # Zorunlu.
      field "visitors", :visitors, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
    end

    # WebPersonalizationReportTotals şeması.
    class WebPersonalizationReportTotals < Pushizo::BaseModel
      # Zorunlu.
      field "visitors", :visitors, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # WebPersonalizationStats şeması.
    class WebPersonalizationStats < Pushizo::BaseModel
      # Zorunlu.
      field "visitors", :visitors, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
    end

    # WebPersonalizationStatusDto şeması.
    class WebPersonalizationStatusDto < Pushizo::BaseModel
      # Zorunlu. Değerler: "draft", "active", "paused", "archived".
      field "status", :status, :string
    end

    # WebPersonalizationTargeting şeması.
    class WebPersonalizationTargeting < Pushizo::BaseModel
      field "included_segments", :included_segments, [:array, :string]
      field "excluded_segments", :excluded_segments, [:array, :string]
      # Değerler: "all", "new", "returning".
      field "visitor", :visitor, :string
      # Değerler: "desktop", "mobile", "tablet".
      field "devices", :devices, [:array, :string]
    end

    # WebPersonalizationVariantSignificance şeması.
    class WebPersonalizationVariantSignificance < Pushizo::BaseModel
      # Zorunlu.
      field "leader", :leader, :string
      # Zorunlu.
      field "p_value", :p_value, :number
      # Zorunlu.
      field "significant", :significant, :boolean
    end

    # WebPersonalizationVariantsItem şeması.
    class WebPersonalizationVariantsItem < Pushizo::BaseModel
      # Zorunlu.
      field "id", :id, :string
      # Zorunlu.
      field "name", :name, :string
      # Zorunlu.
      field "weight_percent", :weight_percent, :integer
      # Zorunlu.
      field "changes", :changes, [:array, :any]
    end

    # WebPersonalizationVariantStatsItem şeması.
    class WebPersonalizationVariantStatsItem < Pushizo::BaseModel
      # Zorunlu.
      field "visitors", :visitors, :integer
      # Zorunlu.
      field "conversions", :conversions, :integer
      # Zorunlu.
      field "conversion_rate", :conversion_rate, :number
      # Zorunlu.
      field "variant_id", :variant_id, :string
    end

    # WebPersonalizationWinnerDto şeması.
    class WebPersonalizationWinnerDto < Pushizo::BaseModel
      # Zorunlu.
      field "variant_id", :variant_id, :string
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
