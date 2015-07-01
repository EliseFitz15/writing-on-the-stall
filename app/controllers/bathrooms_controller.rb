class BathroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
    @reviews = @bathroom.reviews.order(created_at: :desc)
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
      render :new
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
