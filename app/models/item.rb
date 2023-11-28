class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :length, presence: true
  validates :width, presence: true
  validates :quantity, presence: true

  ITEMTYPES = ["Table", "Chair", "Armchair", "Couch", "Sofa", "Single bed", "Double bed", "Fridge", "Washing machine", "TV", "Wardrobe", "Microwave", "Trash can", "Basket", "Desk"]

  def image
    case self.name.downcase
    when "table" then "items/Circle-table.png"
    when "chair" then "items/Chair.png"
    when "armchair" then "items/Armchair.png"
    when "couch" then "items/Couch"
    when "sofa" then "items/Sofa"
    when "single bed" then "items/Single-bed"
    when "double bed" then "items/Double-bed"
    when "fridge" then "items/Fridge"
    when "washing machine" then "items/Washing machine"
    when "tv" then "items/Tv"
    when "wardrobe" then "items/Wardrobe"
    when "microwave" then "items/Microwave"
    when "trash can" then "items/Trash can"
    when "basket" then "items/Basket"
    when "desk" then "items/Desk"

    end
  end
end
