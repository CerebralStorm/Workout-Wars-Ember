class CompetitionJoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :competition_id, :total_experience, :rank

  embed :ids, include: true

  has_one :user
  has_one :competition
end