class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Post
    can :create, Comment
    can :destroy, Comment, author_id: user.id
    can :manage, Post, author_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
