# == Schema Information
#
# Table name: coaches
#
#  id                 :uuid             not null, primary key
#  cellphone_number   :string
#  fullname           :string
#  id_number          :string
#  medical_aid        :string
#  medical_conditions :text
#  nickname           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  team_id            :uuid
#
# Indexes
#
#  index_coaches_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
require "test_helper"

class CoachTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
