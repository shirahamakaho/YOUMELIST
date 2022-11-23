class ApplicationController < ActionController::Base
  def authenticate
    redirect_to root_path
  end
end
