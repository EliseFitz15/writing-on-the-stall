class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :bathroom, null: false
      t.belongs_to :rating, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
