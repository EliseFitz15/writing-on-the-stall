class ReviewsController < ApplicationController
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review.bathroom = @bathroom
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review saved"
      redirect_to bathroom_path(params[:bathroom_id])
    else
      flash.now[:error] = @review.errors.full_messages.join(". ")
      render "bathrooms/show"
    end
  end

  protected
  
  def review_params
    params.require(:review).permit(:body, :rating, :bathroom_id)
  end
end
