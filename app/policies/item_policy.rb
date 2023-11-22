class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      # A filter that redirects unauthenticated users to the login page.
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      # The user can only see items they created
      scope.where(user: user) if !user.agency
    end

    private

    attr_reader :user, :scope
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

  private

  attr_reader :user, :record
end
