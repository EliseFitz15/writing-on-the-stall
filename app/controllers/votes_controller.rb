class VotesController < ApplicationController
  before_action :find_review
  binding.pry
  def upvote
    @review = Review.find(params[:review_id])
    @value = Vote.new
    @value.review = @review
    @value.user = current_user
    #This does NOT work, needs fixing
    if @value.vote != 1
      @value.vote = 1
      @value.update(@value.attributes)

    else
      flash[:alert] = "You already upvoted this"
    end
    redirect_to bathroom_path(@review.bathroom)
  end

  def downvote
    @review = Review.find(params[:review_id])
    @value = Vote.new
    @value.review = @review
    @value.user = current_user
    if @value.vote != -1
      @value.vote = -1
      @value.update(@value.attributes)

    else
      flash[:alert] = "You already downvoted this"
    end
    redirect_to bathroom_path(@review.bathroom)
  end

  protected
  def find_review
    @review = Review.find(params[:review_id])
  end

  #This vote_params doesn't work, WHY the fuckkkk.
  def vote_params
    params.require(:vote).permit(:vote, :review_id)
  end
end

# def create
#   @value = @review.votes.new(vote_params)
#   @vote.user = current_user
#
#   if @vote.save
#     if @vote == 1
#       flash[:notice] = "Good vote!"
#       redirect_to review_path(@review)
#     elsif @vote == -1
#       flash[:notice] = "BAM!"
#       redirect_to review_path(@review)
#     end
#   else
#     flash[:alert] = "You done bin plunged!"
#     redirect_to review_path(@review)
#   end
# end
