require "open-uri"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "cleaning the db..."
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

# Rep hosts

yann = User.create!(username: "Yann", email: "yann@yann.com", password: "yanniscool" , agency: true)
celso = User.create!(username: "Celso", email: "celso@celso.com", password: "celsoiscool" , agency: true)
rachael = User.create!(username: "Rachael", email: "rachael@rachael.com", password: "rachaeliscool" , agency: true)
rina = User.create!(username: "Rina", email: "rina@rina.com", password: "rinaiscool" , agency: true)
trouni = User.create!(username: "Trouni", email: "trouni@trouni.com", password: "trouniiscool" , agency: true)

FABRIC_JSON = JSON.parse(File.read("db/sample_json.json")).to_json

# Items
puts "Creating items..."

table = Item.create!(
  name: "Table",
  length: 110,
  width: 70,
  quantity: 1,
  user: shinji
)

table.save

chair = Item.create!(
  name: "Chair",
  length: 76,
  width: 49,
  quantity: 1,
  user: shinji
)

chair.save

armchair = Item.create!(
  name: "Armchair",
  length: 80,
  width: 50,
  quantity: 1,
  user: shinji
)

armchair.save

couch = Item.create!(
  name: "Couch",
  length: 213,
  width: 89,
  quantity: 1,
  user: shinji
)

couch.save

sofa = Item.create!(
  name: "Sofa",
  length: 250,
  width: 120,
  quantity: 1,
  user: shinji
)

sofa.save

single_bed = Item.create!(
  name: "Single bed",
  length: 188,
  width: 92,
  quantity: 1,
  user: ryan
)

single_bed.save

double_bed = Item.create!(
  name: "Double bed",
  length: 188,
  width: 138,
  quantity: 1,
  user: shinji
)

double_bed.save

fridge = Item.create!(
  name: "Fridge",
  length: 55,
  width: 50,
  quantity: 1,
  user: ryan
)

fridge.save

washing_machine = Item.create!(
  name: "Washing machine",
  length: 60,
  width: 50,
  quantity: 1,
  user: shinji
)

washing_machine.save

tv = Item.create!(
  name: "TV",
  length: 120,
  width: 10,
  quantity: 1,
  user: shinji
)

tv.save

wardrobe = Item.create!(
  name: "Wardrobe",
  length: 150,
  width: 90,
  quantity: 1,
  user: ryan
)

wardrobe.save

microwave = Item.create!(
  name: "Microwave",
  length: 40,
  width: 45,
  quantity: 1,
  user: ryan
)

microwave.save

trash_can = Item.create!(
  name: "Trash can",
  length: 30,
  width: 20,
  quantity: 1,
  user: shinji
)

trash_can.save

basket = Item.create!(
  name: "Basket",
  length: 50,
  width: 35,
  quantity: 1,
  user: shinji
)

basket.save

desk = Item.create!(
  name: "Desk",
  length: 80,
  width: 100,
  quantity: 1,
  user: ryan
)

desk.save

# Apartments
puts "Creating apartments..."

meguro_heights_file = URI.open("https://minimini.jp/bookimg_spr/00010014/4018577_op_1.jpg")
meguro_heights = Apartment.create!(
  name: "Meguro Heights",
  address: "Himonya 5-chome, Meguro-ku",
  total_floorspace: 20.64,
  price: 88_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1LDK",
  floor_plan: "JSON",
  qr_code: "QR code",
  agency: rachael
)
meguro_heights.photos.attach(io: meguro_heights_file, filename: "meguro_heights.jpg", content_type: "image/jpg")
meguro_heights.save

shimouma_build_file = URI.open("https://minimini.jp/bookimg_spr/00010014/4032358_op_1.jpg")
shimouma_build = Apartment.create!(
  name: "Shimouma build",
  address: "Shimouma 6-chome, Setagaya-ku",
  total_floorspace: 29.10,
  price: 128_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1LDK",
  floor_plan: "JSON",
  qr_code: "QR code",
  agency: rachael
)
shimouma_build.photos.attach(io: shimouma_build_file, filename: "shimouma_build.jpg", content_type: "image/jpg")
shimouma_build.save

vizinho_tokyo_file = URI.open("https://minimini.jp/bookimg_spr/00010014/4032223_op_1.jpg")
vizinho_tokyo = Apartment.create!(
  name: "Vizinho Tokyo",
  address: "Shimouma 1-chome, Setagaya-ku",
  total_floorspace: 17,
  price: 60_000,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  category: "1R",
  floor_plan: "JSON",
  qr_code: "QR code",
  agency: rachael
)
vizinho_tokyo.photos.attach(io: vizinho_tokyo_file, filename: "vizinho_tokyo.jpg", content_type: "image/jpg")
vizinho_tokyo.save

#Bookmarks
puts "Creating bookmarks..."

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
