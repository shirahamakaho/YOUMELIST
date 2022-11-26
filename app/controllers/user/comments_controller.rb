class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment,except: [:create]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @dream = Dream.find(params[:dream_id])
    @newlist = List.new
    @list = List.find_by(user_id:current_user.id,dream_id:@dream.id)
    @comments = @dream.comments.all.latest
    render template:"user/dreams/show"
  end

  def update
    @comment.update(comment_params)
    redirect_to dream_path(params[:dream_id])
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment,:dream_id)
  end
end
