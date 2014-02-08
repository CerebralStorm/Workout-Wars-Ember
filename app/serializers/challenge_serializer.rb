class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  
  embed :ids, include: true

  has_one :exercise
end
