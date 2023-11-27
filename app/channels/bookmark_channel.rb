class BookmarkChannel < ApplicationCable::Channel
  def subscribed
    bookmark = Bookmark.find(params[:id])
    stream_for bookmark
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
