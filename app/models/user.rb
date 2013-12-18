class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :activities
  has_many :event_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
  
  def create_event_activities(activity)
    competitions.each do |competition|
      if competition.has_exercise?(activity.exercise)
        competition.event_activities.create!(activity_id: activity.id, user_id: self.id)
      end
    end
  end
end
