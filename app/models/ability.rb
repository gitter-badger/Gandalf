class Ability
  include CanCan::Ability

  def initialize(entity)
    can :manage, :all
  end

end
