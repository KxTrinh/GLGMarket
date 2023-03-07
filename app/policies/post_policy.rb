class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def update?
    # Only post owners can update it
    record.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    update? # => record.user == user
  end
end
