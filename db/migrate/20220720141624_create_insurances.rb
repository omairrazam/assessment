class CreateInsurances < ActiveRecord::Migration[7.0]
  def change
    create_table :insurances do |t|
      t.text :notes
      t.string :referral_agent_name
      t.string :referral_agent_email

      t.timestamps
    end
  end
end
