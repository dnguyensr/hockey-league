class LeagueAdmin::RegistrationsController < Devise::RegistrationsController
before_action :one_league_admin_registered?, only: [:new, :create]

  protected

  def one_league_admin_registered?
    if ((LeagueAdmin.count == 1) && (league_admin_signed_in?))
      redirect_to root_path
    elsif LeagueAdmin.count == 1
      redirect_to new_team_admin_registration_path
    end
  end

  def sign_up_params
    params.require(:league_admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
