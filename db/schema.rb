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

ActiveRecord::Schema.define(version: 20160519182457) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.float    "pr01"
    t.float    "pr02"
    t.float    "pr04"
    t.float    "pr13"
    t.float    "pr26"
    t.float    "pr03"
    t.float    "pr39"
    t.float    "pr52"
    t.integer  "pr_year_to_date"
    t.float    "price_current"
    t.float    "warranted_price"
    t.float    "per_FY1"
    t.float    "per_FY2"
    t.float    "per_LFY"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
