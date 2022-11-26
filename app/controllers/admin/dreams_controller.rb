class Admin::DreamsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @dreams = Dream.all
  end
  
  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_back(fallback_location: root_path)
  end
end
