class JobSeekerController < ApplicationController
  def index
    if params[:f_name]
      users = UserProfile.search_user_by_name(params[:f_name])
      render json: users
    else
      users = UserProfile.all
      render json: users
    end
  end

  def view_all_jobs
    if params[:job_title]
      jobs = Job.search_job_by_job_title(params[:job_title])
      render json: jobs
    else
      render json: Job.all
    end
  end
end
