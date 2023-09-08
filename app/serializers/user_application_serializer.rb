class UserApplicationSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_name, :resume
  belongs_to :job

  def user_name
    object.user.user_name
  end

  def resume
    object.resume.url
  end
end
