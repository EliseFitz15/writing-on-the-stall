class VotesController < ApplicationController
  def upvote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
    if @value.vote == 1
      @value.vote -= 1
    else
      @value.vote = 1
    end
    @value.save
    flash[:notice] = "Thanks for voting"
    redirect_to bathroom_path(@review.bathroom)
  end

  def downvote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
    if @value.vote == -1
      @value.vote += 1
    else
      @value.vote = -1
    end
    @value.save
    flash[:notice] = "Thanks for voting"
    redirect_to bathroom_path(@review.bathroom)
  end
end
