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
    @apartment = Apartment.new(apartment_params)
    @apartment.agency = current_user
    # TODO attach a qr code!
    authorize([:agency, @apartment])
    if @apartment.save
      redirect_to edit_agency_apartment_path(@apartment, creation: 'true')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize([:agency, @apartment])
  end

  def edit
    authorize([:agency, @apartment])
  end

  def update
    @apartment.update(apartment_params)
    authorize([:agency, @apartment])
    
    if @apartment.save
      redirect_to agency_apartment_path(@apartment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize([:agency, @apartment])

    Bookmark.where(apartment_id: @apartment.id).destroy_all
    @apartment.destroy
    redirect_to agency_apartments_path, status: :see_other
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:name, :description, :price, :photos, :total_floorspace, :address, :category, :floor_plan)
  end
end
