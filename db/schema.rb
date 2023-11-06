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

ActiveRecord::Schema[7.0].define(version: 2023_11_06_084953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.uuid "player_id", null: false
    t.string "reason"
    t.boolean "absent_game_day"
    t.boolean "absent_train_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "next_of_kins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "player_id", null: false
    t.string "name"
    t.string "cellphone_number"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nickname"
    t.string "fullname"
    t.string "encrypted_cellphone_number"
    t.integer "player_position", default: [], array: true
    t.text "medical_conditions"
    t.boolean "has_id"
    t.string "portrait_photo"
    t.string "medical_aid"
    t.string "encrypted_id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_id_number_iv"
    t.string "encrypted_cellphone_number_iv"
  end

  add_foreign_key "absences", "players"
  add_foreign_key "next_of_kins", "players"
end
