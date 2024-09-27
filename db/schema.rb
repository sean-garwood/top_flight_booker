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

ActiveRecord::Schema[7.2].define(version: 2024_09_27_175111) do
  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "flight_id", null: false
    t.integer "airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_arrivals_on_airport_id"
    t.index ["flight_id"], name: "index_arrivals_on_flight_id"
  end

  create_table "departures", force: :cascade do |t|
    t.integer "flight_id", null: false
    t.integer "airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_departures_on_airport_id"
    t.index ["flight_id"], name: "index_departures_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "depart_time"
    t.time "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "arrivals", "airports"
  add_foreign_key "arrivals", "flights"
  add_foreign_key "departures", "airports"
  add_foreign_key "departures", "flights"
end
