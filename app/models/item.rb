class Item < ApplicationRecord
  belongs_to :user
  validates :length, presence: true
  validates :width, presence: true
  validates :quantity, presence: true
  validates :icon, presence: true
end
