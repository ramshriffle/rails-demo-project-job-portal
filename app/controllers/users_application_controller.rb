class UsersApplicationController < ApplicationController
  before_action :check_job_seeker
  before_action :set_param, only: [:show, :update, :destroy]
  before_action :has_applied?, only: [:create]

  # JobSeeker(current_user) can view all applied job application
  def index
    seeker_all_applications=@current_user.user_applications.all
    render json: seeker_all_applications
  end 

  def create
    application = @current_user.user_applications.new(user_application_param) 
    if application.save
      render json: {message: "Successfully apply for the job", data: application}
    else
      render json: {errors: application.errors.full_messages}
    end
  end

  def destroy
    if @user_application.destroy
      render json: {message: "Application withdraw successfully"}
    else
      render json: {errors: @user_application.errors.full_messages}
    end
  end

  private
  def user_application_param
    params.permit(:status, :job_id) 
  end

  private
  def set_param
    begin
    @user_application = @current_user.user_applications.find(params[:id])
    rescue
      render json: "Seeker not applied"
    end
  end

  private
  def has_applied?
    if UserApplication.where(user_id: @current_user.id, job_id: params[:job_id]).any?
      render json: "You have already applied"
    end
  end
end
