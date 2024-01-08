# == Schema Information
#
# Table name: coaches
#
#  id                            :uuid             not null, primary key
#  encrypted_cellphone_number    :string
#  encrypted_cellphone_number_iv :string
#  encrypted_id_number           :string
#  encrypted_id_number_iv        :string
#  fullname                      :string
#  medical_aid                   :string
#  medical_conditions            :text
#  nickname                      :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class Coach < ApplicationRecord
    attr_encrypted :id_number, key: ENV['ID_NUMBER_ENCRYPTION_KEY']
    attr_encrypted :cellphone_number, key: ENV['CELLPHONE_NUMBER_ENCRYPTION_KEY']
        
    has_one_attached :coach_profile_pic, dependent: :destroy
    # belongs_to :team

    validate :validate_coach_profile_pic

    validates :fullname, presence: true, length: { maximum: 20 }
    validates :nickname, length: { maximum: 20 }
    validates :cellphone_number, presence: true, length: { minimum: 10, maximum: 10 }, numericality: { only_integer: true }
    validates :medical_aid, length: { maximum: 30 }
    validates :medical_conditions, length: { maximum: 50 }
    validates :id_number, presence: true, length: {  minimum: 13, maximum: 13 } , numericality: { only_integer: true }
    
    private

    def validate_coach_profile_pic
        return unless coach_profile_pic.attached?

        if coach_profile_pic.blob.byte_size > 80.megabytes
            errors.add(:coach_profile_pic, 'is too large. Maximum size allowed is 80MB.')
        end

        acceptable_types = ["image/jpeg", "image/png", "image/jpg"]

        unless acceptable_types.include?(coach_profile_pic.blob.content_type)
            errors.add(:coach_profile_pic, 'must be a JPEG, PNG or JPG.')
        end
    end

end
