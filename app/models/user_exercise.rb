class UserExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise
  has_one :experience_source, as: :experienceable, dependent: :destroy
  has_many :competition_user_exercises, dependent: :destroy
  has_many :competitions, through: :competition_user_exercises

  validates_presence_of :user
  validates_presence_of :exercise
  validates :value, numericality: { greater_than: 0 }

  after_create :create_competition_user_exercises
  after_save :update_experience_source_and_user
  after_destroy :set_user_level

  delegate :experience_multiplier, to: :exercise
  delegate :metric, to: :exercise

  def create_competition_user_exercises
    user.create_competition_activities(self)
  end

  def total_experience
    value * experience_multiplier
  end

  def update_experience_source_and_user
    if experience_source.nil?
      create_experience_source!(amount: total_experience, user: self.user)
    else
      experience_source.amount = total_experience
      experience_source.save
    end
    user.set_level
  end

  def set_user_level
    user.set_level
  end
end
