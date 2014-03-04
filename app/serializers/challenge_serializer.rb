class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_id, :description
  
  embed :ids

  has_one :exercise
  has_many :challenge_attempts, include: true
end
