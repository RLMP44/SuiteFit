class BookmarkPolicy < ApplicationPolicy
  class Scope
    def resolve
      # The user can only see bookmarks they created
      record.where(user: user) if !user.agency
    end
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
