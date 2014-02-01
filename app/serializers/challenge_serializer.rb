class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_date, :end_date, :max_participants, :lower_level_restriction, :upper_level_restriction
  
  embed :ids, include: true
end
