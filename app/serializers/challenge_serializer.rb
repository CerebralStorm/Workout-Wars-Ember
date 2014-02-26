class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  
  embed :ids

  has_one :exercise
  has_many :challenge_attempts, include: true
end
