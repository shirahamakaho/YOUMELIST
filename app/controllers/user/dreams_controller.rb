class User::DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def create
    Dream.find_or_create_by(things:dream_params[:content])
    #dream_paramsに入ってるcontentと同じthingsがcontentテーブルにあるか探すよ！なければ保存
    redirect_to user_path(current_user.id)
  end

  private

  def dream_params
    params.require(:dream).permit(:content,list: [:dream_id])
  end
end
