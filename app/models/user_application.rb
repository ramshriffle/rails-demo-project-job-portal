class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_one_attached :resume

  enum status: {applied: "applied", accept: "accept", reject: "reject"},_prefix: :status
  
  validates :user_id, uniqueness: {scope: :job_id, message: "You have already applied for this job"}
  validates :resume, presence: true

  # validates :status, inclusion: {in: %w(applied accept reject)}
end
