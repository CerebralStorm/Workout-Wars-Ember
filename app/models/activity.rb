class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  after_create :create_event_activities

  def create_event_activities
    user.create_event_activities(self)
  end
end
