class ApplicationController < ActionController::API
  include JsonWebToken
  
  before_action :authenticate_request
  # before_action :check_job_recruiter
  # before_action :check_job_seeker

  private
  def authenticate_request
    begin
      header = request.headers[ 'Authorization' ]
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue JWT::DecodeError	=> e
      render json: { error: 'Invalid token' }, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotFound
      render json: "No record found.."
  end
  
  # def current_user
  #   @current_user
  # end
  
  # def check_job_recruiter
  #   return render json: { message: "You are not Recruiter" } unless @current_user.type == 'JobRecruiter'
  # end
  
  # def check_job_seeker
  #   return render json: { message: "You are not Seeker" } unless @current_user.type == 'JobSeeker'
  # end
end
