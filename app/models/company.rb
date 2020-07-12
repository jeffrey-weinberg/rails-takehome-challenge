# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :offices
  has_many :employees, through: :offices

  validates :name, presence: true
end
