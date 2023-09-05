class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :user_applications, dependent: :destroy

  has_secure_password
  validates :user_name, :email, presence: true, uniqueness: true
  validates :type, presence: true
  validates :email, format: {  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,message: "Please Enter Valid Email" }
end
