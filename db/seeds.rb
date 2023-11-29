require "open-uri"

puts "cleaning the db..."
Floor_Plan_Picture.destroy_all
Message.desroy_all
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
puts "Creating apartments..."

meguro_heights = Apartment.create!(
  name: "Meguro Heights",
  address: "Himonya 5-chome, Meguro-ku",
  total_floorspace: 20.64,
  price: 88_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1LDK",
  agency: fable_agency,
  hidden: false
)

meguro_heights_p1 = URI.open("")
meguro_heights.photos.attach(io: meguro_heights_p1, filename: "meguro_heights_p1.jpg", content_type: "image/jpg")
meguro_heights_p2 = URI.open("")
meguro_heights.photos.attach(io: meguro_heights_p2, filename: "meguro_heights_p2.jpg", content_type: "image/jpg")
meguro_heights_p3 = URI.open("")
meguro_heights.photos.attach(io: meguro_heights_p3, filename: "meguro_heights_p3.jpg", content_type: "image/jpg")

url1 = "http://www.suitefit.tech/apartments/#{meguro_heights.id}"
meguro_heights_qr_code = RQRCode::QRCode.new(url1)
meguro_heights.qr_code = meguro_heights_qr_code

meguro_heights.save!

shimouma_building = Apartment.create!(
  name: "Shimouma building",
  address: "Shimouma 6-chome, Setagaya-ku",
  total_floorspace: 29.10,
  price: 128_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1LDK",
  agency: fable_agency,
  hidden: false
)

shimouma_building_p1 = URI.open("")
shimouma_building.photos.attach(io: shimouma_building_p1, filename: "shimouma_building_p1.jpg", content_type: "image/jpg")
shimouma_building_p2 = URI.open("")
shimouma_building.photos.attach(io: shimouma_building_p2, filename: "shimouma_building_p2.jpg", content_type: "image/jpg")
shimouma_building_p3 = URI.open("")
shimouma_building.photos.attach(io: shimouma_building_p3, filename: "shimouma_building_p3.jpg", content_type: "image/jpg")

url2 = "http://www.suitefit.tech/apartments/#{shimouma_building.id}"
shimouma_building_qr_code = RQRCode::QRCode.new(url2)
shimouma_building.qr_code = shimouma_building_qr_code

shimouma_building.save!

vizinho_tokyo = Apartment.create!(
  name: "Vizinho Tokyo",
  address: "Shimouma 1-chome, Setagaya-ku",
  total_floorspace: 17,
  price: 60_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1R",
  agency: fable_agency,
  hidden: false
)

vizinho_tokyo_p1 = URI.open("")
vizinho_tokyo.photos.attach(io: vizinho_tokyo_p1, filename: "vizinho_tokyo_p1.jpg", content_type: "image/jpg")
vizinho_tokyo_p2 = URI.open("")
vizinho_tokyo.photos.attach(io: vizinho_tokyo_p2, filename: "vizinho_tokyo_p2.jpg", content_type: "image/jpg")
vizinho_tokyo_p3 = URI.open("")
vizinho_tokyo.photos.attach(io: vizinho_tokyo_p3, filename: "vizinho_tokyo_p3.jpg", content_type: "image/jpg")

url3 = "http://www.suitefit.tech/apartments/#{vizinho_tokyo.id}"
vizinho_tokyo_qr_code = RQRCode::QRCode.new(url3)
vizinho_tokyo.qr_code = vizinho_tokyo_qr_code

vizinho_tokyo.save!

# Floorplans
puts "creating floor plan pictures"

meguro_heights_floorplan_picture = URI.open("")
meguro_heights_floorplan = FloorPlanPicture.new
meguro_heights_floorplan.apartment = meguro_heights
meguro_heights_floorplan.attach(io: meguro_heights_floorplan_picture, filename: "meguro_heights_floorplan_picture.jpg", content_type: "image/jpg")
meguro_heights_floorplan.save!

shimouma_building_floorplan_picture = URI.open("")
shimouma_building_floorplan = FloorPlanPicture.new
shimouma_building_floorplan.apartment = shimouma_building
shimouma_building_floorplan.attach(io: shimouma_building_floorplan_picture, filename: "shimouma_building_floorplan_picture.jpg", content_type: "image/jpg")
shimouma_building_floorplan.save!

vizinho_tokyo_floorplan_picture = URI.open("")
vizinho_tokyo_floorplan = FloorPlanPicture.new
vizinho_tokyo_floorplan.apartment = vizinho_tokyo
vizinho_tokyo_floorplan.attach(io: vizinho_tokyo_floorplan_picture, filename: "vizinho_tokyo_floorplan_picture.jpg", content_type: "image/jpg")
vizinho_tokyo_floorplan.save!

#Bookmarks
puts "creating bookmarks..."

bookmark1 = Bookmark.create!(
  comment: "Small apartment",
  result: "Bad fit",
  arrangement: FABRIC_JSON,
  user: shinji,
  apartment: vizinho_tokyo
)

bookmark2 = Bookmark.create!(
  comment: "Nice apartment",
  result: "Good fit",
  arrangement: FABRIC_JSON,
  user: shinji,
  apartment: shimouma_build
)

bookmark3 = Bookmark.create!(
  comment: "Perfect size for me",
  result: "Good fit",
  arrangement: FABRIC_JSON,
  user: ryan,
  apartment: vizinho_tokyo
)

bookmark4 = Bookmark.create!(
  comment: "Save for later",
  result: "Undetermined",
  arrangement: FABRIC_JSON,
  user: ryan,
  apartment: meguro_heights
)

puts "Finished"
