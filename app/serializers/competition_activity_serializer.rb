class CompetitionActivitySerializer < ActiveModel::Serializer
  attributes :id, :activity_id, :user_id, :competition_id

  embed :ids

  has_one :activity
  has_one :competition
end