class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.belongs_to :user
      t.decimal :rating_average
      t.string :location_name, null: false
      t.string :street_address, null: false
      t.string :zip_code, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
