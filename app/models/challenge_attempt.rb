class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  validates_presence_of :user
  validates_presence_of :challenge
  validates :result, presence: true, numericality: { greater_than: 0 }

  after_create :create_activity

  delegate :exercise, to: :challenge

  def create_activity
    user.activities.create(exercise: exercise, value: result)
  end

end
