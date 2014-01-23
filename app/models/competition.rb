class Competition < ActiveRecord::Base
  has_many :competition_exercises, dependent: :destroy
  has_many :competition_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins, dependent: :destroy
  has_many :users, through: :competition_joins

  validates :name, presence: true, uniqueness: true
  validates_presence_of :start_date
  validates_presence_of :end_date
  validate :has_exercise

  def has_exercise
    errors.add(:exercise, "Exercise not set") if exercises.count == 0
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
