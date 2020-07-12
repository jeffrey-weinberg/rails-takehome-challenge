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
end
