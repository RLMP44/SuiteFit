class FloorPlanPicturesController < ApplicationController
before_action :set_apartment

  def create
    @floor_plan_picture = FloorPlanPicture.new(floor_plan_picture_params)
    @floor_plan_picture.apartment = @apartment
    authorize @floor_plan_picture
    if @floor_plan_picture.save
      redirect_to agency_apartment_path(@apartment)
    else
      render "apartments/show", status: :unprocessable_entity
    end
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def floor_plan_picture_params
    params.require(:floor_plan_picture).permit(:photo)
  end
end
