class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.restaurant_id = params[:restaurant_id].to_i
    if @comment.save
      flash[:notice]= "Thanks for creating a note!"
      redirect_to restaurant_path(@comment.restaurant)
    else
      flash[:notice] = "That did not go through!"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
