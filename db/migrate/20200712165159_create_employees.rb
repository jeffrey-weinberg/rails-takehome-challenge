# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.references :office, null: false, foreign_key: true

      t.timestamps
    end
  end
end
