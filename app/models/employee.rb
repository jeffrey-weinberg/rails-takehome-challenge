# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :office
  has_one :company, through: :office

  validates :name, presence: true, length: { minimum: 5 }
  validates :title, presence: true
end
