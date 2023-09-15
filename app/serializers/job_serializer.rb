class JobSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :description, :salary, :location, :user
  
  def user
    {
    id: object.user.id,
    user: object.user.user_name
  }
end
end
