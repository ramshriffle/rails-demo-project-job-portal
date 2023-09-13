class UserApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_one_attached :resume

  enum status: {applied: "applied", accept: "accept", reject: "reject"}#,_prefix: :status
  validates :resume, presence: true
end
