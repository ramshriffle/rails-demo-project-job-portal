class Job < ApplicationRecord
  belongs_to :user
  has_many :user_applications, dependent: :destroy

  validates :job_title, :description, :location, :salary, presence: true
  validate :recruiter_only_post_jobs#, on: :create

  private
  def recruiter_only_post_jobs
    unless user.type == "JobRecruiter"
        errors.add(:base, "Only Recruiter have permission to post jobs.")      
    end
  end
end
