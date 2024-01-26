# == Schema Information
#
# Table name: teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :coaches
  has_many :players

  def self.ransackable_attributes(auth_object = nil)
    ["combined_search", "name"]
  end

  ransacker :combined_search do
    Arel.sql("concat(fullname, ' ', nickname)")
  end
end
