class League < ActiveRecord::Base
  has_many :teams
  belongs_to :league_admin
end
