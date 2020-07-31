class ReviewsController < ApplicationController
      
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.user = current_user
        @review.spot = Spot.find_by_id(params[:spot_id])
        if @review.save
            redirect_to spot_review_path(@review.spot, @review)
        else
            flash[:errors] = @review.errors.full_messages
            render :new
        end
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def edit
        @review = Review.find_by(id: params[:id])
        if @review.user != current_user            
            flash[:errors] = "You can't edit a review you didn't create!"
            redirect_to spot_review_path(@review.spot, @review)
        end
    end


    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            redirect_to spot_review_path(@review.spot, @review)
        else
            flash[:errors] = @review.errors.full_messages
            render :edit
        end
    end


    private

    def review_params
        params.require(:review).permit(:title, :content, :spot_id, :user_id)
    end
end