class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :f_name, :l_name, :skills, :experience, :education, :image, presence: true
  scope :search_user_by_name, ->(name) {where("f_name LIKE ?","#{name}%" )}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "education", "experience", "f_name", "id", "l_name", "skills", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "user"]
  end
end
