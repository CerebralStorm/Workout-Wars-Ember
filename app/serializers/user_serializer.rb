class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :gender, :address, :phone, :weight, :height, :age, :admin, :provider, :uid, :level, :xp_level, :xp_multiplier

  embed :ids
  
  has_many :activities
  has_many :event_activities
  has_many :event_joins
  has_many :competitions, through: :event_joins, source: :joinable, source_type: "Competition"
end