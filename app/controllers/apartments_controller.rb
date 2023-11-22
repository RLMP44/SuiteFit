class ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def show
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
end
