# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


unless User.find_by(email: 'user@example.com')

    user = User.new(
        username: 'User',
        password: 'User*1234',
        password_confirmation: 'User*1234',
        email: 'user@example.com',
        role: 0
    )
    user.save

    if user.save
        UserSetting.create(
            dark_mode: false,
            user: user
        )
    puts 'User created Successfully'
    else
        puts "User could not be created: #{user.errors.full_messages.join(", ")}"
    end
    

    coach = User.new(
        username: 'Coach',
        password: 'Coach*1234',
        password_confirmation: 'Coach*1234',
        email: 'coach@example.com',
        role: 1
    )
    coach.save

    if coach.save
        UserSetting.create(
            dark_mode: false,
            user: coach
        )
        puts 'Coach created Successfully'
    else
        puts "Coach could not be created: #{user.errors.full_messages.join(", ")}"
    end

    admin = User.new(
        username: 'Admin',
        password: 'Admin*1234',
        password_confirmation: 'Admin*1234',
        email: 'admin@example.com',
        role: 2
    )
    admin.save

    if admin.save
        UserSetting.create(
            dark_mode: false,
            user: admin
        )
        puts 'Admin created Successfully'
    else
        puts "Admin could not be created: #{user.errors.full_messages.join(", ")}"
    end


    # db/seeds.rb

    positions = [
    'Loosehead Prop', 'Hooker', 'Tighthead Prop', 
    'Lock', 'Lock', 
    'Blindside Flanker', 'Openside Flanker', 'Number Eight', 
    'Scrum-Half', 'Fly-Half', 
    'Left Wing', 'Inside Centre', 'Outside Centre', 
    'Right Wing', 'Fullback'
    ]

    positions.each_with_index do |position_name, index|
    Position.find_or_create_by(position: position_name, number: index + 1)
    end


end
