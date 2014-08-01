class UsersController < ApplicationController
  before_filter :check_following, only: :show

  def index
    @users = User.order(:first_name).page params[:page]
  end

  def show
    @user = User.find(params["id"])
  end

  def followers
  end
end
