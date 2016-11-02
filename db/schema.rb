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

ActiveRecord::Schema.define(version: 20161101110455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comparisons", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "user"
    t.string   "comparison"
    t.integer  "point_type"
    t.integer  "point"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "shop"
    t.string   "category"
    t.string   "item"
    t.string   "name"
    t.integer  "price"
    t.float    "calorie"
    t.float    "net"
    t.float    "protein"
    t.float    "fat"
    t.float    "carbon"
    t.float    "sugar"
    t.float    "fiber"
    t.float    "sodium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
