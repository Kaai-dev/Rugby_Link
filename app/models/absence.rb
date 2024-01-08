# == Schema Information
#
# Table name: absences
#
#  id               :uuid             not null, primary key
#  absent_game_day  :boolean
#  absent_train_day :boolean
#  reason           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  player_id        :uuid             not null
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#
class Absence < ApplicationRecord
  belongs_to :player
end
