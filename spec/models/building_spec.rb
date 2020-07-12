# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Building, type: :model do
  building = Building.new(
    name: Faker::Movies::Hobbit.location,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    rent_per_floor: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    number_of_floors: Faker::Number.between(from: 1, to: 10)
  )

  it 'is valid with valid attributes' do
    expect(building).to be_valid
  end

  it 'is invalid without a name' do
    building.name = nil
    expect(building).to be_invalid
  end

  it 'is invalid without a country' do
    building.country = nil
    expect(building).to be_invalid
  end

  it 'is invalid without a address' do
    building.address = nil
    expect(building).to be_invalid
  end

  it 'is invalid without a rent_per_floor' do
    building.rent_per_floor = nil
    expect(building).to be_invalid
  end

  it 'is invalid without a number_of_floors' do
    building.number_of_floors = nil
    expect(building).to be_invalid
  end
end
