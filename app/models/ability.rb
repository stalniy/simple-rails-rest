require 'cancancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities", user)
  end

  def admin_abilities
    can :manage, :all
  end

  def member_abilities
    can :read, :all
    can :manage, Article, { user_id: user.id }
    can [:read, :update], User, { id: user.id }
  end

  def visitor_abilities
    can :read, :all
  end
end
