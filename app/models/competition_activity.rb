class CompetitionActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  belongs_to :competition

  validates_presence_of :activity
  validates_presence_of :user
  validates_presence_of :competition

  delegate :total_experience, to: :activity

  after_create :add_to_totals
  after_destroy :subtract_from_totals

  def add_to_totals
    join_model = user.competition_joins.find_by(competition: competition)
    join_model.total_experience += activity.total_experience
    join_model.save
    competition.set_rank
  end

  def subtract_from_totals
    join_model = user.competition_joins.find_by(competition: competition)
    join_model.total_experience -= activity.total_experience
    join_model.save
    competition.set_rank
  end
end
