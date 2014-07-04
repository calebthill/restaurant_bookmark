class CreateFavoriteRestaurantsTable < ActiveRecord::Migration
  def change
    create_table :favorite_restaurants do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false

      t.timestamps
    end
  end
end
