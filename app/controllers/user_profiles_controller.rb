class UserProfilesController < ApplicationController
  before_action :check_for_existing_profile, only: [:create]
  
  def show
    if !@current_user.user_profile.nil?
    render json: @current_user.user_profile
    else
      render json: "User not create his profile"
    end
  end
  
  def create
    profile=@current_user.build_user_profile(user_profile_param)
    if profile.save 
      render json: profile 
    else
      render json: profile.errors.full_messages
    end 
  end
  
  def update
    user = @current_user.user_profile
    if user.update(user_profile_param)
      render json: user
    else
      render json: { errors: user.errors.full_messages}
    end
  end
  
  def destroy
    user = @current_user.user_profile
    if user.destroy
      render json: { message: 'User Profile deleted successfully!!'}
    else
      render json: { errors: @current_user.user_profile.errors.full_messages }
    end
  end
  
  private
  def user_profile_param
    params.permit(:f_name, :l_name, :skills, :experience, :education, :image)
  end
  
  private
  def check_for_existing_profile
    if @current_user.user_profile
      render json: 'You have already created profile'
    end
  end
end
