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

ActiveRecord::Schema.define(version: 20140511120043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "equipments", force: true do |t|
    t.text     "description"
    t.hstore   "listed_specs"
    t.hstore   "actual_specs"
    t.string   "itemcode"
    t.date     "installed_at"
    t.date     "replaced_at"
    t.date     "failure_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipments", ["actual_specs"], name: "equipments_gin_actual_specs", using: :gin
  add_index "equipments", ["itemcode"], name: "index_equipments_on_itemcode", using: :btree
  add_index "equipments", ["listed_specs"], name: "equipments_gin_listed_specs", using: :gin

end
