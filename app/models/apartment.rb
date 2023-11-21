class Apartment < ApplicationRecord
  belongs_to :agency, class_name: "User"
  has_many_attached :photos
  has_many :bookmarks
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :total_floorspace, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 25 }
  validates :category, presence: true, format: { with: /\A\d{1}\w{1,3}\z/ }
  validates :floor_plan, presence: true
  validates :qr_code, presence: true
end
