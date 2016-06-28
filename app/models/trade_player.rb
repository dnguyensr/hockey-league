class TradePlayer < ActiveRecord::Base
  belongs_to :trade
  belongs_to :player
end
