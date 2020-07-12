# frozen_string_literal: true

class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company
  has_many :employees

  validates :floor, presence: true,
                    uniqueness: {
                      scope: :building,
                      message: 'only one office per floor per building'
                    }
end
