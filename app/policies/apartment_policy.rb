class ApartmentPolicy < ApplicationPolicy
  def show?
    # Any user can see an apartment
    true
  end
end
