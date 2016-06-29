class Trade < ActiveRecord::Base
  has_many   :trade_players
  has_many   :current_teams, class_name: :TradePlayer
  belongs_to :proposing_team, foreign_key: :proposing_team_id, class_name: :Team
  belongs_to :accepting_team, foreign_key: :accepting_team_id, class_name: :Team

  has_many :accepting_team_players, ->(accepting_team) { where current_team: accepting_team }, class_name: :TradePlayer
  has_many :proposing_team_players, ->(proposing_team) { where current_team: proposing_team }, class_name: :TradePlayer
end
