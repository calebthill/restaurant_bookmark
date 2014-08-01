class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added as friend"
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.destroy
      flash[:notice] = "unfollowed"
      redirect_to followers_path
    else
      flash[:notice] = "Oops, that didn't work!"
    end
  end
end
