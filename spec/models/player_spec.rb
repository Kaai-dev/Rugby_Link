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
require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
