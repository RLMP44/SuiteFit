class Agency::BookmarkPolicy < ApplicationPolicy
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
      # scope to give all messages for an agent, should group messages by bookmark, sort them by latest message
      user.bookmarks_as_agency
    end

    private

    attr_reader :user, :scope
  end

  private

  attr_reader :user, :record
end
