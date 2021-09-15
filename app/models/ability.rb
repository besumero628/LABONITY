# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin)
    if admin
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
