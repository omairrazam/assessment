# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_20_162616) do
  create_table "insurances", force: :cascade do |t|
    t.text "notes"
    t.string "referral_agent_name"
    t.string "referral_agent_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "lot_number"
    t.text "address"
    t.string "city"
    t.string "postal_code"
    t.integer "bound_by_water"
    t.integer "on_municipal_water_sewer"
    t.integer "title_insurance_issued"
    t.integer "title_insurance_denied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_transactions", force: :cascade do |t|
    t.integer "language"
    t.string "first_homeowner_name"
    t.string "second_homeowner_name"
    t.string "third_homeowner_name"
    t.integer "is_owner"
    t.datetime "purshase_date"
    t.string "property_value"
    t.integer "property_type_id", null: false
    t.integer "quotation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_property_transactions_on_property_id"
    t.index ["property_type_id"], name: "index_property_transactions_on_property_type_id"
    t.index ["quotation_id"], name: "index_property_transactions_on_quotation_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "municipal_evaluation"
    t.text "address"
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.integer "insurance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_id"], name: "index_quotations_on_insurance_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "language"
    t.string "first_homeowner_name"
    t.string "second_homeowner_name"
    t.string "third_homeowner_name"
    t.integer "is_owner"
    t.datetime "purshase_date"
    t.string "property_value"
    t.integer "property_type_id", null: false
    t.integer "quotation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_transactions_on_property_type_id"
    t.index ["quotation_id"], name: "index_transactions_on_quotation_id"
  end

  add_foreign_key "property_transactions", "properties"
  add_foreign_key "property_transactions", "property_types"
  add_foreign_key "property_transactions", "quotations"
  add_foreign_key "quotations", "insurances"
  add_foreign_key "transactions", "property_types"
  add_foreign_key "transactions", "quotations"
end
