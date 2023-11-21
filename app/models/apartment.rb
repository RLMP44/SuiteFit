class Apartment < ApplicationRecord
  has_one_attached :photo

  belongs_to :agency
end
