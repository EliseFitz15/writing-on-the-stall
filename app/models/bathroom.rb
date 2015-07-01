class Bathroom < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :user, presence: true
  validates :location_name, presence: true
  validates :street_address, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :description, presence: true
end
