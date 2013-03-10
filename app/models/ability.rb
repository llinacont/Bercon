class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :all
    elsif user.role? :seller
      can :manage, Client
      can :manage, Demand
      can :read, Product
    elsif user.role? :dealer
      can :read, Demand
      can :update, Demand.state
    end
  end
end