FactoryBot.define do
  factory :table, class: Item do
    name { "Table" }
    length { 110 }
    width { 70 }
    quantity { 1 }
    association :user
  end
end
