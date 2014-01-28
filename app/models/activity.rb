class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise
  has_one :experience_source, as: :experienceable, dependent: :destroy
  has_many :competition_activities, dependent: :destroy

  validates_presence_of :user
  validates_presence_of :exercise
  validate :has_metric

  def has_metric
    unless reps.present? || duration.present? || distance.present? || weight.present? || calories.present?
      [:reps, :duration, :distance, :weight, :calories].each do |metric_type|
        errors.add(metric_type, "Activity must contain an amount of reps, duration, distance, weight, or calories")
      end
    end
  end

  after_create :create_competition_activities
  after_save :update_experience_source_and_user
  after_destroy :set_user_level

  delegate :experience_multiplier, to: :exercise
  delegate :metric, to: :exercise

  def create_competition_activities
    user.create_competition_activities(self)
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
