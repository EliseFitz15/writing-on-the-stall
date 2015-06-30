class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.all
  end
end
