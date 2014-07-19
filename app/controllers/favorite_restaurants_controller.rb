class FavoriteRestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.restaurants.order(rating: :desc)
  end

  def create
    if params[:restaurant_id]
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
      @restaurant = Restaurant.find_or_create_by(
        name: params[:restaurant],
        address: params[:address],
        city: params["city"],
        state: params["state"],
        zipcode: params["zipcode"],
        phone: params["phone"],
        rating: params["rating"],
        yelp_review: params["yelp_review"],
        category: params["category"],
        yelp_photo_url: params["yelp_photo_url"],
        user_id: current_user.id
      )
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @favorite_restaurant = FavoriteRestaurant.where(user: current_user,
      restaurant_id: params[:id].to_i).first
    if @favorite_restaurant.destroy
      flash[:notice]= "Removed from favorites"
    end
    redirect_to favorite_restaurants_path
  end

  def chart
    @favorite_restaurants = current_user.restaurants
  end
end


