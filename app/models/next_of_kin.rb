class NextOfKin < ApplicationRecord

    belongs_to :player

    validates :name, presence: true
    validates :relationship, presence: true
    validates :cellphone_number, presence: true


end
