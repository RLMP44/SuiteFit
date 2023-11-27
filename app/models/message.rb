class Message < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user

  # read/unread flag
  enum :status, { unread: "unread", read: "read" }

  # defining sender? method to determine if the current user is the sender
  def sender?(this_user)
    user.id == this_user.id
  end
end
