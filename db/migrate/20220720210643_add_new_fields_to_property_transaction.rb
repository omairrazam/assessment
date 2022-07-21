class AddNewFieldsToPropertyTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :property_transactions, :request_a_callback_phone, :string
    add_column :property_transactions, :request_a_callback_best_moment, :string
  end
end
