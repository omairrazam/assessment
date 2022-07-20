require "application_system_test_case"

class InsurancesTest < ApplicationSystemTestCase
  setup do
    @insurance = insurances(:one)
  end

  test "visiting the index" do
    visit insurances_url
    assert_selector "h1", text: "Insurances"
  end

  test "should create insurance" do
    visit insurances_url
    click_on "New insurance"

    fill_in "Notes", with: @insurance.notes
    fill_in "Referral agent email", with: @insurance.referral_agent_email
    fill_in "Referral agent name", with: @insurance.referral_agent_name
    click_on "Create Insurance"

    assert_text "Insurance was successfully created"
    click_on "Back"
  end

  test "should update Insurance" do
    visit insurance_url(@insurance)
    click_on "Edit this insurance", match: :first

    fill_in "Notes", with: @insurance.notes
    fill_in "Referral agent email", with: @insurance.referral_agent_email
    fill_in "Referral agent name", with: @insurance.referral_agent_name
    click_on "Update Insurance"

    assert_text "Insurance was successfully updated"
    click_on "Back"
  end

  test "should destroy Insurance" do
    visit insurance_url(@insurance)
    click_on "Destroy this insurance", match: :first

    assert_text "Insurance was successfully destroyed"
  end
end
