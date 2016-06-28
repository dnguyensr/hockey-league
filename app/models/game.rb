class Game < ActiveRecord::Base
  belongs_to :team, foreign_key: :home_team_id
  belongs_to :team, foreign_key: :away_team_id
  validate :home_team, :away_team

  def home_team
    Team.find(home_team_id)
  end

  def away_team
    self.team
  end
end
