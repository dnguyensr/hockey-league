# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LeagueAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        Faker::Internet.email,
  password:     "password",
  })

League.create({
  league_admin_id:  1,
  name:             "NHL",
  sport:            "Hockey"
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "abc@abc.com",
  password:     "password"
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "123@123.com",
  password:     "password"
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "xyz@xyz.com",
  password:     "password"
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "yes@yes.com",
  password:     "password"
  })

Team.create({
  team_admin_id:  1,
  name:           Faker::StarWars.specie + 's',
  league_id:      1,
  city:           Faker::Address.city,
  mascot:         Faker::StarWars.specie,
  primary_color:  Faker::Color.color_name,
  secondary_color:Faker::Color.color_name
  })

Team.create({
  team_admin_id:  2,
  league_id:      1,
  name:           Faker::StarWars.specie + 's',
  city:           Faker::Address.city,
  mascot:         Faker::StarWars.specie,
  primary_color:  Faker::Color.color_name,
  secondary_color:Faker::Color.color_name
  })

Team.create({
  team_admin_id:  3,
  league_id:      1,
  name:           Faker::StarWars.specie + 's',
  city:           Faker::Address.city,
  mascot:         Faker::StarWars.specie,
  primary_color:  Faker::Color.color_name,
  secondary_color:Faker::Color.color_name
  })

Team.create({
  team_admin_id:  4,
  league_id:      1,
  name:           Faker::StarWars.specie + 's',
  city:           Faker::Address.city,
  mascot:         Faker::StarWars.specie,
  primary_color:  Faker::Color.color_name,
  secondary_color:Faker::Color.color_name
  })

30.times do
  Player.create({
    first_name:     Faker::Name.first_name,
    last_name:      Faker::Name.last_name,
    jersey_number:  rand(0..99).to_s,
    team_id:        rand(1..Team.count)
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    author_id:    rand(1..TeamAdmin.count),
    team_id:      rand(1..Team.count)
    })
end

game_times = %w(1800 1900 2000 2100 2200)

50.times do
  Game.create({
    away_team_id: rand(1..Team.count),
    home_team_id: rand(1..Team.count),
    game_date:    Faker::Date.forward(50),
    game_time:    game_times[rand(0..4)]
    })
end
