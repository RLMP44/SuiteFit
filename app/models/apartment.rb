class Apartment < ApplicationRecord
  belongs_to :agency, class_name: "User"
  has_one :floor_plan_picture
  has_many :bookmarks
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :total_floorspace, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :category, presence: true, format: { with: /\A\d{1}\w{1,3}\z/ }
end
