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
    @reviews = @bathroom.reviews.order(created_at: :desc).page(params[:page])
    @vote_total = Vote.group(:review_id).sum(:vote)

    if @review.save
      # ReviewNotifier.new_review(@review).deliver_later
      flash[:notice] = "Review saved"
      redirect_to bathroom_path(params[:bathroom_id])
    else
      flash.now[:alert] = @review.errors.full_messages.join(". ")
      render "bathrooms/show"
    end
  end

  def destroy
    @bathroom = Bathroom.find(params[:bathroom_id])
    @deletereview = Review.find(params[:id]).destroy
    flash[:notice] = "Review Deleted"
    redirect_to bathroom_path(@bathroom)
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating, :bathroom_id)
  end
end
