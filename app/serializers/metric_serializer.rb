class MetricSerializer < ActiveModel::Serializer
  attributes :id, :name, :measurement
end