class Player < ActiveRecord::Base
  belongs_to :team
  has_many   :trade_players
    # accepts_nested_attributes_for :player
end
