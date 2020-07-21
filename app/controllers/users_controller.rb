class UsersController < ApplicationController
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
            flash[:error] = "Something didn't work..."
            redirect_to new_user_path
        end
    end

   
    def show
        @user = current_user
        if @user.nil?
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :years_skating, :password, :email)
    end
    
end
