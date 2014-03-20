class ExerciseMetricSerializer < ActiveModel::Serializer
  attributes :id, :experience_multiplier

  embed :ids

  has_one :metric, include: true
  has_one :exercise, include: true
end