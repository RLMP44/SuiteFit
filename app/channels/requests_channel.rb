class RequestsChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:user_id])
    stream_for user if user.agency
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
