class JobSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :description, :salary, :location
end
