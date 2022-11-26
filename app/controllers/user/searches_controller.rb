class User::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    @searched_dreams = Dream.looks(params[:search],@word)
    @latestdream = List.limit(3).order("updated_at DESC")
    @latestcomment = Comment.limit(5).latest
    @list = List.new
  end
end
