class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)

      if user.admin?
        can :manage, :all
      elsif user.default?
        can :manage, Listing, {:id => user.id}
        can :manage, User, {:id => user.id}
        can :manage, Comment, {:id => user.id}
        can :manage, Conversation, {:sender_id => user.id}
        can :manage, Conversation, {:recipient_id => user.id}
      else
        can :create, User
        # cannot :, User
        cannot :manage, Listing
      end

  end
end
