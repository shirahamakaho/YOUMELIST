class User::DreamsController < ApplicationController
  def index
    @dreams = Dream.all
    @list = List.new
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def create
    @dream = Dream.find_or_create_by(content:dream_params[:content])
    # dream_params に入ってる content と同じ content が Dream テーブルにあるか探す、なければ保存
    List.find_or_create_by(user_id:current_user.id,dream_id:@dream.id)
    # current_user_id と @dream の dream_id を List テーブルに保存
    redirect_to user_path(current_user.id)
  end

  private

  def dream_params
    params.require(:dream).permit(:content)
  end
end
