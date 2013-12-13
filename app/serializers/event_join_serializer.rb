class EventJoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :joinable_id, :joinable_type

  embed :ids

  has_one :user
  has_one :joinable, polymorphic: true
end