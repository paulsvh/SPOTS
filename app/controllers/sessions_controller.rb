class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def index
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong! Try again or "
      redirect_to login_url
    end
  end

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid']
    end
    if session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong!" 
      redirect_to login_url
    end
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end
