class TradePlayer < ActiveRecord::Base
  belongs_to :trade
  belongs_to :player
  has_one :current_team, class_name: :Player, foreign_key: :team_id
end
