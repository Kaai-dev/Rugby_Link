module UserSettingsHelper
    def theme_setting
        current_user&.user_setting&.dark_mode ? 'dark' : 'light'
    end
end
