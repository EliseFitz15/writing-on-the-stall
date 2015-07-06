class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :bathroom
  has_many :votes
  validates :body, presence: true
  validates :user_id, presence: true
  validates :bathroom_id, presence: true
  validates :rating, presence: true
end
