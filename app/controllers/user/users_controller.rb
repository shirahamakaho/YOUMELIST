class User::UsersController < ApplicationController
  before_action :set_user

  def show
    @newdream = Dream.new
    @dream = Dream.find(params[:id])
    @lists = @user.lists.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit',notice:"名前を入力してください"
    end
  end

  def favorites
    favorites = Favorite.where(user_id:@user.id).pluck(:comment_id)
    @favorite_comments = Comment.find(favorites)
  end
  
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
