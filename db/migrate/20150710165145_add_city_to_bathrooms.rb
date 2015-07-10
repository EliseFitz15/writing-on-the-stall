class AddCityToBathrooms < ActiveRecord::Migration
  def change
    add_column :bathrooms, :city, :string, null: false
  end
end
