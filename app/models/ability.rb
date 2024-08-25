# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    # For example:
    # if user.nil?
    #   # Guest users have no permissions
    #   can :read, :all
    # elsif user.role?(:admin)
    #   # Admins have full access
    #   can :manage, :all
    # elsif user.role?(:editor)
    #   # Editors can manage articles, but not users
    #   can :manage, Article
    #   cannot :manage, User
    # elsif user.role?(:viewer)
    #   # Viewers can only read articles
    #   can :read, Article
    end
  end
end
