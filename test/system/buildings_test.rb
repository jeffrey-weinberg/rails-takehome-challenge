require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "creating a Building" do
    visit buildings_url
    click_on "New Building"

    fill_in "Address", with: @building.address
    fill_in "Country", with: @building.country
    fill_in "Name", with: @building.name
    fill_in "Number of floors", with: @building.number_of_floors
    fill_in "Rent per floor", with: @building.rent_per_floor
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @building.address
    fill_in "Country", with: @building.country
    fill_in "Name", with: @building.name
    fill_in "Number of floors", with: @building.number_of_floors
    fill_in "Rent per floor", with: @building.rent_per_floor
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "destroying a Building" do
    visit buildings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Building was successfully destroyed"
  end
end
