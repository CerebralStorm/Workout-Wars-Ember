class Competition < ActiveRecord::Base
  belongs_to :competition_win_condition
  has_many :competition_exercises, dependent: :destroy
  has_many :competition_activities, dependent: :destroy
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins, dependent: :destroy
  has_many :users, through: :competition_joins
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :user
  validates_presence_of :competition_win_condition
  validate :start_and_end_dates

  after_save :compute_results, if: :finished? 

  def compute_results
    competition_win_condition.compute_results(self)
  end

  def start_and_end_dates
    return unless start_date.present? && end_date.present?
    errors.add(:start_date, "Start date cannot be a date that has already passed")  if start_date < Date.today
    errors.add(:end_date, "End date must be a later date than the start date") if end_date <= start_date
  end

  accepts_nested_attributes_for :competition_exercises

  def number_of_participants
    competition_joins.count
  end

  def has_exercise?(exercise)
    exercises.include?(exercise)
  end
end
