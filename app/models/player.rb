class Player < ActiveRecord::Base
  belongs_to :team
  has_many   :trade_players
    # accepts_nested_attributes_for :player

  def full_name
    self.first_name + " " + self.last_name
  end

  def readable_date
    self.created_at.strftime("%B %d, %Y")
  end
end
