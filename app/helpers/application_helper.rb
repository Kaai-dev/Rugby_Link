module ApplicationHelper
    include UsersHelper
    include PlayersHelper
    include UserSettingsHelper

    def empty_profile_pic
        image_tag("profile-pic.jpg",  class: "profile-pic mb-4")
    end

    def flash_messages
      flash.map do |type, message|
        # Determine the class based on the type of flash message
        css_class = case type
                    when 'notice' then 'alert-info'
                    when 'alert' then 'alert-warning'
                    else "alert-#{type}"
                    end

        # Use the determined class in the content_tag
        content_tag(:div, message, class: "flash alert #{css_class} mb-4")
      end.join.html_safe
    end


end
