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
require "test_helper"

class NextOfKinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
