class ChallengeAttemptSerializer < ActiveModel::Serializer
  attributes :id, :result
  
  embed :ids, include: true

  has_one :user
  has_one :challenge
end