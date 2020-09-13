# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_13_192859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.string "reg_num"
    t.string "status"
    t.string "color"
    t.string "modelname"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reg_num"], name: "index_cabs_on_reg_num", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.float "starting_lat"
    t.float "starting_long"
    t.float "ending_lat"
    t.float "ending_long"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.bigint "customer_id", null: false
    t.bigint "cab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cab_id"], name: "index_trips_on_cab_id"
    t.index ["customer_id"], name: "index_trips_on_customer_id"
  end

  add_foreign_key "trips", "cabs"
  add_foreign_key "trips", "customers"
end
