class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :experience_multiplier, :user_id, :metric_id, :can_delete, :custom

  embed :ids

  has_one :metric, include: true
  has_one :user
  has_many :user_exercises

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end
