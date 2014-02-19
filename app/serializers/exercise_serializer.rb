class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  embed :ids, include: true

  has_one :metric
end
