class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise
  has_one :experience_source, as: :experienceable, dependent: :destroy
  has_many :competition_activities, dependent: :destroy
  has_many :activity_values, dependent: :destroy

  validates_presence_of :user
  validates_presence_of :exercise

  after_create :create_competition_activities
  after_save :update_experience_source_and_user
  after_destroy :set_user_level

  delegate :experience_multiplier, to: :exercise
  delegate :metric, to: :exercise

  def create_competition_activities
    user.create_competition_activities(self)
  end

  def total_experience
    total = 0
    activity_values.each do |activity_value|
      total += activity_value.value * activity_value.experience_multiplier
    end
    total
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

  def values_json
    values.to_json
  end
end
