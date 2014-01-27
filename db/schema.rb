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

ActiveRecord::Schema.define(version: 20131219063020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.integer  "reps"
    t.float    "weight"
    t.float    "duration"
    t.float    "calories"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.integer  "upper_level_restriction"
    t.integer  "win_condition_id"
    t.integer  "difficulty_id"
    t.boolean  "is_private"
    t.boolean  "active",                  default: true
    t.integer  "creator_id"
    t.integer  "winner_id"
    t.integer  "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_activities", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_exercises", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_joins", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.integer  "total_experience", default: 0
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.string   "upper_level_restriction"
    t.integer  "win_condition_id"
    t.integer  "difficulty_id"
    t.boolean  "is_private"
    t.boolean  "active",                  default: true
    t.integer  "creator_id"
    t.integer  "winner_id"
    t.integer  "reward"
    t.boolean  "started",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.float    "experience_multiplier"
    t.boolean  "reps"
    t.boolean  "weight"
    t.boolean  "duration"
    t.boolean  "calories"
    t.boolean  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experience_sources", force: true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "experienceable_id"
    t.string   "experienceable_type"
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
    t.string   "authentication_token"
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
    t.integer  "experience_level",       default: 1
    t.integer  "experience_multiplier",  default: 500
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
