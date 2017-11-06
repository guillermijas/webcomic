class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.premium_until.present? && user.premium_until >= Time.zone.today
      can :read, :all
    else
      #can :read, Publication, free: true
      can :read, Comic, user: user
      #can :create, Publication, user: {comic: @comic}
    end
  end
end