class BookmarksController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = policy_scope(Bookmark)
    if params[:result].present?
      @bookmarks = @bookmarks.where(result: params[:result])
    end
  end

  def show
    authorize @bookmark
    @bookmark.messages.where.not(user: current_user).map(&:read!)
    @message = Message.new
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @bookmark = Bookmark.new
    @bookmark.apartment = @apartment
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save
      redirect_to bookmarks_path(@bookmarks)
      # added a notice to notify the user that the bookmark saved
      flash[:notice] = "Bookmark saved!"
    else
      render "apartments/show", status: :unprocessable_entity
    end
  end

  def edit
    authorize @bookmark
    @items = current_user.items
  end

  def update
    authorize @bookmark
    arrangement_json = request.body.read
    @bookmark.update(arrangement: arrangement_json, result: params[:result])
    if @bookmark.save
      # @bookmarks = policy_scope(Bookmark)
      # respond_to do |format|
      #   format.js { render :index }
      # end
      redirect_to bookmarks_path
      flash[:notice] = "Saved!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @bookmark
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
