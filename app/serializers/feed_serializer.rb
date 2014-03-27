class FeedSerializer < ActiveModel::Serializer
  attributes :id, :feedable_id, :feedable_type, :description, :created_at
end