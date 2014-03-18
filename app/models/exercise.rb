class Exercise < ActiveRecord::Base
  has_many :exercise_metrics
  has_many :metrics, through: :exercise_metrics  
end
