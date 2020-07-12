json.extract! building, :id, :name, :country, :address, :rent_per_floor, :number_of_floors, :created_at, :updated_at
json.url building_url(building, format: :json)
