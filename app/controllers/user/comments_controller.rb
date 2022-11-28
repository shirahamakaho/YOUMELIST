class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment,except: [:create]
  before_action :set_dream

  def create
    comment = current_user.comments.new(comment_params)
    redirect_to dream_path(@dream.id)
  end

  def edit
    @newlist = List.new
    @list = List.find_by(user_id:current_user.id,dream_id:@dream.id)
    @comments = @dream.comments.all.latest
    render template:"user/dreams/show"
  end

  def update
    @comment.update(comment_params)
    redirect_to dream_path(@dream.id)
  end

  def destroy
    @comment.destroy
    redirect_to dream_path(@dream.id)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def comment_params
    params.require(:comment).permit(:comment,:dream_id)
  end
end
