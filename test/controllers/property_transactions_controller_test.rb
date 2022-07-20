require "test_helper"

class PropertyTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_transaction = property_transactions(:one)
  end

  test "should get index" do
    get property_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_property_transaction_url
    assert_response :success
  end

  test "should create property_transaction" do
    assert_difference("PropertyTransaction.count") do
      post property_transactions_url, params: { property_transaction: { first_homeowner_name: @property_transaction.first_homeowner_name, is_owner: @property_transaction.is_owner, language: @property_transaction.language, property_type_id: @property_transaction.property_type_id, property_value: @property_transaction.property_value, purshase_date: @property_transaction.purshase_date, quotation_id: @property_transaction.quotation_id, second_homeowner_name: @property_transaction.second_homeowner_name, third_homeowner_name: @property_transaction.third_homeowner_name } }
    end

    assert_redirected_to property_transaction_url(PropertyTransaction.last)
  end

  test "should show property_transaction" do
    get property_transaction_url(@property_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_transaction_url(@property_transaction)
    assert_response :success
  end

  test "should update property_transaction" do
    patch property_transaction_url(@property_transaction), params: { property_transaction: { first_homeowner_name: @property_transaction.first_homeowner_name, is_owner: @property_transaction.is_owner, language: @property_transaction.language, property_type_id: @property_transaction.property_type_id, property_value: @property_transaction.property_value, purshase_date: @property_transaction.purshase_date, quotation_id: @property_transaction.quotation_id, second_homeowner_name: @property_transaction.second_homeowner_name, third_homeowner_name: @property_transaction.third_homeowner_name } }
    assert_redirected_to property_transaction_url(@property_transaction)
  end

  test "should destroy property_transaction" do
    assert_difference("PropertyTransaction.count", -1) do
      delete property_transaction_url(@property_transaction)
    end

    assert_redirected_to property_transactions_url
  end
end
