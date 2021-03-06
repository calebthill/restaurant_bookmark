class API::UsersController < ApplicationController
  before_action :restrict_access

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
      format.json { render json: @users_api_info}
    end
  end

  private

  def restrict_access
    api_key = APIKey.find_by_access_token(params[:access_token])
    head :unauthorize unless api_key
  end
end
