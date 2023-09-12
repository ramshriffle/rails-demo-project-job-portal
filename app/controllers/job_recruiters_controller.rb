class JobRecruitersController < ApplicationController
  before_action :check_job_recruiter
  before_action :set_param, only: [:accept_or_reject_job_application]
  before_action :find_all_job_application, only: [:view_applied_job, :view_accepted_job_application, :view_rejected_job_application]
  
  #JobRecriuter(@current_user) can view all applied job application
  #on his particular job
  def view_applied_job
    if !@applied_applications.empty?
      render json: @applied_applications
    else
      render json: "Nobody apply for job"
    end
  end
  
  def accept_or_reject_job_application
    if @current_user == @application.job.user
      if @application.update(recruiter_param)
        render json: {message: "Application Updated",data: @application}
      else
        render json: @application.errors.full_messages
      end
    else
      render json: "You have not permission to accept and reject the job"
    end
  end
  
  def view_accepted_job_application
    applications = @applied_applications.status_accept
    if applications.empty?
      render json: "You are not accept any job application"
    else
      render json: applications
    end
  end 
  
  
  def view_rejected_job_application
    applications = @applied_applications.status_reject
    if applications.empty?
      render json: "You are not reject any job application"
    else
      render json: applications
    end
  end
  
  private
  def recruiter_param
    params.permit(:status)
  end
  
  private
  def set_param
    @application= UserApplication.find_by_id(params[:id])
    if @application.nil?
      render json: "Job Application not Found"
    end
  end
  
  private
  def find_all_job_application
    begin
      job = @current_user.jobs.find_by_id(params[:id])
      @applied_applications = job.user_applications
    rescue
      render json: "Job Not Found"
    end
  end
end
