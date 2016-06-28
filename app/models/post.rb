class Post < ActiveRecord::Base
  belongs_to :team
  belongs_to :author, foreign_key: :author_id, class_name: :team_admin

  def self.filter_by_team(team_id)
    where(team: team_id).order("created_at DESC").limit(5).to_json
  end

end
