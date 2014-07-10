class AddYelpReviewToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :yelp_review, :string
  end
end
