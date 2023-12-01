class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :length, presence: true
  validates :width, presence: true
  # validates :quantity, presence: true

  ITEMTYPES = ["Table", "Chair", "Armchair", "Couch", "Sofa", "Single bed", "Double bed", "Fridge", "Washing machine", "TV", "Wardrobe", "Microwave", "Trash can", "Basket", "Desk"]

  def image
    case self.name.downcase
    when "table" then "items/Circle-table.png"
    when "chair" then "items/Chair.png"
    when "armchair" then "items/Armchair.png"
    when "couch" then "items/Couch.png"
    when "sofa" then "items/Sofa.png"
    when "single bed" then "items/Single-bed.png"
    when "double bed" then "items/Double-bed.png"
    when "fridge" then "items/Fridge.png"
    when "washing machine" then "items/Washing machine.png"
    when "tv" then "items/Tv.png"
    when "wardrobe" then "items/Wardrobe.png"
    when "microwave" then "items/Microwave.png"
    when "trash can" then "items/Trash can.png"
    when "basket" then "items/Basket.png"
    when "desk" then "items/Desk.png"

    end
  end
end
