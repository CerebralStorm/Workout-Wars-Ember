class CExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :exerciseable, polymorphic: true
end
