class Review < ActiveRecord::Base
  belongs_to :users
  belongs_to :bathrooms
  belongs_to :rating
  validates :body, presence: true
  validates :user_id, presence: true
  validates :bathroom_id, presence: true
  validates :rating_id, presence: true
end
