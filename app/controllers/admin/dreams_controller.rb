class Admin::DreamsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @dreams = Dream.all
  end
  
  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_to admin_dreams_path
  end
end
