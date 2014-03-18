class ExerciseMetric < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :metric

  validates_presence_of :exercise
  validates_presence_of :metric
  validates_uniqueness_of :exercise_id, scope: :metric_id
end
