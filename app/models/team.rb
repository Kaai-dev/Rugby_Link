# == Schema Information
#
# Table name: teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :uuid             not null
#  players_id :uuid             not null
#
# Indexes
#
#  index_teams_on_coach_id    (coach_id)
#  index_teams_on_players_id  (players_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#  fk_rails_...  (players_id => players.id)
#
class Team < ApplicationRecord
  # has_many :coach
  # has_many :players
end
