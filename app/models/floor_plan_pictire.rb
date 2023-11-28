class FloorPlanPictire < ApplicationRecord
  belongs_to :apartment
  has_one_attached :photo
end
