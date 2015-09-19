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

ActiveRecord::Schema.define(version: 20150919002341) do

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

  create_table "nutrients", force: :cascade do |t|
    t.string  "unit"
    t.string  "tagname"
    t.string  "name"
    t.string  "num_decimal_places"
    t.integer "sr_order"
  end

  create_table "nutritions", force: :cascade do |t|
    t.integer "food_id"
    t.integer "nutrient_id"
    t.float   "amount"
    t.integer "num_data_points"
    t.float   "std_error"
    t.string  "source_code"
    t.string  "derivation_code"
    t.string  "added_nutrient"
    t.float   "min"
    t.float   "max"
    t.integer "degrees_freedom"
    t.float   "lower_error_bound"
    t.float   "upper_error_bound"
    t.string  "comments"
    t.string  "modification_date"
    t.string  "confidence_code"
  end

  add_index "nutritions", ["food_id"], name: "reference_food_id", using: :btree
  add_index "nutritions", ["nutrient_id"], name: "index_nutritions_on_nutrient_id", using: :btree

  create_table "recipe_food_joins", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "food_id"
    t.integer "weight_id"
    t.float   "amount"
  end

  add_index "recipe_food_joins", ["food_id"], name: "index_recipe_food_joins_on_food_id", using: :btree
  add_index "recipe_food_joins", ["recipe_id"], name: "index_recipe_food_joins_on_recipe_id", using: :btree
  add_index "recipe_food_joins", ["weight_id"], name: "index_recipe_food_joins_on_weight_id", using: :btree

  create_table "recipe_nutrient_joins", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "nutrient_id"
    t.float   "amount"
    t.integer "weight_id"
  end

  add_index "recipe_nutrient_joins", ["nutrient_id"], name: "index_recipe_nutrient_joins_on_nutrient_id", using: :btree
  add_index "recipe_nutrient_joins", ["recipe_id"], name: "index_recipe_nutrient_joins_on_recipe_id", using: :btree
  add_index "recipe_nutrient_joins", ["weight_id"], name: "index_recipe_nutrient_joins_on_weight_id", using: :btree

  create_table "recipe_tag_joins", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  add_index "recipe_tag_joins", ["recipe_id"], name: "index_recipe_tag_joins_on_recipe_id", using: :btree
  add_index "recipe_tag_joins", ["tag_id"], name: "index_recipe_tag_joins_on_tag_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
  end

  create_table "weights", force: :cascade do |t|
    t.integer "food_id"
    t.integer "seq"
    t.integer "amount"
    t.string  "description"
    t.float   "gram_weight"
    t.integer "num_data_points"
    t.float   "std_dev"
  end

  add_index "weights", ["food_id"], name: "index_weights_on_food_id", using: :btree

  add_foreign_key "recipe_food_joins", "foods"
  add_foreign_key "recipe_food_joins", "recipes"
  add_foreign_key "recipe_food_joins", "weights"
  add_foreign_key "recipe_nutrient_joins", "nutrients"
  add_foreign_key "recipe_nutrient_joins", "recipes"
  add_foreign_key "recipe_nutrient_joins", "weights"
  add_foreign_key "recipe_tag_joins", "recipes"
  add_foreign_key "recipe_tag_joins", "tags"
  add_foreign_key "recipes", "users"
end
