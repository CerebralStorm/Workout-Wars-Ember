class Exercise < ActiveRecord::Base
  belongs_to :metric

  validates_presence_of :metric
  validates_presence_of :experience_multiplier
  validates_numericality_of :experience_multiplier, greater_than: 0
end
