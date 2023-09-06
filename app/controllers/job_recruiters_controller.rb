class JobRecruitersController < ApplicationController
  before_action :check_job_recruiter, only: [:update]
  before_action :set_param, only: [:view_applied_job, :update]



  def view_applied_job
    begin
    # @job= @current_user.jobs.find(params[:id])
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
    # seeker_application = UserApplication.find(params[:id])
    # if seeker_application.update(set_param)
    #   render json: "Application Updated"
    # else
    #   render json: seeker_application.errors.full_messages
    # end

    job_application= @job.user_applications.find(params[:id])
    if job_application.update(recruiter_param)
      render json: "Application Updated"
    else
      render json: seeker_application.errors.full_messages
    end
  end
  
  private
  def recruiter_param
    params.permit(:status)
  end

  private
  def set_param
    begin
      @job= @current_user.jobs.find(params[:id])
    rescue
      render json: "Job not Found"
    end
  end
end
