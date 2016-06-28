class Player < ActiveRecord::Base
  belongs_to :team
  has_many   :trade_players
end
