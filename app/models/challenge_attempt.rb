class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  validates_presence_of :user
  validates_presence_of :challenge
  validates :result, presence: true, numericality: { greater_than: 0 }

end
