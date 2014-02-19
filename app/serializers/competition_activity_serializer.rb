class CompetitionActivitySerializer < ActiveModel::Serializer
  attributes :id, :activity_id, :user_id, :competition_id

  embed :ids, include: true

  has_one :activity
  has_one :competition
end