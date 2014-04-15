class UserNotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :notification_id, :time_period, :use_time_period, :name, :active

  embed :ids
  
  has_one :user
  has_one :notification
end