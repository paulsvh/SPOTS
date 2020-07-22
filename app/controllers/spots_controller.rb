class SpotsController < ApplicationController
    
    def index
        @spots = Spot.all
    end


    def show
        @spot = Spot.find_by(id: params[:id])
        @reviews = Review.where(spot_id: params[:id]).all
    end

    private

    def spot_params
        params.require(:spot).permit(:name, :location, :description, :image, :city_id, :user_id)
    end
end
