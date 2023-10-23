# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_231_017_210_444) do
  create_table 'asset_histories', force: :cascade do |t|
    t.integer 'asset_id', null: false
    t.time 'assigned_at'
    t.time 'return_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'employee_id', null: false
    t.string 'asset_name'
    t.string 'employee_name'
    t.index ['asset_id'], name: 'index_asset_histories_on_asset_id'
    t.index ['employee_id'], name: 'index_asset_histories_on_employee_id'
  end

  create_table 'assets', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.date 'purchase_date'
    t.integer 'employee_id'
    t.index ['employee_id'], name: 'index_assets_on_employee_id'
  end

  create_table 'employees', force: :cascade do |t|
    t.string 'name'
    t.string 'department'
    t.decimal 'age'
    t.string 'address'
    t.date 'DOB'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'asset_histories', 'assets'
  add_foreign_key 'asset_histories', 'employees'
  add_foreign_key 'assets', 'employees'
end
