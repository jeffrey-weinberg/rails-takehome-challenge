# frozen_string_literal: true

20.times do
  company = Company.create(name: Faker::Company.name)
end

5.times do
  building = Building.create(
    name: Faker::Movies::Hobbit.location,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    rent_per_floor: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    number_of_floors: Faker::Number.between(from: 1, to: 10)
  )

  available_floors = building.number_of_floors
  number_of_occupied_floors = rand(1..available_floors)

  number_of_occupied_floors.times do
    office = Office.create(
      building_id: building.id,
      company_id: rand(1..20),
      floor: rand(1..available_floors)
    )

    5.times do
      Employee.create(
        name: Faker::FunnyName.name,
        title: Faker::Company.profession,
        office_id: office.id
      )
    end
  end
end
