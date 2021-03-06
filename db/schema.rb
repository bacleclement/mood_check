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

ActiveRecord::Schema.define(version: 20180422151215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.integer "level"
    t.integer "age"
    t.string "gender"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "negative_proof"
    t.text "positive_proof"
    t.text "alternative"
    t.text "worst_case"
    t.text "best_case"
    t.text "realistic"
    t.string "thought_effect"
    t.text "friend"
    t.string "new_trust"
    t.string "new_emotion"
    t.string "new_emotion_level"
    t.bigint "thought_check_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thought_check_id"], name: "index_questions_on_thought_check_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "thought_check_id"
    t.string "type"
    t.string "title"
    t.string "hour"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "updated_at", null: false
    t.index ["thought_check_id"], name: "index_tasks_on_thought_check_id"
  end

  create_table "thought_checks", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "situation"
    t.text "thought"
    t.string "emotion"
    t.string "physiological"
    t.text "negative_proof"
    t.text "positive_proof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "about"
    t.string "trust"
    t.string "emotion_level"
    t.index ["profile_id"], name: "index_thought_checks_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "questions", "thought_checks"
  add_foreign_key "tasks", "thought_checks"
  add_foreign_key "thought_checks", "profiles"
end
