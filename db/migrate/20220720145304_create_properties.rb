class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :lot_number
      t.text :address
      t.string :city
      t.string :postal_code
      t.integer :bound_by_water
      t.integer :on_municipal_water_sewer
      t.integer :title_insurance_issued
      t.integer :title_insurance_denied

      t.timestamps
    end
  end
end
