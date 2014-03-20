class Exercise < ActiveRecord::Base
  belongs_to :metric
  has_many :exercise_metrics
  has_many :metrics, through: :exercise_metrics  
end
