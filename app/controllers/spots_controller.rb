class SpotsController < ApplicationController
    
    def index
        @spots = Spot.all
    end

    def new
        @spot = Spot.new
    end

    def create
        @spot = current_user.spots.build(spot_params)
        if @spot.save
            redirect_to user_spot_path(@spot)
        else
            flash[:error] = "Something went wrong here..."
            redirect_to new_user_spot
        end
    end

    def show
        @spot = Spot.find_by(id: params[:id])
        @reviews = Review.where(spot_id: params[:id]).all
    end

    def edit
        @spot = Spot.find_by(id: params[:id])
    end


    def update
        @spot = Spot.find_by(id: params[:id])
        @spot.update(spot_params)
        redirect_to spot_path(@spot)
    end


    private

    def spot_params
        params.require(:spot).permit(:name, :location, :description, :image, :city_id, :user_id)
    end
end
