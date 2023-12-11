# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


unless User.find_by(email: 'defaultuser@gmail.com')
    user = User.new(
        email: 'defaultuser@gmail.com',
        password: 'password123',
        password_confirmation: 'password123'
    )

    if user.save
        puts "User created successfully."
    else
        puts "Failed to create user: #{user.errors.full_messages}"
    end
end
