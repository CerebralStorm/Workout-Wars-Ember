class Exercise < ActiveRecord::Base
  belongs_to :metric
  belongs_to :user

  validates_presence_of :metric
end
