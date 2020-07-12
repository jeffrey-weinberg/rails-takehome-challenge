# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  company = Company.new(
    name: Faker::Company.name
  )

  it 'is valid with a name' do
    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    company.name = nil
    expect(company).to be_invalid
  end
end
