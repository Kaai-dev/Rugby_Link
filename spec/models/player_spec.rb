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
require 'rails_helper'

RSpec.describe Player, type: :model do
  it "must contain encrypted_id_number" do
    player = FactoryBot.create(:player)
    expect(player.id_number).to be_present
  end
end
