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

ActiveRecord::Schema[7.0].define(version: 2023_09_24_163533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.string "employee_type"
    t.integer "status", default: 0
    t.integer "last_updated_by"
    t.index ["employee_type", "employee_id"], name: "index_employee_records_on_employee_type_and_employee_id"
    t.index ["last_updated_by"], name: "index_employee_records_on_last_updated_by"
  end

  create_table "equipment_inventories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "equipment_name"
    t.string "equipment_id"
    t.integer "status", default: 0
    t.bigint "maintenance_staffs_id"
    t.index ["maintenance_staffs_id"], name: "index_equipment_inventories_on_maintenance_staffs_id"
  end

  create_table "hr_staffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "employee_record_id"
    t.string "role"
  end

  create_table "maintenance_staffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "employee_record_id"
    t.bigint "equipment_inventory_id"
    t.index ["employee_record_id"], name: "index_maintenance_staffs_on_employee_record_id", unique: true
    t.index ["equipment_inventory_id"], name: "index_maintenance_staffs_on_equipment_inventory_id"
  end

  create_table "management_staffs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "employee_record_id"
    t.string "role"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "report_type"
    t.bigint "management_staffs_id"
    t.string "date_range"
    t.string "metrics_included"
    t.index ["management_staffs_id"], name: "index_reports_on_management_staffs_id"
  end

  add_foreign_key "equipment_inventories", "maintenance_staffs", column: "maintenance_staffs_id"
  add_foreign_key "maintenance_staffs", "equipment_inventories"
  add_foreign_key "reports", "management_staffs", column: "management_staffs_id"
end