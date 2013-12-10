class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :user_id, :reps, :weight, :duration, :calories, :distance, :created_at, :updated_at
end