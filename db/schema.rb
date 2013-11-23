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

ActiveRecord::Schema.define(version: 20131123170432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.string   "upper_level_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction", default: 0
    t.integer  "upper_level_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_challenges", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.string   "upper_level_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_competitions", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.string   "upper_level_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "address"
    t.string   "phone"
    t.float    "weight"
    t.float    "height"
    t.integer  "age"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "level",                  default: 1
    t.integer  "xp_level",               default: 1
    t.integer  "xp_multiplier",          default: 500
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
