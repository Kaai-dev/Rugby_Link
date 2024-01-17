if Rails.env.development?

  Player.destroy_all

  60.times do
    Player.create!(
      nickname: Faker::FunnyName.name,
      fullname: Faker::Name.name,
      cellphone_number: Faker::Number.number(digits: 10),
      medical_conditions: Faker::Lorem.sentence(word_count: 5),
      medical_aid: Faker::Games::ClashOfClans.troop,
      id_number: Faker::Number.number(digits: 13)
    )
  end

  puts 'Players seeded successfully.'
end

# TODO: Add random positions to players
