class Exercise < ActiveRecord::Base
  belongs_to :metric

  validates_presence_of :metric
end
