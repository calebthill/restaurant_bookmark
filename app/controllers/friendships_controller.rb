class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    # binding.pry
    if @friendship.save
      flash[:notice] = "Added as friend"
      redirect_to favorite_restaurants_path
    else
      render :new
    end
  end

  def destroy
  end
end
