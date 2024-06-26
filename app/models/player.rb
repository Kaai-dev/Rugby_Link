# == Schema Information
#
# Table name: players
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
#  team_id                       :uuid
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class Player < ApplicationRecord
  attr_encrypted :id_number, key: ENV['ID_NUMBER_ENCRYPTION_KEY']
  attr_encrypted :cellphone_number, key: ENV['CELLPHONE_NUMBER_ENCRYPTION_KEY']

  has_one :next_of_kin, dependent: :destroy
  accepts_nested_attributes_for :next_of_kin

  has_many :absences, dependent: :destroy
  accepts_nested_attributes_for :absences

  has_one_attached :player_profile_pic
  has_one_attached :copy_of_id

  has_and_belongs_to_many :positions

  belongs_to :team, optional: true

  validate :validate_player_profile_pic

  validates :fullname, presence: true, length: { maximum: 30 }
  validates :nickname, length: { maximum: 30 }
  validates :cellphone_number, presence: true, length: { minimum: 10, maximum: 10 },
                               numericality: { only_integer: true }
  validates :medical_aid, length: { maximum: 30 }
  validates :medical_conditions, length: { maximum: 50 }
  validates :id_number, presence: true, length: { minimum: 13, maximum: 13 }, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["combined_search", "fullname", "nickname"]
  end

  ransacker :combined_search do
    Arel.sql("concat(fullname, ' ', nickname)")
  end

  private

  def validate_player_profile_pic
    return unless player_profile_pic.attached?

    if player_profile_pic.blob.byte_size > 80.megabytes
      errors.add(:player_profile_pic, 'is too large. Maximum size allowed is 80MB.')
    end

    acceptable_types = ['image/jpeg', 'image/png', 'image/jpg']

    return if acceptable_types.include?(player_profile_pic.blob.content_type)

    errors.add(:player_profile_pic, 'must be a JPEG, PNG or JPG.')
  end
end
