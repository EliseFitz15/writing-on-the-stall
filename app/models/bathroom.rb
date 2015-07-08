class Bathroom < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :user, presence: true
  validates :location_name, presence: true
  validates :street_address, presence: true, uniqueness: true
  validates :zip_code, length: { is: 5 }
  validates :zip_code, numericality: { only_integer: true }
  validates :description, presence: true

  def self.search(query)
    where("zip_code = ?", "#{query}")
  end

  # def avg_rating
  #   # @bathroom = Bathroom.find(params[:id])
  #   # @reviews = @bathroom.reviews.order(created_at: :desc).page(params[:page])
  #   all_ratings = []
  #   @reviews.each do |r|
  #     all_ratings << r.rating.to_f
  #   end
  #   (all_ratings.sum / all_ratings.length).round(1)
  # end

  paginates_per 10
end
