class FavoriteRestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.favorite_restaurants
  end

  def create
    @favorite_restaurant = FavoriteRestaurant.new(user_id: current_user.id,
                                                 restaurant_id: params[:restaurant_id])
    if @favorite_restaurant.save
      flash[:notice] = "Restaurant added to favorites!"
      redirect_to favorite_restaurants_path
    else
      flash[:notice] = "That didn't go through!"
      redirect_to favorite_restaurants_path
    end
  end
end
