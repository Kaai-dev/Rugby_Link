# == Schema Information
#
# Table name: next_of_kins
#
#  id               :uuid             not null, primary key
#  cellphone_number :string
#  name             :string
#  relationship     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  player_id        :uuid             not null
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#
class NextOfKin < ApplicationRecord
  belongs_to :player

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :relationship, presence: true, length: { minimum: 2, maximum: 20 }
  validates :cellphone_number, presence: true, length: { minimum: 10, maximum: 10 },
                               numericality: { only_integer: true }
end
