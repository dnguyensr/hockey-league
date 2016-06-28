class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :team_admin
  has_many   :posts

end
