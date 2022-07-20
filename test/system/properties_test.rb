require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "should create property" do
    visit properties_url
    click_on "New property"

    fill_in "Address", with: @property.address
    fill_in "Bound by water", with: @property.bound_by_water
    fill_in "City", with: @property.city
    fill_in "Lot number", with: @property.lot_number
    fill_in "On municipal water sewer", with: @property.on_municipal_water_sewer
    fill_in "Postal code", with: @property.postal_code
    fill_in "Title insurance denied", with: @property.title_insurance_denied
    fill_in "Title insurance issued", with: @property.title_insurance_issued
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "should update Property" do
    visit property_url(@property)
    click_on "Edit this property", match: :first

    fill_in "Address", with: @property.address
    fill_in "Bound by water", with: @property.bound_by_water
    fill_in "City", with: @property.city
    fill_in "Lot number", with: @property.lot_number
    fill_in "On municipal water sewer", with: @property.on_municipal_water_sewer
    fill_in "Postal code", with: @property.postal_code
    fill_in "Title insurance denied", with: @property.title_insurance_denied
    fill_in "Title insurance issued", with: @property.title_insurance_issued
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "should destroy Property" do
    visit property_url(@property)
    click_on "Destroy this property", match: :first

    assert_text "Property was successfully destroyed"
  end
end
