require 'faker'

FactoryBot.define do
  factory :player do
    nickname { Faker::Name.unique.name }
    fullname { Faker::Name.name }
    cellphone_number { "07#{Faker::Number.number(digits: 8)}" } # Use the unencrypted attribute name
    medical_conditions { Faker::Lorem.sentence(word_count: 2) }
    medical_aid { Faker::Games::ClashOfClans.troop }
    id_number { Faker::Number.number(digits: 13) } # Use the unencrypted attribute name
  end
end
