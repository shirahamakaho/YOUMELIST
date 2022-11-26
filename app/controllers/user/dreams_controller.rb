class User::DreamsController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]

  def index
    if params[:old]
      @dreams = Dream.old
    elsif params[:count_user]
      @dreams = Dream.user_ranking
    elsif params[:count_comment]
      @dreams = Dream.comment_ranking
      # dream.rbに記述
    else
      @dreams = Dream.latest
    end
    @latestdream = List.limit(3).order("updated_at DESC")
    @latestcomment = Comment.limit(5).latest
    @list = List.new
  end

  def show
    @dream = Dream.find(params[:id])
    @newlist = List.new
    if user_signed_in?
      @list = List.find_by(user_id:current_user.id,dream_id:@dream.id)
    end
    @comments = @dream.comments.all.latest
    @comment = Comment.new
  end

  def create
    if @dream = Dream.find_or_create_by(content:dream_params[:content])
      # dream_params に入ってる content と同じ content が Dream テーブルにあるか探す、なければ作成、保存
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
