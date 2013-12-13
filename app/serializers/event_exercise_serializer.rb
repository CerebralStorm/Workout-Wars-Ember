class EventExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :exerciseable_id, :exerciseable_type

  embed :ids

  has_one :exercise
  has_one :exerciseable, polymorphic: true
end