class CreatePropertyTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :property_transactions do |t|
      t.integer :language
      t.string :first_homeowner_name
      t.string :second_homeowner_name
      t.string :third_homeowner_name
      t.integer :is_owner
      t.datetime :purshase_date
      t.string :property_value
      t.belongs_to :property_type, null: false, foreign_key: true
      t.belongs_to :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
