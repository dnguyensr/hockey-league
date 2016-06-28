# wireframe
  * League View: https://wireframe.cc/NU4hyo
  * League Admin View: https://wireframe.cc/808Hf0
  * Team View: https://wireframe.cc/Md8VPt
  * Team Admin View: https://wireframe.cc/fO3kUL
  * Trade View: https://wireframe.cc/CN3ruU

# Scaffolding

bin/rails generate scaffold League league_admin_id:integer name:string sport:string

bin/rails generate scaffold Team team_admin_id:integer name:string league_id:integer city:string mascot:string primary_color:string secondary_color:string

bin/rails generate scaffold Player first_name:string last_name:string jersey_number:string team_id:integer

bin/rails generate scaffold Game team_game_id:integer game_date:date game_time:time

bin/rails generate scaffold Post title:string content:text author_id:integer team_id:integer

bin/rails generate scaffold Trade proposing_team_id:integer accepting_team_id:integer accepted:boolean

# Devise generated
<!-- bin/rails generate scaffold User email:string password:password first_name:string last_name:string -->

rails generate devise:views LeagueAdmin

rails generate devise:controllers LeagueAdmin

rails generate devise:views TeamAdmin

rails generate devise:controllers TeamAdmin
<!--
bin/rails generate scaffold LeagueAdmin league_id:integer email:string password:password first_name:string last_name:string

bin/rails generate scaffold TeamAdmin team_id:integer email:string password:password first_name:string last_name:strin -->g

# Join Tables (do not scaffold)


TeamGames away_team_id:integer home_team_id:integer game_id:integer

TradePlayers player_id:integer trade_id:integer
