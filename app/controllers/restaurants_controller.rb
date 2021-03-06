class RestaurantsController < ApplicationController
  include Yelp::V1::Review::Request
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.search(params[:search]).page params[:page]
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      flash[:notice] = "You just created a restaurant!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "That didnt go through!"
      render :show
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  def search
    client = Yelp::Client.new
    yelp_request = Location.new(
        :term => params["term"],
        :city => params["city"],
        :state => params["state"]
        )
    @restaurant = Restaurant.new
    @favorite_restaurants = current_user.restaurants
    @restaurants = client.search(yelp_request)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :phone, :category)
  end
end
