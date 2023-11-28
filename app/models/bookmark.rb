class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  has_one :agency, through: :apartment
  has_many :messages, dependent: :destroy

  def self.unread_count_for(agency)
    joins(:messages).where.not(messages: { user: agency }).where(apartment: agency.apartments_as_agency, messages: { status: "unread" }).distinct.count(:id)
  end

  def user_last_message
    messages.where.not(user: agency).order(created_at: :desc).first
  end
end
