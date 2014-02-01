class CompetitionJoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :competition_id, :total, :rank

  embed :ids

  has_one :user
  has_one :competition
end