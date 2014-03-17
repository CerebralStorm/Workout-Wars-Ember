class CompetitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :max_participants, :lower_level_restriction, 
             :upper_level_restriction, :started, :finished, :is_private, :description, 
             :can_update, :can_delete, :user_id

  embed :ids
  
  has_many :competition_exercises, include: true
  has_many :competition_activities
  has_many :exercises, through: :competition_exercises
  has_many :competition_joins, include: true
  has_many :users, through: :competition_joins
  has_one :user

  def can_update    
    Ability.new(scope).can?(:update, object)
  end

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
  
end
