if Rails.env.development?

  Coach.destroy_all

  6.times do
    Coach.create!(
      nickname: Faker::FunnyName.name,
      fullname: Faker::Name.name,
      cellphone_number: Faker::Number.number(digits: 10),
      medical_conditions: Faker::Lorem.sentence(word_count: 2),
      medical_aid: Faker::Games::ClashOfClans.troop,
      id_number: Faker::Number.number(digits: 13)
    )
  end

  puts 'Coaches seeded successfully.'
end
