class LeagueAdmin::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  def create
    # Find the user type
    admin_class = nil
    if is_league_admin?(params[:league_admin][:email])
      admin_class = :league_admin
    elsif is_team_admin?(params[:league_admin][:email])
      puts "\n\n\nin else if"
      admin_class = :team_admin
    end

    # Attempt authentication with Warden
    puts "\n\n#{admin_class}"
    self.resource = warden.authenticate(scope: admin_class)
    if self.resource.nil?
      puts "\n\n\nauthentication failed"
      # Authentication failed
      flash[:error] = "Invalid username or password."
      return redirect_to new_session_path
    end

    # Successful authentication
    sign_in(admin_class, self.resource)
    respond_with self.resource, :location => after_sign_in_path_for(self.resource)
  end

  def destroy
    sign_out(self.resource)
    redirect_to "/"
  end

  def new
    self.resource = LeagueAdmin.new
  end

  private

  def is_team_admin?(email)
    a = TeamAdmin.find_by(email: email)
    !a.nil?
  end

  def is_league_admin?(email)
    u = LeagueAdmin.find_by(email: email)
    !u.nil?
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(LeagueAdmin)
      super
    elsif resource.is_a?(TeamAdmin)
      return '/'
    end
  end
end
