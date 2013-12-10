class CompetitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :max_participants, :lower_level_restriction, :upper_level_restriction

  embed :ids, include: true
  
  has_many :event_exercises, as: :exerciseable
  has_many :exercises, through: :event_exercises
  has_many :event_joins, as: :joinable
  has_many :users, through: :event_joins
end
