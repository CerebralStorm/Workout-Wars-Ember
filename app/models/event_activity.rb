class EventActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  belongs_to :actable, polymorphic: true
end
