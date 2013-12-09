class Competition < ActiveRecord::Base
  has_many :event_exercises, as: :exerciseable
  has_many :exercises, through: :event_exercises
  has_many :event_joins, as: :joinable
  has_many :users, through: :event_joins
end
