class UserNotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :notification_id, :time_period

  embed :ids
  
  has_one :user
  has_one :notification
end