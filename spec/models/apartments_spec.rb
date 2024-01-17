require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'should have a name' do
    params = { name: "", address: "123 hiii", total_floorspace: 23, price: 40000, description: "Wowowowow", category: "1LDK" }
    apartment = Apartment.new(params)
    expect(apartment.save).to eq(false)
  end

  it 'should have an address' do
    params = { name: "blergh", address: "", total_floorspace: 23, price: 40000, description: "Wowowowow", category: "1LDK" }
    apartment = Apartment.new(params)
    expect(apartment.save).to eq(false)
  end

  it 'floorspace should be a number' do
    params = { name: "alksdjf", address: "123 hiii", total_floorspace: "34", price: 40000, description: "Wowowowow", category: "1LDK" }
    apartment = Apartment.new(params)
    expect(apartment.save).to eq(false)
  end

  it 'should have a description longer than 4 characters' do
    params = { name: "howdy", address: "123 hiii", total_floorspace: 23, price: 40000, description: "Whoa", category: "1LDK" }
    apartment = Apartment.new(params)
    expect(apartment.save).to eq(false)
  end

  it 'price should be a number' do
    params = { name: "Ooga booga", address: "123 hiii", total_floorspace: 23, price: "40000", description: "Wowowowow", category: "1LDK" }
    apartment = Apartment.new(params)
    expect(apartment.save).to eq(false)
  end
end
