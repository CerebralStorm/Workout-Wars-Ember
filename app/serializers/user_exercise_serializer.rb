class UserExerciseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :exercise_id

  has_one :user
  has_one :exercise
end
