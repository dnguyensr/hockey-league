class Player < ActiveRecord::Base
  belongs_to :team
  has_many   :trade_players
    # accepts_nested_attributes_for :player

  def full_name
    self.first_name + " " + self.last_name
  end
end
