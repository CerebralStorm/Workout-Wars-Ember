class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :exercise_id, :user_id, :reps, :weight, :duration, :calories, :distance
end