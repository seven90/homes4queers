class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)

      if user.admin?
        can :manage, :all
      elsif user
        can :manage, Listing, {:user_id => user.id}
        can :manage, User, {:id => user.id}
        can :manage, Comment, {:user_id => user.id}
        can :manage, Conversation, {:sender_id => user.id}
        can :manage, Conversation, {:recipient_id => user.id}
      else
        can :create, User
      end

  end
end
