class CompetitionUserExercise < ActiveRecord::Base
  belongs_to :user_exercise
  belongs_to :competition

  validates_presence_of :user_exercise
  validates_presence_of :competition

  delegate :total_experience, to: :user_exercise

  after_save :update_competition_win_condition
  after_destroy :update_competition_win_condition

  def update_competition_win_condition
    competition.compute_results
  end
end
