# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :offices, dependent: :destroy
  has_many :companies, through: :offices
  has_many :employees, through: :companies, source: :offices

  validates :name, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  def monthly_revenue
    number_of_occupied_floors = offices.count
    number_of_occupied_floors * rent_per_floor
  end

  def available_floors
    floors_list = * (1..number_of_floors)

    offices.each do |office|
      floors_list.delete(office.floor)
    end

    floors_list
  end

  def total_employees
    total_employees = 0

    offices.each do |office|
      total_employees += office.employees.count
    end

    total_employees
  end

  def full?
    available_floors.empty?
  end
end
