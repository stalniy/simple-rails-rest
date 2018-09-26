require 'active_admin/cancan_adapter'
class ActiveAdminAuth < ActiveAdmin::AuthorizationAdapter
  include CanCan::Ability

  def authorized?(action, subject = nil)
    return false unless user
    return false unless user.id
    return false unless ['admin', 'member'].include? user.role
    ActiveAdminAbility.new(user)
    binding.pry
    true
  end
end