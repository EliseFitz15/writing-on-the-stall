class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  validates :review_id, presence: true
  validates :vote, inclusion: {in: -1..1 }
end



# , uniqueness: { scope: :user_id }
