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

ActiveRecord::Schema.define(version: 20140523051426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.text     "description"
    t.hstore   "design_specs"
    t.hstore   "actual_specs"
    t.string   "itemcode"
    t.date     "installed_at"
    t.date     "replaced_at"
    t.date     "failure_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "category_id"
  end

  add_index "products", ["actual_specs"], name: "products_gin_actual_spec", using: :gin
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["design_specs"], name: "products_gin_design_spec", using: :gin
  add_index "products", ["itemcode"], name: "index_products_on_itemcode", using: :btree
  add_index "products", ["location_id"], name: "index_products_on_location_id", using: :btree

  create_table "properties", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "symbol"
    t.integer  "position"
    t.string   "data_type"
    t.string   "select_options", default: [], array: true
  end

  add_index "properties", ["category_id"], name: "index_properties_on_category_id", using: :btree
  add_index "properties", ["select_options"], name: "index_properties_on_select_options", using: :gin

end
