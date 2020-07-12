# frozen_string_literal: true

class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :address, null: false
      t.decimal :rent_per_floor, precision: 6, scale: 2, null: false
      t.integer :number_of_floors, limit: 2, null: false

      t.timestamps
    end
  end
end
