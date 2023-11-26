class MessagesController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @message = Message.new(message_params)
    @message.bookmark = @bookmark
    @message.user = current_user

    authorize @message
    if @message.save
      BookmarkChannel.broadcast_to(
        @bookmark,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "bookmarks/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
