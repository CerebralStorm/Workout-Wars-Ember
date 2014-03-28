class CompetitionUserExerciseSerializer < ActiveModel::Serializer
  attributes :id, :user_exercise_id, :competition_id

  embed :ids

  has_one :user_exercise
  has_one :competition
end