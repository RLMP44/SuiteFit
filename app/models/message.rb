class Message < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user

  validates :status, presence: true, inclusion: { in: ["unread", "read"] }

  # defining sender? method to determine if the current user is the sender
  def sender?(this_user)
    user.id == this_user.id
  end
end

# add read/unread flag
# scope to give all messages for an agent, should group messages by user, sort them by latest message
# count unread users (join with uread messages) -> use ction cable to broadcast when a new message is created
