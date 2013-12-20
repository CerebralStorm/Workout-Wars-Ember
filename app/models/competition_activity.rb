class CompetitionActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  belongs_to :competition

  validates_presence_of :activity
  validates_presence_of :user
  validates_presence_of :competition

  delegate :total_experience, to: :activity
end
