require "application_system_test_case"

class PropertyTransactionsTest < ApplicationSystemTestCase
  setup do
    @property_transaction = property_transactions(:one)
  end

  test "visiting the index" do
    visit property_transactions_url
    assert_selector "h1", text: "Property transactions"
  end

  test "should create property transaction" do
    visit property_transactions_url
    click_on "New property transaction"

    fill_in "First homeowner name", with: @property_transaction.first_homeowner_name
    fill_in "Is owner", with: @property_transaction.is_owner
    fill_in "Language", with: @property_transaction.language
    fill_in "Property type", with: @property_transaction.property_type_id
    fill_in "Property value", with: @property_transaction.property_value
    fill_in "Purshase date", with: @property_transaction.purshase_date
    fill_in "Quotation", with: @property_transaction.quotation_id
    fill_in "Second homeowner name", with: @property_transaction.second_homeowner_name
    fill_in "Third homeowner name", with: @property_transaction.third_homeowner_name
    click_on "Create Property transaction"

    assert_text "Property transaction was successfully created"
    click_on "Back"
  end

  test "should update Property transaction" do
    visit property_transaction_url(@property_transaction)
    click_on "Edit this property transaction", match: :first

    fill_in "First homeowner name", with: @property_transaction.first_homeowner_name
    fill_in "Is owner", with: @property_transaction.is_owner
    fill_in "Language", with: @property_transaction.language
    fill_in "Property type", with: @property_transaction.property_type_id
    fill_in "Property value", with: @property_transaction.property_value
    fill_in "Purshase date", with: @property_transaction.purshase_date
    fill_in "Quotation", with: @property_transaction.quotation_id
    fill_in "Second homeowner name", with: @property_transaction.second_homeowner_name
    fill_in "Third homeowner name", with: @property_transaction.third_homeowner_name
    click_on "Update Property transaction"

    assert_text "Property transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Property transaction" do
    visit property_transaction_url(@property_transaction)
    click_on "Destroy this property transaction", match: :first

    assert_text "Property transaction was successfully destroyed"
  end
end
