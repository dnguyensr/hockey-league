class Game < ActiveRecord::Base
  belongs_to :team, foreign_key: :home_team_id
  belongs_to :team, foreign_key: :away_team_id

  def self.filter_by_team(team_id)
    where(team: team_id).order("created_at DESC").limit(5)
  end
end
