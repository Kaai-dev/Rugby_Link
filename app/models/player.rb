class Player < ApplicationRecord
    has_one :next_of_kin
    has_one :id_number
end
