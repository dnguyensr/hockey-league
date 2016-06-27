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
  admin_id:     1
  league_name:  "NHL"
  sport:        "Hockey"
  })

4.times do
  Team.create({
    name:         Faker::StarWars.specie + 's',
    city:         Faker::Address.city,
    mascot:       Faker::StarWars.specie,
    league_id:    1,
    })
end

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "abc@abc.com",
  password:     "password",
  team_id:      1
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        Faker::Internet.email,
  password:     "password",
  team_id:      2
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        Faker::Internet.email,
  password:     "password",
  team_id:      3
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        Faker::Internet.email,
  password:     "password",
  team_id:      4
  })

30.times do
  Player.create({
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    team_id:      rand(1..Team.count)
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    team_id:      rand(1..Team.count)
    })
end

game_times = %w(1800 1900 2000 2100 2200)

50.times do
  Game.create({
    game_date:    Faker::Date.forward(50),
    game_time:    game_times[rand(0..4)]
    })
end
