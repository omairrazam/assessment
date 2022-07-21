class CreateQuotations < ActiveRecord::Migration[7.0]
  def change
    create_table :quotations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :municipal_evaluation
      t.text :address
      t.string :postal_code
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
