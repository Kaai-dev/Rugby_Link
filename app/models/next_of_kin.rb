class NextOfKin < ApplicationRecord

    belongs_to :player

    validates :name, presence: true,  length: { minimum: 2, maximum: 50 }
    validates :relationship, presence: true, length: { minimum: 2, maximum: 20 }
    validates :cellphone_number, presence: true, length: { minimum: 10, maximum: 10 }, numericality: { only_integer: true }

end
