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
class Position < ApplicationRecord
  has_and_belongs_to_many :players
end
