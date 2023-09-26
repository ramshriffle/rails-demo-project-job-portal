class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :user_profile, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :user_applications, dependent: :destroy
  
  # has_secure_password
  validates :user_name, :email, presence: true, uniqueness: {case_sensitive: false}
  validates :type, presence: true
  validates :email, format: {  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,message: "Please Enter Valid Email" }
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "encrypted_password", "reset_password_sent_at", "reset_password_token", "type", "updated_at", "user_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["jobs", "user_applications", "user_profile"]
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end
  
  def password_token_valid?
    (self.reset_password_sent_at + 1.hours) > Time.now.utc
  end
  
  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  
  def generate_token
    SecureRandom.hex(5)
  end
end
