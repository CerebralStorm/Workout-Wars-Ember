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

ActiveRecord::Schema.define(version: 20140406195623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenge_attempts", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.float    "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_exercise_id"
  end

  add_index "challenge_attempts", ["user_id", "challenge_id"], name: "index_challenge_attempts_on_user_id_and_challenge_id", using: :btree

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "challenge_win_condition_id"
    t.integer  "difficulty_id"
    t.integer  "exercise_id"
    t.integer  "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_exercises", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competition_exercises", ["exercise_id", "competition_id"], name: "index_competition_exercises_on_exercise_id_and_competition_id", using: :btree

  create_table "competition_joins", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.integer  "total",          default: 0
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competition_joins", ["user_id", "competition_id"], name: "index_competition_joins_on_user_id_and_competition_id", using: :btree

  create_table "competition_user_exercises", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_exercise_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competition_user_exercises", ["user_id", "user_exercise_id", "competition_id"], name: "competition_activities_index", using: :btree

  create_table "competition_win_conditions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "multi_exercise"
  end

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "max_participants"
    t.integer  "lower_level_restriction"
    t.string   "upper_level_restriction"
    t.integer  "competition_win_condition_id"
    t.integer  "win_condition_id"
    t.string   "description"
    t.integer  "difficulty_id"
    t.boolean  "is_private"
    t.boolean  "finished",                     default: false
    t.integer  "user_id"
    t.integer  "winner_id"
    t.integer  "reward"
    t.boolean  "started",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.float    "experience_multiplier"
    t.integer  "metric_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "experience_sources", force: true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "experienceable_id"
    t.string   "experienceable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experience_sources", ["experienceable_id", "experienceable_type", "user_id"], name: "experience_sources_index", using: :btree

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", force: true do |t|
    t.integer  "feedable_id"
    t.string   "feedable_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", force: true do |t|
    t.string   "name"
    t.string   "measurement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "user_exercises", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_exercises", ["exercise_id", "user_id"], name: "index_user_exercises_on_exercise_id_and_user_id", using: :btree

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
    t.boolean  "agree_to_terms"
    t.string   "avatar_url"
    t.string   "device_tokens",                                       array: true
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
