class ActivityValue < ActiveRecord::Base
  belongs_to :activity
  belongs_to :metric

  validates_presence_of :activity
  validates_presence_of :metric
  validates_uniqueness_of :metric_id, scope: :activity_id
end
