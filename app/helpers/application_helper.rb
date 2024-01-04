module ApplicationHelper
    include UsersHelper
    include PlayersHelper
    include UserSettingsHelper

    def empty_profile_pic
        image_tag("profile-pic.jpg",  class: "profile-pic mb-4")
    end

    def flash_messages
      flash.map do |type, message|
      content_tag(:div, message, class: "flash alert alert-#{type}")
      end.join.html_safe
    end

end
