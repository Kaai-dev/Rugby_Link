json.extract! user_setting, :id, :user_id, :dark_mode, :created_at, :updated_at
json.url user_setting_url(user_setting, format: :json)
