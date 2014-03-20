class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :experience_multiplier, :metric_id, :can_delete, :approved

  embed :ids

  has_many :metrics, include: true
  has_many :exercise_metrics
  
  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end
