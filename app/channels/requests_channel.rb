class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user if current_user.agency
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
