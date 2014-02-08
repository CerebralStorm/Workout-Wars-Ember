class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :gender, :address, :phone, :weight, :height, 
             :age, :admin, :provider, :uid, :level, :experience, :next_level_experience, :can_update, :can_delete

  embed :ids, include: true
  
  has_many :activities, include: true
  
  has_many :competition_activities
  has_many :competition_joins
  has_many :competitions, through: :competition_joins
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts

  # `scope` is current_user
  def can_update    
    Ability.new(scope).can?(:update, object)
  end

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end