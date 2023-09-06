class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :status, presence: true, inclusion: {in: %w(applied accept reject)}
  validate :only_seeker_apply_for_jobs
  # validates :user_id, uniqueness: {scope: :job_id, message: "You have already applied for this job"}

  private
  def only_seeker_apply_for_jobs
    unless user.type == "JobSeeker"
        errors.add(:base, "Only seeker have permission for apply the job.")      
    end
  end

  def check 
    
  end
end
