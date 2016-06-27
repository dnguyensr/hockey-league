class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :league_admin_id
      t.string :name
      t.string :sport

      t.timestamps null: false
    end
  end
end
