class Agency::ApartmentPolicy < ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope < Scope
    def initialize(user, scope)
      # A filter that redirects unauthenticated users to the login page.
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      # Check if the user is an agency and redirect if they are not
      raise Pundit::NotAuthorizedError unless user.agency
      # The agency can only see apartments they created
      scope.where(agency: user)
    end

    private

    attr_reader :user, :scope
  end

  def show?
    record.agency == user
  end

  def new?
    # Only an agency can create an apartment
    user.agency
  end

  def create?
    new?
  end

  def update?
    record.agency == user
  end

  def destroy?
    record.agency == user
  end

  private

  attr_reader :user, :record
end
