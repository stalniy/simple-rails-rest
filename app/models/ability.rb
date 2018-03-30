require 'cancancan'

class Ability
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
    can :read, :all
  end

  def to_list
    rules.map do |rule|
      object = { actions: rule.actions, subject: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = rule.conditions unless rule.base_behavior
      object
    end
  end
end
