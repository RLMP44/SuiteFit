class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  has_many :apartments_as_agency, class_name: "Apartment", foreign_key: :agency_id
  has_many :bookmarks
  has_many :items
end
