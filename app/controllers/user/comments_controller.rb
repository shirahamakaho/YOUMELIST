class User::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @comment = Commen.find(params[:id])
    @comment.update(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:dream_id)
  end
end
