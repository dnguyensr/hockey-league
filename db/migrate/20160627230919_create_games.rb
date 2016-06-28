class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :away_team_id
      t.integer :home_team_id
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
