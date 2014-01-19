class Competition < ActiveRecord::Base
  has_many :competition_exercises
  has_many :competition_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins
  has_many :users, through: :competition_joins

  validates_presence_of :name

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
