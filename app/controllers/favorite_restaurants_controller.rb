class FavoriteRestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.favorite_restaurants
  end
end
