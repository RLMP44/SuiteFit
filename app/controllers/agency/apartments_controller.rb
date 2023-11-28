require "rqrcode"
require 'chunky_png'

class Agency::ApartmentsController < ApplicationController
  # Inserted a authorization policy in front of each method as a reminder.
  # When writing the method, put it before saving to the database.
  before_action :set_apartment, only: [:show, :update, :destroy, :edit, :save_qr_code]

  def save_qr_code
    authorize([:agency, @apartment])
    url = "https://suite-fit-rlmp44-5e8ff51180b0.herokuapp.com/apartments/#{@apartment.id}"
    png = RQRCode::QRCode.new(url).as_png(
      module_px_size: 24,
      size: 480
    )
    send_data png, filename: "#{@apartment.name}_qr_code.png", type: 'image/png'
  end

  def index
    @apartments = policy_scope([:agency, Apartment])
    # sending the total amount of bookmarks to the view for stats
    @bookmarks_count = @apartments.map { |apt| apt.bookmarks.count }.sum
    @impressions_count = @apartments.map(&:impression_counter).sum
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

    # attaching a qr code
    # url = '.../apartments/:id'

    url = "https://suite-fit-rlmp44-5e8ff51180b0.herokuapp.com/apartments/#{@apartment.id}"
    qr = RQRCode::QRCode.new(url)
    @apartment.qr_code = qr

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
