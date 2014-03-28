class UserExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :user_id, :value, :created_at

  embed :ids
  
  has_one :user
  has_one :exercise, include: true
  has_many :competition_user_exercises
  has_many :competitions, through: :competition_user_exercises
end