# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LeagueAdmin.create({
  first_name:   'Kevin',
  last_name:    'Solorio',
  email:        'ksolo@dbc.com',
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
  password:     "password",
  approved:     true
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "123@123.com",
  password:     "password",
  approved:     true
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "xyz@xyz.com",
  password:     "password",
  approved:     true
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "yes@yes.com",
  password:     "password",
  approved:     true
  })

TeamAdmin.create({
  first_name:   Faker::Name.first_name,
  last_name:    Faker::Name.last_name,
  email:        "no@no.com",
  password:     "password",
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

positions = %w(RW LW C D G)

30.times do
  Player.create({
    first_name:     Faker::Name.first_name,
    last_name:      Faker::Name.last_name,
    position:       positions[rand(0..4)],
    jersey_number:  rand(0..99).to_s,
    team_id:        rand(1..Team.count)
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    author_id:    1,
    team_id:      1
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    author_id:    2,
    team_id:      2
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    author_id:    3,
    team_id:      3
    })
end

10.times do
  Post.create({
    title:        Faker::StarWars.quote,
    content:      Faker::StarWars.quote,
    author_id:    4,
    team_id:      4
    })
end

50.times do
  Game.create({
    away_team_id: rand(1..Team.count),
    home_team_id: rand(1..Team.count),
    date_time:    Faker::Time.forward(20, :evening)
    })
end
