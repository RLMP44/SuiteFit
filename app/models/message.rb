class Message < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user

  # added read/unread flag
  enum :status, [:unread, :read]

  # count unread users (join with unread messages) -> use action cable to broadcast when a new message is created

  # defining sender? method to determine if the current user is the sender
  def sender?(this_user)
    user.id == this_user.id
  end
end
