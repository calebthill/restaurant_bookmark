class FavoriteRestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.restaurants
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite_restaurant = FavoriteRestaurant.new(user_id: current_user.id,
                                                 restaurant_id: params[:restaurant_id])
    if @favorite_restaurant.save
      flash[:notice] = "Restaurant Added to favorites!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "That didn't go through!"
      redirect_to favorite_restaurants_path
    end
  end

  def destroy
    @favorite_restaurant = FavoriteRestaurant.where(user_id: current_user, restaurant_id: params[:id].to_i)
    @favorite_restaurant.first.destroy
    flash[:notice]= "Removed from favorites"
    redirect_to favorite_restaurants_path
  end
end
