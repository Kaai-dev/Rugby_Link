# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_28_201638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "id_numbers", force: :cascade do |t|
    t.string "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_id_numbers_on_player_id"
  end

  create_table "next_of_kins", force: :cascade do |t|
    t.string "name"
    t.string "cellphone_number"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_next_of_kins_on_player_id"
  end

  create_table "next_of_kinships", force: :cascade do |t|
    t.bigint "next_of_kin_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_of_kin_id"], name: "index_next_of_kinships_on_next_of_kin_id"
    t.index ["player_id"], name: "index_next_of_kinships_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "nickname"
    t.string "fullname"
    t.string "cellphone_number"
    t.integer "player_position"
    t.string "medical_conditions"
    t.boolean "has_id"
    t.boolean "portrait_photo"
    t.string "medical_aid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_number"
    t.string "encrypted_id"
  end

  add_foreign_key "id_numbers", "players"
  add_foreign_key "next_of_kins", "players"
  add_foreign_key "next_of_kinships", "next_of_kins"
  add_foreign_key "next_of_kinships", "players"
end
