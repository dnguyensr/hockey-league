class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_admin_id
      t.string :name
      t.integer :league_id
      t.string :city
      t.string :mascot
      t.string :primary_color
      t.string :secondary_color

      t.timestamps null: false
    end
  end
end
