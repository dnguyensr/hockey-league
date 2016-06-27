class CreateTradePlayers < ActiveRecord::Migration
  def change
    create_table :trade_players do |t|
      t.integer :player_id
      t.integer :trade_id

      t.timestamps null: false
    end
  end
end
