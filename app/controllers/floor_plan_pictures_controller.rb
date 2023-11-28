class FloorPlanPicturesController < ApplicationController
  def create
    @floor_plan_picture = FloorPlanPicture.new(floor_plan_picture_params)
    @floor_plan_picture.apartment = @apartment
    @floor_plan_picture.save
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def floor_plan_picture_params
    params.require(:floor_plan_picture).permit(:photo)
  end
end
