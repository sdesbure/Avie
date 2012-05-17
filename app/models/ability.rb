class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    alias_action :index, :to => :read_index
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      unless user.new_record?
        can [:create, :update], [Broker, Insurer, LifeInsurance, AccountUnit, EuroFund]
        can :manage, [LifeInsuranceContract, Position], :user_id => user.id
        can :modify, User, :id => user.id
        can :read, [Broker, Insurer, LifeInsurance, AccountUnit, EuroFund, LifeInsuranceContract, Position]
        can :read, User, :id => user.id
        cannot :index, User
        cannot :index, LifeInsuranceContract

      else
        can :read, :all
        cannot :read, [LifeInsuranceContract, Position, User]
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
