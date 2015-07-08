class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :bathroom
  has_many :votes

  validates :body, presence: true
  validates :user, presence: true
  validates :bathroom, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
  paginates_per 10
end
