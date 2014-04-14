class UserNotification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notification

  validates_presence_of :user
  validates_presence_of :notification
  validates_uniqueness_of :user_id, scope: :notification_id
end
