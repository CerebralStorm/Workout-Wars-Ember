class CompetitionJoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :competition_id, :total, :rank, :competition_status

  embed :ids

  has_one :user, include: true
  has_one :competition
end