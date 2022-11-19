class User::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    @searched_dreams = Dream.looks(params[:search],@word)
    if params[:latest]
      @dreams = Dream.latest
    elsif params[:old]
      @dreams = Dream.old
    else
      @dreams = Dream.all
    end
    @latestdream = Dream.limit(3).order("created_at DESC")
    @latestcomment = Comment.limit(5).order("created_at DESC")
    @list = List.new
  end
end
