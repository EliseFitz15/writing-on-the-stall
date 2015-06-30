class BathroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]
  def index
    @bathrooms = Bathroom.all
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)
    @bathroom.user_id = current_user.id

    if @bathroom.save
      flash[:notice] = "Bathroom Created!"
      redirect_to bathrooms_path
    else
      render :new
    end

  end

  protected
    def bathroom_params
      params.require(:bathroom).permit(:location_name, :street_address, :zip_code, :description, :user_id)
    end
end
