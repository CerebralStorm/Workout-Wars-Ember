class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  has_many :event_activites, dependent: :destroy

  after_create :create_event_activities

  def create_event_activities
    user.create_event_activities(self)
  end
end
