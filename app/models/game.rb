class Game < ActiveRecord::Base
  belongs_to :home_team, foreign_key: :home_team_id, class_name: :Team
  belongs_to :away_team, foreign_key: :away_team_id, class_name: :Team
  validates :home_team, :away_team, :date_time, presence: true

  def self.filter_by_team(team_id)
    where("home_team_id = ? or away_team_id =?", team_id, team_id).order("created_at DESC").limit(12)
  end

end
