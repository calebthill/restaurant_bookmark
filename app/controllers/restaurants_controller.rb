class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      FavoriteRestaurant.create(user_id: current_user.id, restaurant_id: @restaurant.id)
      flash[:notice] = "You just created a restaurant!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "That didnt go through!"
      redirect_to restaurants_path
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode)
  end
end
