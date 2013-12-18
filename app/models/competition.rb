class Competition < ActiveRecord::Base
  has_many :event_exercises, as: :exerciseable
  has_many :event_activities, as: :actable
  has_many :exercises, through: :event_exercises
  has_many :competition_joins
  has_many :users, through: :competition_joins

  def has_exercise?(exercise)
    exercises.include?(exercise)
  end
end
