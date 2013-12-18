class CompetitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :max_participants, :lower_level_restriction, :upper_level_restriction

  embed :ids, include: true
  
  has_many :competition_exercises
  has_many :event_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins
  has_many :users, through: :competition_joins
end
