# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140817163033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipments", force: true do |t|
    t.string   "name"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipment_type_id"
  end

  add_index "equipments", ["equipment_type_id"], name: "index_equipments_on_equipment_type_id", using: :btree
  add_index "equipments", ["system_id"], name: "index_equipments_on_system_id", using: :btree

  create_table "equipments_type", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specifications", force: true do |t|
    t.integer  "equipment_id"
    t.string   "name"
    t.string   "datatype"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specifications", ["equipment_id"], name: "index_specifications_on_equipment_id", using: :btree

  create_table "systems", force: true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "systems", ["location_id"], name: "index_systems_on_location_id", using: :btree

end
