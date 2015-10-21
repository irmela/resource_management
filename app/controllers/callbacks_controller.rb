class CallbacksController < Devise::OmniauthCallbacksController
    def redmine
        # Register user if authorized
        if User.user_is_authorized(request.env["omniauth.auth"].uid)
          @user = User.from_omniauth(request.env["omniauth.auth"])
          sign_in_and_redirect @user
        # if user is not authorized redirect to new_user_session_path
        else
          redirect_to new_user_session_path, notice: 'Could not authenticate you from Redmine because "Invalid credentials".'
        end
    end
end
