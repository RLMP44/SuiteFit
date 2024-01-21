FactoryBot.define do
  factory :apartment do
    name { "Meguro Heights" }
    address { "Himonya 5-chome, Meguro-ku" }
    total_floorspace { 20.64 }
    price { 88_000 }
    description { "Beautiful one bedroom apartment with magnificent views, with spacious storage and a fully equipped kitchen and bathroom." }
    category { "2LDK" }
    agency {create(:user, agency: true)}
  end
end
