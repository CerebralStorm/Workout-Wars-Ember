class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :activities
  has_many :competition_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts
  has_many :experience_sources

  before_save :ensure_authentication_token
  before_save :set_avatar_url

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.avatar_url = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def set_avatar_url
    # if avatar_url.present?
    #   avatar_url
    # else
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      self.avatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
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
