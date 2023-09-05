class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :status, presence: true, inclusion: {in: %w(applied accept reject)}
  validate :seeker_only_apply_for_jobs, on: :create

  private
  def seeker_only_apply_for_jobs
    unless user.type == "JobSeeker"
        errors.add(:base, "Only eeker have permission for apply the job.")      
    end
  end
end
