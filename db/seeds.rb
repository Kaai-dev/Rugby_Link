# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


unless User.find_by(email: 'defaultuser@gmail.com')
    user = User.new(
        username: 'User',
        password: 'User*1234',
        password_confirmation: 'User*1234',
        email: 'user@example.com'
    )

    if user.save
        puts "User created successfully."
    else
        puts "Failed to create user: #{user.errors.full_messages}"
    end
end
