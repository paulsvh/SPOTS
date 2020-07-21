class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     end
 
    def require_login
        redirect_to '/' unless session.include? :user_id
    end

    def current_creator
        @current_creator ||= Creator.find_by(id: session[:creator_id]) if session[:creator_id]
    end

   end
