class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  embed :ids

  has_one :metric
end
