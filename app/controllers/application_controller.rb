class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in
    before_action :authorized

    def current_user
        User.find_by(id: session[:current_user_id])  
        reset_session
    end

    def logged_in  
        # Missing arg here
        !current_user.nil?  
    end

    def authorized
        redirect_to '/' unless logged_in
    end

end
