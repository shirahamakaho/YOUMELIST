class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dream = Dream.new
    @list = List.new
    @lists = List.all
  end

  def edit
  end
end
