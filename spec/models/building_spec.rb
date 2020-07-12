# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Building, type: :model do
  after(:all) do
    Building.destroy_all
    Company.destroy_all
    Office.destroy_all
  end

  building = Building.new(
    name: Faker::Movies::Hobbit.location,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    rent_per_floor: 2000,
    number_of_floors: 5
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

  describe 'model methods' do
    building2 = Building.create(
      name: Faker::Movies::Hobbit.location,
      country: Faker::Address.country,
      address: Faker::Address.full_address,
      rent_per_floor: 2000,
      number_of_floors: 5
    )

    company = Company.create(
      name: Faker::Company.name
    )

    Office.create(
      floor: 1,
      building_id: building2.id,
      company_id: company.id
    )

    Office.create(
      floor: 2,
      building_id: building2.id,
      company_id: company.id
    )

    it 'should calculate the total rent' do
      expect(building2.monthly_revenue).to eq 4000
    end

    it 'should give an array of available floors' do
      expect(building2.available_floors).to be_kind_of(Array)
      expect(building2.available_floors).to eq [3, 4, 5]
    end
  end
end
