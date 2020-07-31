class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     end

    def require_login
        if !session.include? :user_id
            flash[:errors] = "You need to be logged in to do that!"
            redirect_to '/'
        end
    end

   end
