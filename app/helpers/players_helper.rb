module PlayersHelper
    
    def player_profile_pic_for(player)
        image_tag(player.player_profile_pic,  class: "profile-pic mb-4")
    end

    def player_profile_pic_avatar_for(player)
        image_tag(player.player_profile_pic,  class: "profile-pic-avatar")
    end
end
