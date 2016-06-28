class AddTeamIdToTradePlayers < ActiveRecord::Migration
  def change
    add_column :trade_players, :current_team_id, :integer
  end
end
