class Agency::BookmarksController < ApplicationController
  def index
    @bookmarks = policy_scope([:agency, Bookmark]).select("bookmarks.*, messages.created_at").joins(:messages).order("messages.created_at desc").distinct("bookmarks.id")
  end
end
