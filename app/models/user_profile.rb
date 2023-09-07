class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :f_name, :l_name, :skills, :experience, :education, presence: { message: "Please Provide all value"}
end
