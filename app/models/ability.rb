# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :manage, Post
      can :manage, Car
      can :manage, Comment
      can [:edit, :read], Brand
      can [:edit, :read], Car_Model
    else
      can :create, Post
      can :create, Car
      can :create, Comment 
      can :create, Brand
      can :create, Car_Model

      can [:edit, :delete], Post do |post|
        post.user == user
      end
      can [:edit ,:delete], Car do |car|
        car.user == user
      end
      can :read, :all
    end
  end
end
