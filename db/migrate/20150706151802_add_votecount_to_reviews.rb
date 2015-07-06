class AddVotecountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :votecount, :integer, default: 0
  end
end
