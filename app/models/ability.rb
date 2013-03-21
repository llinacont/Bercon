class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :seller
      can :manage, Center/seller
      can :manage, Client
      can :manage, Demand
      can :read, Product
    elsif user.has_role? :dealer
      can :manage, Center/seller
      can :read, Demand
      can :update, Demand.state
    end
  end
end