class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_one_attached :resume

  validates :status, inclusion: {in: %w(applied accept reject)}
  
  # validate :only_seeker_apply_for_jobs

  # private
  # def only_seeker_apply_for_jobs
  #   unless user.type == "JobSeeker"
  #       errors.add(:base, "Only seeker have permission for apply the job.")      
  #   end
  # end
end
