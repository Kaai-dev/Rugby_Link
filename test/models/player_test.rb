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
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
