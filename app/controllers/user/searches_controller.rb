class User::SearchesController < ApplicationController
  def search
    range = params[:range]
    @word = params[:word]
    @searched_dreams = Dream.looks(params[:search],@word)
    @latest_dream = List.limit(3).updated
    @latest_comment = Comment.limit(5).latest
    @newlist = List.new
  end
end
