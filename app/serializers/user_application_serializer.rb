class UserApplicationSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_name
  belongs_to :job

  def user_name
    object.user.user_name
  end
end
