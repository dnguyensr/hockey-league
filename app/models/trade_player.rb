class TradePlayer < ActiveRecord::Base
  belongs_to :trade
  belongs_to :player
  belongs_to :current_team, class_name: :Team

  def readable_date
    self.created_at.strftime("%B %d, %Y")
  end
end
