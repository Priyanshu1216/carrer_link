class Ability
  include CanCan::Ability

  def initialize(user)
    if user.client?
      can :create, Job
      can :read, Job
      can :update, Job do |job|
        user.jobs.include?(job)
      end
      can :destroy, Job, user: user
      can [:read, :accept, :reject], Apply, job: { user_id: user.id }
    elsif user.applicant?
      can :read, Job
      can [:destroy, :new_apply, :read], Apply, user_id: user.id
      can :update, Profile, user: user
      can :create, Profile
    end
  end
end
