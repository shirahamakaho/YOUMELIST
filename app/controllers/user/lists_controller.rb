class User::ListsController < ApplicationController
  def show
  end

  def create
    List.find_or_create_by(user_id:current_user.id,dream_id:list_params[:dream_id])
    redirect_to user_path(current_user.id)
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    redirect_to user_path(current_user.id)
  end

  private

  def list_params
    params.require(:list).permit(:user_id,:dream_id,:memo)
  end
end
