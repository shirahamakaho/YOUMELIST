# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :user_state,only: [:create]

  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # def create
  #   if resource.nil?
  #     redirect_to new_user_registration_path
  #   end
  #   super
  # end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_state
    @user = User.find_by(email:params[:user][:email])
    return if !@user
    if (@user.valid_password?(params[:user][:password]) && (@user.is_deleted == true))
      flash[:warning] = "このアカウントは使用できません"
      redirect_to new_user_session_path
    end
  end

end
