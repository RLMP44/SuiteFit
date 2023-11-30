class ApartmentPolicy < ApplicationPolicy
  def show?
    # Anyone can see an apartment
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
