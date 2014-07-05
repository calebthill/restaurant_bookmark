class FavoriteRestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
  end
end
