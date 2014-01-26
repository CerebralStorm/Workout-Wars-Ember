class Competition < ActiveRecord::Base
  has_many :competition_exercises, dependent: :destroy
  has_many :competition_activities, dependent: :destroy
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins, dependent: :destroy
  has_many :users, through: :competition_joins
  belongs_to :creator, class_name: "User"

  validates :name, presence: true, uniqueness: true
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :creator
  validate :start_and_end_dates

  def start_and_end_dates
    return unless start_date.present? && end_date.present?
    errors.add(:start_date, "Start date cannot be a date that has already passed")  if start_date < Date.today
    errors.add(:end_date, "End date must be a later date than the start date") if end_date <= start_date
  end

  accepts_nested_attributes_for :competition_exercises

  def has_exercise?(exercise)
    exercises.include?(exercise)
  end

  def set_rank
    ranked_users = users.sort_by{ |u| u.total_experience_for_competition(self)}.reverse
    ranked_users.each_with_index do |user, index|
      join_model = user.competition_joins.find_by(competition: self)
      join_model.rank = index+1
      join_model.save
    end
  end
end
