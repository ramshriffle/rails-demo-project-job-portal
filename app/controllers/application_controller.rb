class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate_request
  include JsonWebToken
  before_action do
    ActiveStorage::Current.host = request.base_url
  end
  
  private
  def authenticate_request
    begin
      header = request.headers['Authorization']
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue JWT::DecodeError	=> e
      render json: { error: 'Invalid token' }, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound
      render json: "No record found.."
    end
  end
  
  def check_job_recruiter
    unless @current_user.type == 'JobRecruiter'
      render json: { message: "You are not Recruiter" } 
    end
  end
  
  def check_job_seeker
    unless @current_user.type == 'JobSeeker'
      render json: { message: "You are not Seeker" } 
    end
  end
end
