class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  has_one :agency, through: :apartment
  has_many :messages, dependent: :destroy
end
