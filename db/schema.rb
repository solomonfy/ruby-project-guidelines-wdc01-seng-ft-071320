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

ActiveRecord::Schema.define(version: 2020_07_28_163020) do

  create_table "buyers", force: :cascade do |t|
    t.string "name"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.integer "inventory"
    t.integer "account_balance"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.integer "inventory"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "make"
    t.integer "year"
    t.integer "milage"
    t.string "drivable_type"
    t.integer "drivable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drivable_type", "drivable_id"], name: "index_vehicles_on_drivable_type_and_drivable_id"
  end

end