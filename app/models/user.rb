class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :activities
  has_many :competition_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
  has_many :experience_sources
  
  def create_competition_activities(activity)
    competitions.each do |competition|
      if competition.has_exercise?(activity.exercise)
        competition.competition_activities.create!(activity_id: activity.id, user_id: self.id)
      end
    end
  end

  def experience
    self.experience_sources.sum(:amount)
  end

  def next_level_experience
    self.xp_level * self.xp_multiplier
  end

  def previous_level_experience
    (self.xp_level-1) * (self.xp_multiplier-100)
  end

  def xp_for_levelup
    next_level_xp - experience
  end

  def set_level
    while experience >= next_level_experience
      self.level += 1
      self.xp_level += 1
      self.xp_multiplier += 100
    end 
    while experience < previous_level_experience
      break if self.xp_level == 1
      self.level -= 1
      self.xp_level -= 1
      self.xp_multiplier -= 100
    end 
    self.save
  end

  def total_experience_for_competition(competition)
    actities = competition_activities.where(competition: competition)
    result = 0
    actities.each do |activity|
      result += activity.total_experience
    end
    result
  end
end
