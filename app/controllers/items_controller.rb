class ItemsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def index
    @items = policy_scope(Item)
  end

  def show
    authorize @item
  end

  def create
    authorize @item
  end

  def update
    authorize @item
  end

  def destroy
    authorize @item
  end
end
