class Competition < ActiveRecord::Base
  has_many :competition_exercises
  has_many :competition_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins
  has_many :users, through: :competition_joins

  def has_exercise?(exercise)
    exercises.include?(exercise)
  end
end
