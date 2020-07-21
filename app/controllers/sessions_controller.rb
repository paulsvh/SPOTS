class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    user = user.try(:authenticate, params[:user][:password])
    flash[:error] = "Something didn't work..."
    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
  
end
