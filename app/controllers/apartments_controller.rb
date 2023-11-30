class ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  skip_before_action :authenticate_user!, only: :show

  def index
    @apartments = policy_scope(Apartment)
  end

  def show
    @bookmark = Bookmark.new
    @apartment = Apartment.find(params[:id])
    # creating a marker for the map
    if @apartment.geocoded?
      @marker = {
        lat: @apartment.latitude,
        lng: @apartment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
    authorize @apartment
    increment_impression!(@apartment)
  end

  private

  # counting page views
  def increment_impression!(apartment)
    if user_signed_in? == false || !current_user.agency
      apartment.impression_counter += 1
      apartment.save
    end
  end
end
