FactoryBot.define do
  # using a sequence to prevent creation of users with the same email
  sequence :email do |n|
    "email#{n}@suitfituser.com"
  end

  factory :user do
    username { 'shinji' }
    email
    password { 'shinjiiscool' }
    password_confirmation { 'shinjiiscool' }
  end

  factory :agency, class: User do
    username { 'fable' }
    email
    agency { true }
    password { 'fableiscool' }
    password_confirmation { 'fableiscool' }
  end
end
