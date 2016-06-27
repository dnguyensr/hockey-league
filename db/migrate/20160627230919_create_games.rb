class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team_game_id
      t.date :game_date
      t.time :game_time

      t.timestamps null: false
    end
  end
end
