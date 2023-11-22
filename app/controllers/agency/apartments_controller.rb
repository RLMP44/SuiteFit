class Agency::ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  before_action :set_apartment, only: [:show, :update, :destroy]

  def index
    @apartments = policy_scope([:agency, Apartment])
  end

  def show
    authorize([:agency, @apartment])
  end

  def new
    @apartment = Apartment.new
    authorize([:agency, @apartment])
  end

  def create
    authorize([:agency, @apartment])
  end

  def update
    authorize([:agency, @apartment])
  end

  def destroy
    authorize([:agency, @apartment])
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
