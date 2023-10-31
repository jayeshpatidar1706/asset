# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read , User 
    can :read , Asset
    can :read , AssetHistory
    # return if user.role.eql?("Employee")
    return if user.employee?
    can :manage, :all
  
end
end
