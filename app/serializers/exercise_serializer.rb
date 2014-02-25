class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :experience_multiplier

  embed :ids

  has_one :metric
  has_one :user
end
