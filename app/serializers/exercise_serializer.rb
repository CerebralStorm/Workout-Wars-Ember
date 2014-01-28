class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :reps, :distance, :duration, :calories, :weight, :description, :measurement
end
