class UserProfilesController < ApplicationController
  before_action :check_for_existing_profile, only: [:create]
  
  def show
    render json: @current_user.user_profile
  end
  
  def create
    profile=@current_user.create_user_profile(user_profile_param)
    if profile   
      render json: { message:"User Profile Created!!!", data: profile }
    else
      render json: profile.errors.full_messages
    end 
  end

  def update
    user=@current_user.user_profile
    if user.update(user_profile_param)
      render json: { message: 'User Profile updated', data: @current_user}
    else
      render json: { errors: @current_user.user_profile.errors.full_messages}
    end
  end

  def destroy
    user=@current_user.user_profile
    if user.destroy
      render json: { message: 'User Profile deleted'}
    else
      render json: { errors: @current_user.user_profile.errors.full_messages }
    end
  end

  private
  def user_profile_param
    params.permit(:f_name, :l_name, :skills, :experience, :education)
  end

  private
  def check_for_existing_profile
    if @current_user.user_profile
      render json: 'Some message about already having a profile'
    end
  end
end
