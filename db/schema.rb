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

ActiveRecord::Schema.define(version: 2020_10_13_190129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "motorcycles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "image_path"
    t.bigint "rider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rider_id"], name: "index_motorcycles_on_rider_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_path"
    t.bigint "ride_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ride_id"], name: "index_photos_on_ride_id"
  end

  create_table "ride_attendances", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "ride_id", null: false
    t.bigint "motorcycle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["motorcycle_id"], name: "index_ride_attendances_on_motorcycle_id"
    t.index ["ride_id"], name: "index_ride_attendances_on_ride_id"
    t.index ["rider_id"], name: "index_ride_attendances_on_rider_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "date_time"
    t.string "description"
    t.bigint "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["route_id"], name: "index_rides_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "start_location"
    t.string "end_location"
    t.string "map_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "city"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "motorcycles", "riders"
  add_foreign_key "photos", "rides"
  add_foreign_key "ride_attendances", "motorcycles"
  add_foreign_key "ride_attendances", "riders"
  add_foreign_key "ride_attendances", "rides"
  add_foreign_key "rides", "routes"
end
