class JobsController < ApplicationController
  before_action :set_param, only: [:show, :update, :destroy]

  def index
    jobs=@current_user.jobs.all
    render json: jobs
  end
  
  def show
    if @job
      render json: @current_user.jobs 
    else
      render json: @job.errors.full_messages
    end
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end

  private
  def set_param
    @job= @current_user.jobs.find(params[:id])
  end
end
