class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  belongs_to :user_exercise

  validates_presence_of :user
  validates_presence_of :challenge
  validates :result, presence: true, numericality: { greater_than: 0 }

  before_create :create_user_exercise
  before_destroy :destroy_user_exercise

  delegate :exercise, to: :challenge

  def create_user_exercise
    self.user_exercise = UserExercise.create(user: user, exercise: exercise, value: result)
  end

  def destroy_user_exercise
    self.user_exercise.destroy if self.user_exercise.present?
  end
end
