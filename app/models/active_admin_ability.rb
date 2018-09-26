require 'cancancan'

class ActiveAdminAbility
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities", user)
  end

  def admin_abilities(user)
    can :manage, :all
  end

  def member_abilities(user)
    can :read, :all
    can :manage, Article, { author_id: user.id }
    can [:read, :update], User, { id: user.id }
  end

  def visitor_abilities(user)
  end
end
