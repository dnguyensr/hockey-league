class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :proposing_team_id
      t.integer :accepting_team_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
