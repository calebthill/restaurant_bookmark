class AddYelpPhotoUrlToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :yelp_photo_url, :string
  end
end
