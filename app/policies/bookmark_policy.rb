class BookmarkPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      # A filter that redirects unauthenticated users to the login page.
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      # The user can only see the bookmarks they created
      scope.where(user: user) if !user.agency?
    end

    private

    attr_reader :user, :scope
  end

  def show?
    # The user and the agency the apartment belongs to can see the chat
    record.user == user || record.apartment.agency == user
  end

  def create?
    # An agency can't create a bookmark
    !user.agency
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
