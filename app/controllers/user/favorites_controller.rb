class User::FavoritesController < ApplicationController
    def create
        @comment_favorite = Favorite.new(user_id:current_user.id,comment_id:params[:comment_id])
        @comment_favorite.save
        redirect_to dream_path(params[:dream_id])
    end

    def destroy
        @comment_favorite = Favorite.find_by(user_id:current_user.id,comment_id:params[:comment_id])
        @comment_favorite.destroy
        redirect_to dream_path(params[:dream_id])
    end
end
