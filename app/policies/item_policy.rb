class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # The user can only see items they created
      scope.where(user: user) if !user.agency
    end
  end

  def create?
    # An agency can't create an item
    !user.agency
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
