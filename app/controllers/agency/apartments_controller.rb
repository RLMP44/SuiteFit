class Agency::ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  before_action :set_apartment, only: [:show, :update, :destroy, :edit]

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

  def edit
    authorize([:agency, @apartment])
  end

  def update
    authorize([:agency, @apartment])

    if @apartment.update(apartment_params)
    redirect_to agency_apartments_path(@apartment)

    else

      render :edit
    end
  end

  def destroy
    authorize([:agency, @apartment])

    Bookmark.where(apartment_id: @apartment.id).destroy_all
    @apartment.destroy
    redirect_to agency_apartments_path, status: :see_other
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :address, :total_floorspace, :price, :description, :category, :floor_plan)
  end
end
