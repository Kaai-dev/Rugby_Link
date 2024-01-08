class Team < ApplicationRecord
  has_many :coach
  has_many :players
end
