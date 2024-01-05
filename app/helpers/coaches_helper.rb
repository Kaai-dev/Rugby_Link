module CoachesHelper

    def coach_profile_pic_for(coach)
        image_tag(coach.coach_profile_pic,  class: "profile-pic mb-4")
    end

    def coach_profile_pic_avatar_for(coach)
        image_tag(coach.coach_profile_pic,  class: "profile-pic-avatar")
    end

end
