class Admin::BathroomsController < ApplicationController
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
  end
end
