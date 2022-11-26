class User::UsersController < ApplicationController
  before_action :authenticate_user!,except:[:show]
  before_action :set_user
  before_action :ensure_normal_user,only:[:edit,:destroy]

  def show
    @newdream = Dream.new
    @lists = @user.lists.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def favorites
    @newdream = Dream.new
    favorites = Favorite.where(user_id:@user.id).pluck(:comment_id)
    @favorite_comments = Comment.find(favorites)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_normal_user
    if @user.email == 'guest@example.com'
      flash[:warning] = "ゲストユーザーは編集できません！"
      redirect_to user_path(@user.id)
    end
  end

end
