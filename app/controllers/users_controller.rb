class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new

    end

    def create

    end

   
    def show

    end

    private

    def user_params

    end
    
end
