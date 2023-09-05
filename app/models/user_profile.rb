class UserProfile < ApplicationRecord
  belongs_to :user

  validates :f_name, :l_name, :skills, :experience, :education, presence: true
end
