class Agency::ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  def index
    @apartments = policy_scope(Apartment)
  end

  def show
    authorize @apartment
  end

  def create
    authorize @apartment
  end

  def update
    authorize @apartment
  end

  def destroy
    authorize @apartment
  end
end
