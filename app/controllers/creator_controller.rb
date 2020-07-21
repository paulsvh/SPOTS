class CreatorController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @creator = Creator.new
    end

    def create
        @creator = Creator.create(creator_params)
        session[:user_id] = @creator.id
        if session[:user_id]
            redirect_to creator_path(@creator)
        else
            redirect_to new_creator_path
        end
    end

   
    def show
        @creator = current_creator
        if @creator.nil?
            redirect_to '/'
        end
    end

    private

    def creator_params
        params.require(:creator).permit(:username, :password, :email)
    end
end
