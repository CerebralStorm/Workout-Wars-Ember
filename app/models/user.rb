class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_exercises, dependent: :destroy
  has_many :competition_user_exercises, dependent: :destroy
  has_many :competition_joins, dependent: :destroy
  has_many :competitions, through: :competition_joins
  has_many :feeds, as: :feedable
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts
  has_many :experience_sources

  before_save :ensure_authentication_token
  before_save :set_avatar_url

  def handle
    return nickname if nickname.present?
    return name if name.present?
    email.slice(0..(email.index('@')-1))
  end

  def self.find_for_facebook_oauth(auth)
    if user = User.find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name  
      user.avatar_url = auth.info.image
      user.save
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.name = auth.info.name  
          user.avatar_url = auth.info.image
      end
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
    if avatar_url.present?
      avatar_url
    else
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      self.avatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end
  
  def create_competition_user_exercises(user_exercise)
    competitions.where(finished: false).where(started: true).each do |competition|
      if competition.has_exercise?(user_exercise.exercise)
        competition.competition_user_exercises.create!(user_exercise_id: user_exercise.id, user_id: self.id)
        users = competition.users - [self]
        users.each do |user|
          message = "#{self.handle} logged #{user_exercise.value} #{user_exercise.exercise.metric.measurement} of #{user_exercise.exercise.name} which counted for #{competition.name}"
          user.send_push_notifications(message)
        end
      end
    end
  end

  def send_push_notifications(message, sound = "default", badge = 1)
    return if self.device_tokens.nil?
    return if self.device_tokens.empty?

    notification = {
      device_tokens: self.device_tokens,
      alert: message,
      sound: sound,
      badge: badge
    }
  
    ZeroPush.notify(notification) 
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
    exercises = competition_user_exercises.where(competition: competition)
    result = 0
    exercises.each do |exercise|
      result += exercise.total_experience
    end
    result
  end

  def add_device_token(token)
    return false unless token.present?
    self.device_tokens = [] if self.device_tokens.nil?
    if !self.device_tokens.include?(token)
      self.device_tokens << token
      self.save
    end 
    true
  end

  def remove_device_token(token)
    return true unless token.present?
    self.device_tokens = [] if self.device_tokens.nil?
    if self.device_tokens.include?(token)
      self.device_tokens -= [token]
      self.save
    end 
    true
  end
end
