class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subject, :content
end