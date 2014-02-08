class ChallengeAttemptSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  
  embed :ids, include: true

  has_one :user
  has_one :challenge
end