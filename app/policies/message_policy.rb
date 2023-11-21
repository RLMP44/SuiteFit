class MessagePolicy < ApplicationPolicy
  def create?
    # Anyone can send a message
    true
  end
end
