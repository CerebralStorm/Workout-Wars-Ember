class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  
  embed :ids, include: true

  has_one :metric
  has_many :challenge_attempts
end
