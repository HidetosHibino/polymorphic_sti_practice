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

ActiveRecord::Schema[7.0].define(version: 2023_03_17_131840) do
  create_table "notes", force: :cascade do |t|
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.index ["author_id"], name: "index_notes_on_author_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string "ratable_type", null: false
    t.integer "ratable_id", null: false
    t.integer "voter_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratable_id", "ratable_type", "type", "voter_id"], name: "index_rates_on_ratable_id_and_ratable_type_and_type_and_voter_id", unique: true
    t.index ["ratable_type", "ratable_id"], name: "index_rates_on_ratable"
    t.index ["voter_id"], name: "index_rates_on_voter_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "word_id", null: false
    t.string "type"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "similar_id"
    t.index ["similar_id"], name: "index_reactions_on_similar_id"
    t.index ["word_id"], name: "index_reactions_on_word_id"
  end

  create_table "usefuls", force: :cascade do |t|
    t.integer "sample_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_id"], name: "index_usefuls_on_sample_id"
    t.index ["user_id"], name: "index_usefuls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notes", "users", column: "author_id"
  add_foreign_key "rates", "users", column: "voter_id"
  add_foreign_key "reactions", "words"
  add_foreign_key "reactions", "words", column: "similar_id"
  add_foreign_key "usefuls", "reactions", column: "sample_id"
  add_foreign_key "usefuls", "users"
end
