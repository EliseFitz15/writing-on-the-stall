class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def avg_rating
    all_ratings = []
    if @reviews.empty?
      return 0.0
    else
      @reviews.each do |r|
        all_ratings << r.rating.to_f
      end
      (all_ratings.sum / all_ratings.length).round(1)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_photo
  end
end
