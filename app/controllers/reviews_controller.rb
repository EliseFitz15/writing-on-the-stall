class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review.bathroom = @bathroom


  end

  protected
  def review_params
    params.require(:review).permit(:body, :rating, :bathroom_id)
  end
end
