class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  has_one :experience_source, as: :experienceable, dependent: :destroy
  has_many :competition_activities, dependent: :destroy

  after_create :create_competition_activities
  after_save :update_experience_source_and_user
  after_destroy :set_user_level

  delegate :experience_multiplier, to: :exercise
  delegate :metric, to: :exercise

  def create_competition_activities
    user.create_competition_activities(self)
  end

  def xp_from(metric)
    return 0 if metric.nil?
    (metric * exercise_type.xp_multiplier).floor
  end

  def total_experience
    self.send(metric) * experience_multiplier
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
