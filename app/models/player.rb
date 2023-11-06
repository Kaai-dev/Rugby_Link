class Player < ApplicationRecord
    attr_encrypted :encrypt_id_number, key: ENV['ID_NUMBER_ENCRYPTION_KEY']

    has_one :next_of_kin, dependent: :destroy
    accepts_nested_attributes_for :next_of_kin

    has_many :absences, dependent: :destroy
    accepts_nested_attributes_for :absences

    validates :fullname, presence: true
    validates :cellphone_number, presence: true
    validates :medical_conditions, presence: true
    validates :encrypted_id_number, presence: true
    validates_associated :next_of_kin

end