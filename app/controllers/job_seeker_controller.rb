class JobSeekerController < ApplicationController
  def view_all_jobs
    render json: Job.all
  end
  
  def search_job_by_job_title
    jobs = Job.where("job_title LIKE ?", "%#{params[:job_title]}%")
    render json: jobs
  end
end
