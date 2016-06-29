module TeamsHelper

  def authenticate_team_to_manager
    unless Player.find_by(team_id: Team.find_by(team_admin_id: current_team_admin.id))
      redirect '/'
    end
  end

end
