class CompetitionExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :competition_id

  embed :ids, include: true

  has_one :exercise
  has_one :competition
end