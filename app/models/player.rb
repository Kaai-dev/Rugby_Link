class Player < ApplicationRecord
    attr_encrypted :id_number, key: ENV['ID_NUMBER_ENCRYPTION_KEY']
    attr_encrypted :cellphone_number, key: ENV['CELLPHONE_NUMBER_ENCRYPTION_KEY']

    has_one :next_of_kin, dependent: :destroy
    accepts_nested_attributes_for :next_of_kin

    has_many :absences, dependent: :destroy
    accepts_nested_attributes_for :absences

    has_one_attached :profile_pic, dependent: :destroy

    has_and_belongs_to_many :positions

    validate :validate_profile_pic

    validates :fullname, presence: true, length: { maximum: 20 }
    validates :nickname, length: { maximum: 20 }
    validates :cellphone_number, presence: true, length: { minimum: 10, maximum: 10 }, numericality: { only_integer: true }
    validates :medical_aid, length: { maximum: 30 }
    validates :medical_conditions, length: { maximum: 50 }
    validates :id_number, presence: true, length: {  minimum: 13, maximum: 13 } , numericality: { only_integer: true }
    # validates_associated :next_of_kin


    private

    def validate_profile_pic
        return unless profile_pic.attached?

        if profile_pic.blob.byte_size > 80.megabytes
            errors.add(:profile_pic, 'is too large. Maximum size allowed is 80MB.')
        end

        acceptable_types = ["image/jpeg", "image/png", "image/jpg"]

        unless acceptable_types.include?(profile_pic.blob.content_type)
            errors.add(:profile_pic, 'must be a JPEG, PNG or JPG.')
        end
    end

end