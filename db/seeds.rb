# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
unless User.find_by(username: 'User')

  user = User.create(
    username: 'User',
    password: 'User*1234',
    password_confirmation: 'User*1234',
    email: 'user@example.com',
    role: 0
  )

  user.create_user_setting(
    dark_mode: false,
    user: user
  )
  puts 'User created Successfully'
end

unless User.find_by(username: 'Coach')
  coach = User.create(
    username: 'Coach',
    password: 'Coach*1234',
    password_confirmation: 'Coach*1234',
    email: 'coach@example.com',
    role: 1
  )

  coach.create_user_setting(
    dark_mode: false,
    user: coach
  )
  puts 'Coach created Successfully'
end

unless User.find_by(username: 'Admin')
  admin = User.create(
    username: 'Admin',
    password: 'Admin*1234',
    password_confirmation: 'Admin*1234',
    email: 'admin@example.com',
    role: 2
  )

  admin.create_user_setting(
    dark_mode: false,
    user: admin
  )
  puts 'Admin created Successfully'
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
