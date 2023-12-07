module ApplicationHelper
    def profile_pic_for(player)
        image_tag(player.profile_pic,  class: "profile-pic mb-4")
    end

    def empty_profile_pic
        image_tag("/app/assets/images/profile-pic.png",  class: "profile-pic mb-4")
    end

    def profile_pic_avatar_for(player)
        image_tag(player.profile_pic,  class: "profile-pic-avatar")
    end
end
