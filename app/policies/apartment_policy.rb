class ApartmentPolicy < ApplicationPolicy
  def show?
    # Any user can see an apartment
    true
  end

class Scope < Scope
  def resolve
    scope.all
  end
end

end
