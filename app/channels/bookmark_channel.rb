class BookmarkChannel < ApplicationCable::Channel
  def subscribed
    bookmark = Bookmark.find(params[:id])
    stream_for bookmark # if current_user == bookmark.user || current_user == bookmark.apartment.agency
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
