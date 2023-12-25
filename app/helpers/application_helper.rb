module ApplicationHelper
    include UsersHelper
    include PlayersHelper
    include UserSettingsHelper

    def empty_profile_pic
        image_tag("profile-pic.jpg",  class: "profile-pic mb-4")
    end

end
