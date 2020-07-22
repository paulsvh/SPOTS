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
            flash[:error] = "Something went wrong here..."
            redirect_to '/signup'
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
