class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login(user)
        session[:session_token] = user.reset_token!
    end

    def logout
        current_user.reset_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end
end
