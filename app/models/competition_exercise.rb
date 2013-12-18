class CompetitionExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :competition

  validates_presence_of :exercise
  validates_presence_of :competition
end
