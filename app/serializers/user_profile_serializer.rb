class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :f_name, :l_name, :education, :skills, :experience, :image_upload

  def image_upload
    object.image.url
  end
end
