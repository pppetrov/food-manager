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

ActiveRecord::Schema.define(version: 20150916175426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "food_group_id"
    t.string  "long_desc"
    t.string  "short_desc"
    t.string  "common_names"
    t.string  "manufac_name"
    t.string  "survey_text"
    t.string  "ref_desc"
    t.string  "refuse"
    t.string  "sci_name"
    t.float   "nitrogen_factor"
    t.float   "protein_factor"
    t.float   "fat_factor"
    t.float   "calorie_factor"
  end

  add_index "foods", ["food_group_id"], name: "index_foods_on_food_group_id", using: :btree

end
