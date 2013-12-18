class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :gender, :address, :phone, :weight, :height, :age, :admin, :provider, :uid, :level, :xp_level, :xp_multiplier

  embed :ids
  
  has_many :activities
  
  has_many :competition_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
end