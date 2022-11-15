class User::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @dreams = Dream.looks(params[:search],params[:word])
    @word = params[:word]
  end
end
