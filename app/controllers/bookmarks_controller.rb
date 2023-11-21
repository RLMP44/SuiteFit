class BookmarksController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def show
    authorize @bookmark
  end

  def create
    authorize @bookmark
  end

  def update
    authorize @bookmark
  end

  def destroy
    authorize @bookmark
  end
end
