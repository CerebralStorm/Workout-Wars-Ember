class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :user_id, :values_json, :created_at

  embed :ids

  has_one :user
  has_one :exercise, include: true
  has_many :competition_activities
end