class Job < ApplicationRecord
  belongs_to :user
  has_many :user_applications, dependent: :destroy
  
  validates :job_title, :description, :location, :salary, presence: true

  scope :search_job_by_title, ->(title) {where("job_title LIKE ?", "#{title}%")}
  before_save :check_job_recruiter

  def check_job_recruiter
     errors.add(:base, message: "you have not permission to create job application") unless user.type == 'JobRecruiter'    
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "job_title", "location", "salary", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "user_applications"]
  end
end
