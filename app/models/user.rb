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
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts
  has_many :experience_sources

  before_save :ensure_authentication_token
  before_save :set_avatar_url

  def set_avatar_url
    # if avatar_url.present?
    #   avatar_url
    # else
      default_url = "#{ENV['SITE_URL']}/assets/guest.png"
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      self.avatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{Rack::Utils.escape(default_url)}"
    #end
  end
  
  def create_competition_activities(activity)
    competitions.where(finished: false).where(started: true).each do |competition|
      if competition.has_exercise?(activity.exercise)
        competition.competition_activities.create!(activity_id: activity.id, user_id: self.id)
      end
    end
  end

  def experience
    self.experience_sources.sum(:amount)
  end

  def next_level_experience
    self.experience_level * self.experience_multiplier
  end

  def previous_level_experience
    (self.experience_level-1) * (self.experience_multiplier-100)
  end

  def experience_for_levelup
    next_level_experience - experience
  end

  def set_level
    while experience >= next_level_experience
      self.level += 1
      self.experience_level += 1
      self.experience_multiplier += 100
    end 
    while experience < previous_level_experience
      break if self.experience_level == 1
      self.level -= 1
      self.experience_level -= 1
      self.experience_multiplier -= 100
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
