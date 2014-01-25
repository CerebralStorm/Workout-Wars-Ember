class CompetitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :creator_id, :max_participants, :lower_level_restriction, :upper_level_restriction, :started, :is_private

  embed :ids, include: true
  
  has_many :competition_exercises
  has_many :competition_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins
  has_many :users, through: :competition_joins
  has_one :creator
  
end
