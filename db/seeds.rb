puts "cleaning the db..."
FloorPlanPicture.destroy_all
Message.destroy_all
Item.destroy_all
Bookmark.destroy_all
Apartment.destroy_all
User.destroy_all

# users
puts "creating users..."

mario = User.create!(username: "Mario", email: "mario@mario.com", password: "marioiscool")
shinji = User.create!(username: "Shinji", email: "shinji@shinji.com", password: "shinjiiscool")
doug = User.create!(username: "Doug", email: "doug@doug.com", password: "dougiscool")
ryan = User.create!(username: "Ryan", email: "ryan@ryan.com", password: "ryaniscool")
jonatan = User.create!(username: "Jonatan", email: "jonatan@jonatan.com", password: "jonataniscool")

# Agency

# yann = User.create!(username: "Yann", email: "yann@yann.com", password: "yanniscool" , agency: true)
# celso = User.create!(username: "Celso", email: "celso@celso.com", password: "celsoiscool" , agency: true)
# rina = User.create!(username: "Rina", email: "rina@rina.com", password: "rinaiscool" , agency: true)
# trouni = User.create!(username: "Trouni", email: "trouni@trouni.com", password: "trouniiscool" , agency: true)
fable_agency = User.create!(username: "Fable", email: "fable@fable.com", password: "fableiscool", agency: true)

# FABRIC_JSON = JSON.parse(File.read("db/sample_json.json")).to_json

# Items
puts "creating items..."

table = Item.create!(
  name: "Table",
  length: 110,
  width: 70,
  quantity: 1,
  user: shinji
)

chair = Item.create!(
  name: "Chair",
  length: 76,
  width: 49,
  quantity: 1,
  user: shinji
)

armchair = Item.create!(
  name: "Armchair",
  length: 80,
  width: 50,
  quantity: 1,
  user: shinji
)

couch = Item.create!(
  name: "Couch",
  length: 213,
  width: 89,
  quantity: 1,
  user: shinji
)

sofa = Item.create!(
  name: "Sofa",
  length: 250,
  width: 120,
  quantity: 1,
  user: shinji
)

single_bed = Item.create!(
  name: "Single bed",
  length: 188,
  width: 92,
  quantity: 1,
  user: ryan
)

double_bed = Item.create!(
  name: "Double bed",
  length: 188,
  width: 138,
  quantity: 1,
  user: shinji
)

fridge = Item.create!(
  name: "Fridge",
  length: 55,
  width: 50,
  quantity: 1,
  user: ryan
)

washing_machine = Item.create!(
  name: "Washing machine",
  length: 60,
  width: 50,
  quantity: 1,
  user: shinji
)

tv = Item.create!(
  name: "TV",
  length: 120,
  width: 10,
  quantity: 1,
  user: shinji
)

wardrobe = Item.create!(
  name: "Wardrobe",
  length: 150,
  width: 90,
  quantity: 1,
  user: ryan
)

microwave = Item.create!(
  name: "Microwave",
  length: 40,
  width: 45,
  quantity: 1,
  user: ryan
)

trash_can = Item.create!(
  name: "Trash can",
  length: 30,
  width: 20,
  quantity: 1,
  user: shinji
)

basket = Item.create!(
  name: "Basket",
  length: 50,
  width: 35,
  quantity: 1,
  user: shinji
)

desk = Item.create!(
  name: "Desk",
  length: 80,
  width: 100,
  quantity: 1,
  user: ryan
)

# Apartments
puts "creating apartments..."

meguro_heights = Apartment.create!(
  name: "Meguro Heights",
  address: "Himonya 5-chome, Meguro-ku",
  total_floorspace: 20.64,
  price: 88_000,
  description: "Beautiful one bedroom apartment with magnificent views, with spacious storage and a fully equipped kitchen and bathroom.",
  category: "2LDK",
  agency: fable_agency,
  hidden: false
)

meguro_heights.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/meguro_heights_p1.jpg"), filename: "meguro_heights_p1.jpg", content_type: "image/jpg")
meguro_heights.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/meguro_heights_p2.jpg"), filename: "meguro_heights_p2.jpg", content_type: "image/jpg")
meguro_heights.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/meguro_heights_p3.jpg"), filename: "meguro_heights_p3.jpg", content_type: "image/jpg")
meguro_heights.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/meguro_heights_p4.jpg"), filename: "meguro_heights_p4.jpg", content_type: "image/jpg")
meguro_heights.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/meguro_heights_p5.jpg"), filename: "meguro_heights_p5.jpg", content_type: "image/jpg")

url1 = "http://www.suitefit.tech/apartments/#{meguro_heights.id}"
meguro_heights_qr_code = RQRCode::QRCode.new(url1)
meguro_heights.qr_code = meguro_heights_qr_code

meguro_heights.save!

shimouma_building = Apartment.create!(
  name: "Shimouma building",
  address: "Shimouma 6-chome, Setagaya-ku",
  total_floorspace: 29.10,
  price: 128_000,
  description: "This 29m2 apartment is in the city center, close to the station, with the bathroom and toilet separated. The building offers comfortable and secure living in the best district of Tokyo.",
  category: "1LDK",
  agency: fable_agency,
  hidden: false
)

shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p1.jpg"), filename: "shimouma_building_p1.jpg", content_type: "image/jpg")
shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p2.jpg"), filename: "shimouma_building_p2.jpg", content_type: "image/jpg")
shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p3.jpg"), filename: "shimouma_building_p3.jpg", content_type: "image/jpg")
shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p4.jpg"), filename: "shimouma_building_p4.jpg", content_type: "image/jpg")
shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p5.jpg"), filename: "shimouma_building_p5.jpg", content_type: "image/jpg")
shimouma_building.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/shimouma_building_p6.jpg"), filename: "shimouma_building_p6.jpg", content_type: "image/jpg")

url2 = "http://www.suitefit.tech/apartments/#{shimouma_building.id}"
shimouma_building_qr_code = RQRCode::QRCode.new(url2)
shimouma_building.qr_code = shimouma_building_qr_code

shimouma_building.save!

vizinho_tokyo = Apartment.create!(
  name: "Vizinho Tokyo",
  address: "Shimouma 1-chome, Setagaya-ku",
  total_floorspace: 17,
  price: 60_000,
  description: "Newly renovated design apartment situated in one of Tokyo's most popular and coolest neighborhood. Apartment was built as modern open space where the fully equipped kitchen is a part of living zone, with fully equipped kitchen, modern bathroom toilet.",
  category: "1R",
  agency: fable_agency,
  hidden: false
)

vizinho_tokyo.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/vizinho_tokyo_p1.jpg"), filename: "vizinho_tokyo_p1.jpg", content_type: "image/jpg")
vizinho_tokyo.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/vizinho_tokyo_p2.jpg"), filename: "vizinho_tokyo_p2.jpg", content_type: "image/jpg")
vizinho_tokyo.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/vizinho_tokyo_p3.jpg"), filename: "vizinho_tokyo_p3.jpg", content_type: "image/jpg")
vizinho_tokyo.photos.attach(io: File.open("#{Rails.root}/app/assets/images/apts/vizinho_tokyo_p4.jpg"), filename: "vizinho_tokyo_p4.jpg", content_type: "image/jpg")

url3 = "http://www.suitefit.tech/apartments/#{vizinho_tokyo.id}"
vizinho_tokyo_qr_code = RQRCode::QRCode.new(url3)
vizinho_tokyo.qr_code = vizinho_tokyo_qr_code

vizinho_tokyo.save!

# Floorplans
puts "creating floor plan pictures"

meguro_heights_floorplan = FloorPlanPicture.create!(apartment: meguro_heights)
meguro_heights_floorplan.photo.attach(io: File.open("#{Rails.root}/app/assets/images/fp/meguro_heights_floor_plan.png"), filename: "meguro_heights_floorplan_picture.png", content_type: "image/png")
meguro_heights_floorplan.save!

shimouma_building_floorplan = FloorPlanPicture.create!(apartment: shimouma_building)
shimouma_building_floorplan.photo.attach(io: File.open("#{Rails.root}/app/assets/images/fp/shimouma_building_floor_plan.jpg"), filename: "shimouma_building_floorplan_picture.jpg", content_type: "image/jpg")
shimouma_building_floorplan.save!

vizinho_tokyo_floorplan = FloorPlanPicture.create!(apartment: vizinho_tokyo)
vizinho_tokyo_floorplan.photo.attach(io: File.open("#{Rails.root}/app/assets/images/fp/vizinho_tokyo_floor_plan.png"), filename: "vizinho_tokyo_floorplan_picture.png", content_type: "image/png")
vizinho_tokyo_floorplan.save!

# Bookmarks
puts "creating bookmarks..."

bookmark1 = Bookmark.create!(
  comment: "Small apartment",
  result: "Bad fit",
  user: shinji,
  apartment: vizinho_tokyo
)

bookmark2 = Bookmark.create!(
  comment: "Nice apartment",
  result: "Good fit",
  user: shinji,
  apartment: shimouma_building
)

bookmark3 = Bookmark.create!(
  comment: "Perfect size for me",
  result: "Good fit",
  user: ryan,
  apartment: vizinho_tokyo
)

bookmark4 = Bookmark.create!(
  comment: "Save for later",
  user: ryan,
  apartment: meguro_heights
)

puts "done! :D"
