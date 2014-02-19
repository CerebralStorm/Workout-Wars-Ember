class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :gender, :address, :phone, :weight, :height, 
             :age, :admin, :provider, :uid, :level, :experience, :next_level_experience, :can_update, :can_delete

  embed :ids
  
  has_many :activities  
  has_many :competition_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts

  def can_update    
    Ability.new(scope).can?(:update, object)
  end

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end