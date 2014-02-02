class CompetitionActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  belongs_to :competition

  validates_presence_of :activity
  validates_presence_of :user
  validates_presence_of :competition

  delegate :total_experience, to: :activity

  after_save :update_competition_win_condition
  after_destroy :update_competition_win_condition

  def update_competition_win_condition
    competition.compute_results
  end
end
