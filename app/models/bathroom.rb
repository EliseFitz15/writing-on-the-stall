class Bathroom < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  
  validates :user, presence: true
  validates :location_name, presence: true
  validates :street_address, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :description, presence: true
end
