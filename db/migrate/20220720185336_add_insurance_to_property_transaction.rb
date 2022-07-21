class AddInsuranceToPropertyTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :property_transactions, :insurance, null: false, foreign_key: true
  end
end
