# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  after(:all) do
    Employee.destroy_all
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

  office = Office.create(
    floor: 1,
    building_id: building.id,
    company_id: company.id
  )

  employee = Employee.new(
    name: Faker::FunnyName.three_word_name,
    title: Faker::Company.profession,
    office_id: office.id
  )

  it 'is valid with valid attributes' do
    expect(employee).to be_valid
  end

  it 'is invalid without a name' do
    employee.name = nil
    expect(employee).to be_invalid
  end

  it 'is invalid a name less than 5 characters' do
    employee.name = 'Tom'
    expect(employee).to be_invalid
  end

  it 'is invalid without a title' do
    employee.title = nil
    expect(employee).to be_invalid
  end
end
