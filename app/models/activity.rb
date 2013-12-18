class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  has_many :competition_activities, dependent: :destroy

  after_create :create_competition_activities

  def create_competition_activities
    user.create_competition_activities(self)
  end
end
