FactoryBot.define do
  factory :bookmark do
    comment { "Nice apartment" }
    association :user
    association :apartment
  end
end
