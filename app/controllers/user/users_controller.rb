class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @newdream = Dream.new
    @dream = Dream.find(params[:id])
    @lists = @user.lists.all
  end

  def edit
  end
end
