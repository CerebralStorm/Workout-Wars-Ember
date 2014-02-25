class UserExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  validates_presence_of :user
  validates_presence_of :exercise
  validates_uniqueness_of :user_id, scope: :exercise_id
end
