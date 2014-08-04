class API::UsersController < ApplicationController
  def index
    @users_api_info = Array.new
    @users = User.all
    @users.each do |user|
      @users_api_info << {
        users_first_name: user.first_name,
        users_last_name: user.last_name,
        users_restaurant: user.restaurants,
        users_friends: user.friends
      }
    end

    respond_to do |format|
      format.json { render :json => @users_api_info}
    end
  end
end
