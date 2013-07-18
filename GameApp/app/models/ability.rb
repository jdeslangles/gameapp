class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? "admin"
        can :manage, :all
    elsif user.role? "user"
        can :read, :all
        can :create, User
        can [:my_profile, :edit, :update], User do |u|
          u.id == user.id
        end
        can [:read, :create], Game
    else
      can :create, User
    end
  end

end
