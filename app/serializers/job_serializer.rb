class JobSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :description, :salary, :location, :recruiter

  def recruiter
    object.user.user_profile.f_name
  end
end
