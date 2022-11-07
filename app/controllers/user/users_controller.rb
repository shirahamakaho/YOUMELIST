class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dream = Dream.new
    @lists = current_user.lists.all
  end

  def edit
  end
end
