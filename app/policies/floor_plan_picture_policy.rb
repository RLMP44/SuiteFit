class FloorPlanPicturePolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    record.apartment.agency == user
  end

  private

  attr_reader :user, :record
end
