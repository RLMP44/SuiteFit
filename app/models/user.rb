class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :apartments_as_agency, class_name: "Apartment", foreign_key: :agency_id
  has_many :bookmarks_as_agency, class_name: "Bookmark", through: :apartments_as_agency, source: :bookmarks
  has_many :messages_as_agency, class_name: "Message", through: :bookmarks_as_agency, source: :messages
  has_many :bookmarks
  has_many :items

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
end
