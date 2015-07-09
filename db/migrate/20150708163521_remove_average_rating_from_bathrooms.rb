class RemoveAverageRatingFromBathrooms < ActiveRecord::Migration
  def change
    remove_column :bathrooms, :rating_average, :decimal
  end
end
