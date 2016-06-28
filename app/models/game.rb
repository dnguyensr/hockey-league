class Game < ActiveRecord::Base
  belongs_to :team, foreign_key: :home_team_id
  belongs_to :team, foreign_key: :away_team_id
  validate :home_team, :away_team


  def self.filter_by_team(team_id)
    where("home_team_id = ? or away_team_id =?", team_id, team_id).order("created_at DESC").limit(12)
  end

  def home_team
    Team.find(home_team_id)
  end

  def away_team
    Team.find(away_team_id)
  end
end
