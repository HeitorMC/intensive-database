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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_144415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id", null: false
    t.bigint "sender_id", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["sender_id"], name: "index_comments_on_sender_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.string "kind"
    t.bigint "person_id", null: false
    t.string "reactionable_type", null: false
    t.bigint "reactionable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_reactions_on_person_id"
    t.index ["reactionable_type", "reactionable_id"], name: "index_reactions_on_reactionable"
  end

  add_foreign_key "articles", "people", column: "author_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "people", column: "sender_id"
  add_foreign_key "reactions", "people"
end
