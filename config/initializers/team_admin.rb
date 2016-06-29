module Devise
  module Strategies
    class Admin < Base
      def valid?
        params["league_admin"] || params["password"]
      end

      def authenticate!
        # Get email and password

        email = params["league_admin"]["email"]
         puts "\n\n\nemail\n\n #{email}\n\n"
         puts params
        password = params["league_admin"]["password"]

        # Try to login
        team_admin = TeamAdmin.find_by(email: email)

        if team_admin.nil?
          fail!("Team Admin login failed.")
        else
          if team_admin.valid_password?(password)
            success!(team_admin)
          else
            fail!("Invalid Password")
          end
        end
      end
    end
  end
end
