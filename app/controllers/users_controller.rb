class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        if session[:user_id]
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

   
    def show

    end

    private

    def user_params
        params.require(:user).permit(:username, :years_skating, :password, :email)
    end
    
end
