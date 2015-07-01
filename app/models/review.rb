class Review < ActiveRecord::Base
  belongs_to :users
  belongs_to :bathrooms
  validates :body, presence: true
  validates :user_id, presence: true
  validates :bathroom_id, presence: true
  validates :rating, presence: true
end
