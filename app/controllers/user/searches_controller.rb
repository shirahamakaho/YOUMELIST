class User::SearchesController < ApplicationController
  def search
    # @dream = Dream.all
    @range = params[:range]
    @dreams = Dream.looks(params[:search],params[:word])
    # if @range == "Dream"
    #   @dreams = Dream.looks(params[:search],params[:word])
    # else
    #   @comments = @dream.comments.looks(params[:search],params[:word])
    # end
  end
end
