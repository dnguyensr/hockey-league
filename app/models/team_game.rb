class TeamGame < ActiveRecord::Base
  belongs_to :team,  foreign_key: :team_home_id
  belongs_to :team,  foreign_key: :team_away_id
  belongs_to :game
end
