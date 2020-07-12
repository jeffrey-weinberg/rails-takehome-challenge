# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :offices
  has_many :employees, through: :offices

  validates :name, presence: true

  def total_rent_per_month
    total_rent = 0
    offices.each do |office|
      office_rent = office.building.rent_per_floor
      total_rent += office_rent
    end

    total_rent
  end
end
