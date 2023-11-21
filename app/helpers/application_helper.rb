module ApplicationHelper
    def profile_pic_for(player)
        image_tag(player.profile_pic,  class: "profile-pic")
    end

    def profile_pic_avatar_for(player)
        image_tag(player.profile_pic,  class: "profile-pic-avatar")
    end
end
