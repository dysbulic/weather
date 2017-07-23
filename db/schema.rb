# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170722172812) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade do |t|
    t.integer "location_id"
    t.string "conditions"
    t.decimal "pressure"
    t.decimal "temperature"
    t.decimal "humidity"
    t.datetime "time"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.decimal "cloudiness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "wind_speed"
    t.decimal "wind_direction"
    t.index ["location_id"], name: "index_readings_on_location_id"
  end

  create_table "vectors", force: :cascade do |t|
    t.decimal "direction"
    t.decimal "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
