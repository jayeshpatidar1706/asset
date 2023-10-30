# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read , Employee 
    can :read , Asset
    can :read , AssetHistory
    return if user.role.eql?("Employee")

    can :manage, :all
  end
end
