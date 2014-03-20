class Metric < ActiveRecord::Base
  validates_presence_of :name

  has_many :exercise_metrics
  has_many :exercises, through: :exercise_metrics  
end
