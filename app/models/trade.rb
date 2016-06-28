class Trade < ActiveRecord::Base
  has_many   :trade_players
  belongs_to :team, foreign_key: :proposing_team_id
  belongs_to :team, foreign_key: :accepting_team_id
end
