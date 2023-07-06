class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    cannot :manage, :all unless user.present?

    can :manage, Expense, user_id: user.id
    can :manage, Group, author_id: user.id
  end
end
