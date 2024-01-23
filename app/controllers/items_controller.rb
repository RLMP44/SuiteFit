class ItemsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def index
    @bookmark = Bookmark.all
    @item = Item.new
    @items = policy_scope(Item)
  end

  def create
    @items = policy_scope(Item)

    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item
    if @item.save
      redirect_to items_path
    else
      @pop_up = true
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to items_path
    else
      render :index, status: :unprocessable_entity
    end
    authorize @item
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :length, :width, :photo, :quantity)
  end
end
