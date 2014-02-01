class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Competition
      can :create, Challenge
      can :create, Exercise
      can :create, Activity

      can :manage, CompetitionExercise

      can :manage, Competition do |competition|
        competition.try(:user_id) == user.id && !competition.try(:started?)
      end

      can :manage, Challenge do |challenge|
        challenge.try(:user_id) == user.id
      end

      can :manage, User do |passed_user|
        passed_user.try(:id) == user.id
      end
    end
  end
end
