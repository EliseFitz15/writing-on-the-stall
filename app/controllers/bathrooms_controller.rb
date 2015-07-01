class BathroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
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
      flash[:alert] = @bathroom.errors.full_messages.join(":( ")
      redirect_to new_bathroom_path
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
      flash[:alert] = @bathroom.errors.full_messages.join(":( ")
      redirect_to edit_bathroom_path(@bathroom)
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
