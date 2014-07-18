class RestaurantsController < ApplicationController
  include Yelp::V1::Review::Request
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.order(:name).page params[:page]
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      flash[:notice] = "You just created a restaurant!"
      binding.pry
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
    @current_tab = @restaurants['businesses'].any? ? 'search' : 'favorites'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :phone, :category)
  end
end
