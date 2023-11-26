class Message < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user

  # defining sender? method to determine if the current user is the sender
  def sender?(this_user)
    user.id == this_user.id
  end
end
