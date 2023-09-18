class UserProfilesController < ApplicationController
  before_action :check_for_existing_profile, only: [:create]
  before_action :set_param, only: [:show, :update, :destroy]
  
  def show
    render json: @user_profile
  end
  
  def create
    profile = @current_user.build_user_profile(user_profile_param)
    if profile.save 
      render json: profile 
    else
      render json: profile.errors.full_messages
    end 
  end
  
  def update
    if @user_profile.update(user_profile_param)
      render json: @user_profile
    else
      render json: { errors: @user_profile.full_messages}
    end
  end
  
  def destroy
    if @user_profile.destroy
      render json: { message: 'User Profile deleted successfully!!'}
    else
      render json: { errors: @user_profile.errors.full_messages }
    end
  end
  
  private
  def user_profile_param
    params.permit(:f_name, :l_name, :skills, :experience, :education, :image)
  end
  
  private
  def check_for_existing_profile
    unless @current_user.user_profile.nil?
      render json: 'You have already created profile'
    end
  end

  private
  def set_param
    @user_profile=@current_user.user_profile
    if @user_profile.nil?
      render json: "User not create profile"
    end
  end
end
