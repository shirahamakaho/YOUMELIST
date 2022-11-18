class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_back(fallback_location: root_path)
  end
end
