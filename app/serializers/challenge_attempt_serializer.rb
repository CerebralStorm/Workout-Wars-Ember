class ChallengeAttemptSerializer < ActiveModel::Serializer
  attributes :id, :result, :user_id, :challenge_id, :activity_id, :created_at, :can_delete
  
  embed :ids

  has_one :user
  has_one :challenge
  has_one :activity, include: true

  def can_delete
    Ability.new(scope).can?(:delete, object)
  end
end