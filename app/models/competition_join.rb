class CompetitionJoin < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  validates_presence_of :user
  validates_presence_of :competition
end
