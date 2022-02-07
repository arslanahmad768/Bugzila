class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user

        if user.manager?
          can :manage, Project,user_id:user.id
          can :manage, User
          # can :create, Bug
          cannot :create, Bug
          can :create,ProjectUser
        elsif user.developer?
          can :read,ProjectUser
          can :read, Bug
          can :read,Project
          # can :read,Project


          # can :read, project_users
          # cannot :read, Project
          # can :create, Comment
          # can :update, Comment do |comment|
          #   comment.try(:user) == user || user.role?(:moderator)
        else
          can :read, Project
          can :manage, Bug
        end
          # if user.role?(:author)
          #   can :create, Article
          #   can :update, Article do |article|
          #     article.try(:user) == user
          #   end
          # end
        # end
    # can :read,:all
      # user ||= User.new # guest user (not logged in)
      # if user.manager?
      #   can :manage, :all
      # else
      #   can :read, :all
      # end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
