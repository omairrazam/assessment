class AddPropertyToProperyTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :property_transactions, :property, null: false, foreign_key: true
  end
end
