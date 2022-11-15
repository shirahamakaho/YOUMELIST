class User::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    @dreams = Dream.looks(params[:search],@)
  end
end
