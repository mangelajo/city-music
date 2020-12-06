class Ability
  include CanCan::Ability

  def initialize(user)
    pp user
    user ||= User.new # guest user (not logged in)
    if user && user.admin?
      can :manage, :all
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard
    else
      can :read, :all                   # allow everyone to read everything
    end
  end
end
