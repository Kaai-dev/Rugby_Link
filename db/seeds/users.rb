if Rails.env.development?

  User.destroy_all
  UserSetting.destroy_all

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
      user:
    )
    puts 'User: User seeded Successfully'
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
    puts 'User: Coach seeded Successfully'
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
    puts 'User: Admin seeded Successfully'
  end

  unless User.find_by(username: 'goosemeister')
    goosen = User.create(
      username: 'goosemeister',
      password: 'ENV["GOOSEMEISTER_PASSWORD"]',
      password_confirmation: 'ENV["GOOSEMEISTER_PASSWORD"]',
      email: 'jacobus.jgoosen@gmail.com',
      role: 3
    )

    goosen.create_user_setting(
      dark_mode: true,
      user: goosen
    )
    puts 'Goosemeister has landed!'
  end

elsif Rails.env.production?

  unless User.find_by(username: 'goosemeister')
    goosen = User.create(
      username: 'goosemeister',
      password: 'ENV["GOOSEMEISTER_PASSWORD"]',
      password_confirmation: 'ENV["GOOSEMEISTER_PASSWORD"]',
      email: 'jacobus.jgoosen@gmail.com',
      role: 3
    )

    goosen.create_user_setting(
      dark_mode: true,
      user: goosen
    )
    puts 'Goosemeister has landed!'
  end

end
