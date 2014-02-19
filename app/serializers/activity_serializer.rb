class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :user_id, :value

  embed :ids
  
  has_one :user
  has_one :exercise
  has_many :competition_activities
end