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

ActiveRecord::Schema.define(version: 20151114231907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chef_specialties", force: :cascade do |t|
    t.integer  "chef_id",      null: false
    t.integer  "specialty_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "chef_specialties", ["chef_id"], name: "index_chef_specialties_on_chef_id", using: :btree
  add_index "chef_specialties", ["specialty_id"], name: "index_chef_specialties_on_specialty_id", using: :btree

  create_table "chefs", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "chefs", ["email"], name: "index_chefs_on_email", unique: true, using: :btree
  add_index "chefs", ["reset_password_token"], name: "index_chefs_on_reset_password_token", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diet_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "foody_id",   null: false
    t.integer  "chef_id",    null: false
    t.integer  "recipe_id",  null: false
    t.string   "status",     null: false
    t.datetime "starts_at"
    t.float    "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "experiences", ["chef_id"], name: "index_experiences_on_chef_id", using: :btree
  add_index "experiences", ["foody_id"], name: "index_experiences_on_foody_id", using: :btree

  create_table "foodies", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "foodies", ["email"], name: "index_foodies_on_email", unique: true, using: :btree
  add_index "foodies", ["reset_password_token"], name: "index_foodies_on_reset_password_token", unique: true, using: :btree

  create_table "pricings", force: :cascade do |t|
    t.integer  "pricable_id"
    t.string   "pricable_type"
    t.integer  "base_price"
    t.integer  "max_price"
    t.integer  "surge_rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pricings", ["pricable_type", "pricable_id"], name: "index_pricings_on_pricable_type_and_pricable_id", using: :btree

  create_table "profile_diet_tags", force: :cascade do |t|
    t.integer  "profile_id",  null: false
    t.integer  "diet_tag_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profile_diet_tags", ["diet_tag_id"], name: "index_profile_diet_tags_on_diet_tag_id", using: :btree
  add_index "profile_diet_tags", ["profile_id"], name: "index_profile_diet_tags_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "user_type",  null: false
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.text     "bio"
    t.float    "base_price"
    t.float    "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_type", "user_id"], name: "index_profiles_on_user_type_and_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "specialty_id"
    t.string   "name",         null: false
    t.integer  "max_price",    null: false
    t.integer  "base_price",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipes", ["specialty_id"], name: "index_recipes_on_specialty_id", using: :btree

  create_table "recipes_diet_tags", force: :cascade do |t|
    t.integer  "diet_tag_id", null: false
    t.integer  "recipe_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipes_diet_tags", ["diet_tag_id"], name: "index_recipes_diet_tags_on_diet_tag_id", using: :btree
  add_index "recipes_diet_tags", ["recipe_id"], name: "index_recipes_diet_tags_on_recipe_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewer_id",   null: false
    t.string   "reviewer_type", null: false
    t.integer  "experience_id", null: false
    t.integer  "rating",        null: false
    t.text     "comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["experience_id"], name: "index_reviews_on_experience_id", using: :btree
  add_index "reviews", ["reviewer_type", "reviewer_id"], name: "index_reviews_on_reviewer_type_and_reviewer_id", using: :btree

  create_table "specialties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
