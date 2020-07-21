class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong! Try again or "
      redirect_to login_url, notice: "Nope"
    end
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
  
end
