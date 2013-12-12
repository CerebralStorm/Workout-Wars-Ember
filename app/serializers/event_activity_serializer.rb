class EventActivitySerializer < ActiveModel::Serializer
  attributes :id, :activity_id, :user_id, :actable_id, :actable_type
end