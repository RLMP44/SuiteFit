FactoryBot.define do
  factory :message do
    content { "Hi!" }
    association :user
  end
end
