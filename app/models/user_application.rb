class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_one_attached :resume

  enum status: {applied: "applied", accept: "accept", reject: "reject"} ,_prefix: :status
  validates :job_id,uniqueness: {scope: :user_id, message: "You have already apply for the job"}
  validates :resume, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "job_id", "status", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["job", "resume_attachment", "resume_blob", "user"]
  end
end
