# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office, type: :model do
  after(:all) do
    Building.destroy_all
    Company.destroy_all
    Office.destroy_all
  end

  building = Building.create(
    name: Faker::Movies::Hobbit.location,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    rent_per_floor: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    number_of_floors: 3
  )

  company = Company.create(
    name: Faker::Company.name
  )

  office = Office.new(
    floor: 1,
    building_id: building.id,
    company_id: company.id
  )

  it 'is valid with valid attributes' do
    expect(office).to be_valid
  end

  it 'is invalid without a floor' do
    office.floor = nil
    expect(office).to be_invalid
  end

  it 'is invalid with a duplicate floor' do
    office.floor = 1
    office.save

    office2 = Office.new(
      floor: 1,
      building_id: building.id,
      company_id: company.id
    )

    expect(office2).to be_invalid
    expect(office2.errors.messages[:floor]).to eq ['only one office per floor per building']
  end
end
