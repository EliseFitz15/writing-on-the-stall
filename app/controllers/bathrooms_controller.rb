class BathroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if params[:search]
      @bathrooms = Bathroom.search(params[:search]).order(
        "created_at DESC"
      ).page(params[:page])
      @count = Bathroom.search(params[:search]).count
      flash[:notice] = "#{@count} bathroom(s) found in this area."
    else
      @bathrooms = Bathroom.all.order('created_at DESC').page(params[:page])
    end
  end

  def show
    @bathroom = Bathroom.find(params[:id])
    @reviews = @bathroom.reviews.order(created_at: :desc).page(params[:page])
    @review = Review.new
    @vote_total = Vote.group(:review_id).sum(:vote)
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)
    @bathroom.user = current_user

    if @bathroom.save
      flash[:notice] = "Bathroom Created!"
      redirect_to bathrooms_path
    else
      flash.now[:alert] = @bathroom.errors.full_messages.join(":( ")
      render :new
    end
  end

  def edit
    @bathroom = Bathroom.find(params[:id])
  end

  def update
    @bathroom = Bathroom.find(params[:id])

    if @bathroom.update(bathroom_params)
      flash[:notice] = 'Bathroom Edited'
      redirect_to bathroom_path(@bathroom)
    else
      flash.now[:alert] = @bathroom.errors.full_messages.join(":( ")
      render :edit
    end
  end

  def destroy
    @bathroom = Bathroom.find(params[:id]).destroy
    flash[:notice] = "Bathroom Deleted"
    redirect_to bathrooms_path
  end

  protected

  def bathroom_params
    params.require(:bathroom).permit(:location_name, :street_address,
      :zip_code, :description, :user_id)
  end
end
