class CompetitionExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :competition

  validates_presence_of :exercise
  #validates_presence_of :competition  # Need to decide if exercises will always be adding inline with the competition form.
  validates_uniqueness_of :exercise_id, scope: :competition_id
end
