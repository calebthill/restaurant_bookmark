class FavoriteRestaurantsController < ApplicationController
  #before_action :search
  def index
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.restaurants
  end

  def create
    if params["restaurant_id"] != nil
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
    else
      @restaurant = Restaurant.find_or_create_by(name: params["restaurant"], address: params["address"],
                                                 city: params["city"], state: params["state"],
                                                 zipcode: params["zipcode"], phone: params["phone"],
                                                 rating: params["rating"], yelp_review: params["yelp_review"], user_id: current_user.id)
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @favorite_restaurant = FavoriteRestaurant.where(user_id: current_user, restaurant_id: params[:id].to_i)
    @favorite_restaurant.first.destroy
    flash[:notice]= "Removed from favorites"
    redirect_to favorite_restaurants_path
  end
end


