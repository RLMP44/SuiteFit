class Agency::ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # The agency can only see apartments they created
      scope.where(agency: user) if user.agency
    end
  end

  def show?
    record.agency == user
  end

  def create?
    # Only an agency can create an apartment
    user.agency
  end

  def update?
    record.agency == user
  end

  def destroy?
    record.agency == user
  end
end
