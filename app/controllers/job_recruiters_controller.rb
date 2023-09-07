class JobRecruitersController < ApplicationController
  before_action :check_job_recruiter, only: [:update]
  before_action :set_param, only: [:view_applied_job, :update]

  def view_applied_job
    begin
      @job= @current_user.jobs.find(params[:id])
      applied_applications = @job.user_applications
      if ! applied_applications.blank?
        render json: applied_applications
      else
        render json: "Nobody apply for job"
      end
    rescue
      render json: "Job Not Found"
    end
  end

  def index
    applications = UserApplication.where(status: params[:status])
    render json: applications
  end

  def update
    if @current_user==@application.job.user
      if @application.update(recruiter_param)
        render json: {message: "Application Updated",data: @application}
      else
        render json: seeker_application.errors.full_messages
      end
    else
      render json: "You not permission to accept and reject the job"
    end
  end
  
  private
  def recruiter_param
    params.permit(:status)
  end

  private
  def set_param
    begin
      @application= UserApplication.find(params[:id])
    rescue
      render json: "application not Found"
    end
  end
end
