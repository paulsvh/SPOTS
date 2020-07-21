class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def welcome
  end

  def new
  end

  def create
    user = User.find_by(name: params[:user][:username])

    user = user.try(:authenticate, params[:user][:password])

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
