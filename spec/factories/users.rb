FactoryBot.define do
  # using a sequence to prevent creation of users with the same email
  sequence :email do |n|
    "email#{n}@suitfituser.com"
  end

  sequence :username do |n|
    "suitefituser#{n}"
  end

  factory :user do
    username
    email
    password { 'shinjiiscool' }
    password_confirmation { 'shinjiiscool' }
  end

  factory :agency, class: User do
    username
    email
    agency { true }
    password { 'fableiscool' }
    password_confirmation { 'fableiscool' }
  end
end
