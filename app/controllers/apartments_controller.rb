class ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def index
    @apartments = Apartment.all
    @apartments = policy_scope(Apartment)
  end

  def show
    @bookmark = Bookmark.new
    @apartment = Apartment.find(params[:id])
    authorize @apartment
    increment_impression!(@apartment)
  end

  private

  def increment_impression!(apartment)
    unless current_user.agency
      apartment.impression_counter += 1
      apartment.save
    end
  end

end
