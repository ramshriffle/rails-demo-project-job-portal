class JobSeekerController < ApplicationController
  def index
    if params[:f_name]
      users = UserProfile.where("f_name LIKE ?", "%#{params[:f_name]}%")
      render json: users
    else
      users = UserProfile.all
      render json: users
    end
  end

  def view_all_jobs
    if params[:job_title]
      jobs = Job.where("job_title LIKE ?", "%#{params[:job_title]}%")
      render json: jobs
    else
      render json: Job.all
    end
  end
end
