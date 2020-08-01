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
            review_errors
            render :new
        end
    end

    def show
        find_review
    end

    def edit
        find_review
        if @review.user != current_user            
            flash[:errors] = "You can't edit a review you didn't create!"
            redirect_to spot_review_path(@review.spot, @review)
        end
    end


    def update
        find_review
        if @review.update(review_params)
            redirect_to spot_review_path(@review.spot, @review)
        else
            review_errors
            render :edit
        end
    end


    private

    def review_params
        params.require(:review).permit(:title, :content, :spot_id, :user_id)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def review_errors
        flash[:errors] = @review.errors.full_messages
    end
end