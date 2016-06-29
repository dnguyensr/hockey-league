class Post < ActiveRecord::Base
  belongs_to :team
  belongs_to :author, foreign_key: :author_id, class_name: :TeamAdmin
  validates :title, :content, :team_id, presence: true

  def self.filter_by_team(team_id)
    where(team: team_id).order("created_at DESC").limit(5)
  end

  def readable_date
    self.created_at.strftime("%B %d, %Y")
  end
end
