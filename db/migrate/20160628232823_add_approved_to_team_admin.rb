class AddApprovedToTeamAdmin < ActiveRecord::Migration
  def change
    add_column :team_admins, :approved, :boolean, default: false, null: false
  end
end
