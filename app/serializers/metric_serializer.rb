class MetricSerializer < ActiveModel::Serializer
  attributes :id, :name, :measurement

  embed :ids
end