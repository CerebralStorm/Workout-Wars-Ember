class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  belongs_to :activity

  validates_presence_of :user
  validates_presence_of :challenge
  validates :result, presence: true, numericality: { greater_than: 0 }

  before_create :create_activity
  before_destroy :destroy_activity

  delegate :exercise, to: :challenge

  def create_activity
    self.activity = Activity.create(user: user, exercise: exercise, value: result)
  end

  def destroy_activity
    self.activity.destroy if self.activity.present?
  end
end
