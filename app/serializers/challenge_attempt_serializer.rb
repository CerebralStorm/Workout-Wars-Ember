class ChallengeAttemptSerializer < ActiveModel::Serializer
  attributes :id, :result, :created_at
  
  embed :ids

  has_one :user
  has_one :challenge

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end