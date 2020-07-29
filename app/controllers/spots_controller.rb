class SpotsController < ApplicationController
    
    def index
        if params[:user_id]
          @spots = current_user.spots
        else
          @spots = Spot.all
        end
      end
      
    def new
        @spot = Spot.new
    end

    def create
        @spot = Spot.new(spot_params)
        @spot.user = current_user
        if @spot.save
            redirect_to user_spot_path(current_user, @spot)
        else
            render :new
        end
    end

    def show
        @spot = Spot.find_by(id: params[:id])
    end

    def edit
        @spot = Spot.find_by(id: params[:id])
        if @spot.user != current_user            
            flash[:error] = "You can't edit a spot you didn't create!"
            redirect_to user_spot_path(current_user, @spot)
        end
    end


    def update
        @spot = Spot.find_by(id: params[:id])
        @spot.update(spot_params)
        redirect_to spot_path(@spot)
    end


    private

    def spot_params
        params.require(:spot).permit(:name, :location, :description, :image, :user_id)
    end
end
