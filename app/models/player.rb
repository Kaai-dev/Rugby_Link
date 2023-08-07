class Player < ApplicationRecord
    attr_encrypted :id_number, key: ENV['ID_NUMBER_ENCRYPTION_KEY']

    has_one :next_of_kin
end
