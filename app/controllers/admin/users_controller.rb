class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
