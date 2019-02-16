module SessionsHelper
    def log_in(user)
        callback = session[:callback]
        reset_session
        session[:user_id] = user.id
        session[:callback] = callback
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !current_user.nil?
    end
end
