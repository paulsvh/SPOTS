class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to '/signup'
        end
    end

   
    def show
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
    
end
