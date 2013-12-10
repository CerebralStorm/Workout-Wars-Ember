class EventJoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :joinable_id, :joinable_type

  embed :ids
end