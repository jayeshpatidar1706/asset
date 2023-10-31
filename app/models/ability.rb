# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read , User ,user_id: user.id
    can :read , Asset
    can :read , AssetHistory
    # return if user.role.eql?("Employee")
    return if user.Employee?
    can :manage, :all
  
end
