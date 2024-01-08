# == Schema Information
#
# Table name: positions
#
#  id         :uuid             not null, primary key
#  number     :integer
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
