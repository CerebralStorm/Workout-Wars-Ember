class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :gender, :address, :phone, :weight, :height, :age, :admin, :provider, :uid, :level, :xp_level, :xp_multiplier

  embed :ids
  
  has_many :activities
  has_many :event_joins, as: :joinable
  has_many :event_activities, as: :actable
  has_many :competitions, through: :event_joins
end