class Agency::ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      # A filter that redirects unauthenticated users to the login page.
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      # The agency can only see apartments they created
      scope.where(agency: user) if user.agency
    end

    private

    attr_reader :user, :scope
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
