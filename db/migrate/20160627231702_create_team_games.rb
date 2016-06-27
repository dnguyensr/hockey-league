class CreateTeamGames < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.integer :away_team_id
      t.integer :home_team_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
