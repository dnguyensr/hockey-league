class TeamGame < ActiveRecord::Base
  belongs_to :team,  foreign_key: :team_home_id
  belongs_to :team,  foreign_key: :team_away_id
  belongs_to :game

  def gamewinner
    if home_team_score > away_team_score
      return home_team.teamcity
    elsif away_team_score > home_team_score
      return home_team.teamcity
    elsif away_team_score == home_team_score && away_team_score != nil
      return "tie"
    else
      return "pending"
    end
  end
end
