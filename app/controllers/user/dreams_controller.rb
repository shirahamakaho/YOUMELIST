class User::DreamsController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]

  def index
    if params[:latest]
      @dreams = Dream.latest
    elsif params[:old]
      @dreams = Dream.old
    else
      @dreams = Dream.all.order("created_at DESC")
    end
    @latestdream = List.limit(3).order("updated_at DESC")
    @latestcomment = Comment.limit(5).order("created_at DESC")
    @list = List.new
  end

  def show
    @dream = Dream.find(params[:id])
    @newlist = List.new
    @list = List.find_by(user_id:current_user.id,dream_id:@dream.id)
    @comments = @dream.comments.all.order("created_at DESC")
    @comment = Comment.new
    # @editcomment = Comment.find(params[:id])
  end

  def create
    if @dream = Dream.find_or_create_by(content:dream_params[:content])
      # dream_params に入ってる content と同じ content が Dream テーブルにあるか探す、なければ保存
      List.find_or_create_by(user_id:current_user.id,dream_id:@dream.id)
      # current_user_id と @dream の dream_id を List テーブルに保存
      redirect_to user_path(current_user.id)
    else
      render "show"
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:content)
  end

end
