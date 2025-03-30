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

ActiveRecord::Schema[8.0].define(version: 2025_03_30_135607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "grammar_translations", force: :cascade do |t|
    t.bigint "grammar_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meanings", default: [], null: false, comment: "Meanings of the grammar", array: true
    t.index ["grammar_id"], name: "index_grammar_translations_on_grammar_id"
    t.index ["locale"], name: "index_grammar_translations_on_locale"
  end

  create_table "grammars", force: :cascade do |t|
    t.string "title", comment: "Title of the grammar (e.g, 'ために')"
    t.string "slug", comment: "Slug of the grammar (e.g, 'ために-tameni')"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_grammars_on_slug", unique: true
    t.index ["title"], name: "index_grammars_on_title", unique: true
  end

  create_table "kanji_translations", force: :cascade do |t|
    t.bigint "kanji_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meanings", default: [], null: false, comment: "Meanings of the kanji", array: true
    t.index ["kanji_id"], name: "index_kanji_translations_on_kanji_id"
    t.index ["locale"], name: "index_kanji_translations_on_locale"
  end

  create_table "kanjis", force: :cascade do |t|
    t.string "title", comment: "Title of the kanji (e.g, '愛')"
    t.string "slug", comment: "Slug of the kanji (e.g, '愛-ai')"
    t.string "kunyomi_readings", default: [], comment: "Kunyomi readings of the kanji (e.g, ['あい'])", array: true
    t.string "onyomi_readings", default: [], comment: "Onyomi readings of the kanji (e.g, ['あい'])", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_kanjis_on_slug", unique: true
    t.index ["title"], name: "index_kanjis_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "title", comment: "Title of the vocabulary (e.g, '愛')"
    t.string "slug", comment: "Slug of the vocabulary (e.g, '愛-ai')"
    t.string "kana", comment: "Kana of the vocabulary (e.g, 'あい')"
    t.string "types", default: [], comment: "Types of the vocabulary (e.g, ['t_noun'])", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_vocabularies_on_slug", unique: true
    t.index ["title"], name: "index_vocabularies_on_title", unique: true
  end

  create_table "vocabulary_translations", force: :cascade do |t|
    t.bigint "vocabulary_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meanings", default: [], null: false, comment: "Meanings of the vocabulary", array: true
    t.index ["locale"], name: "index_vocabulary_translations_on_locale"
    t.index ["vocabulary_id"], name: "index_vocabulary_translations_on_vocabulary_id"
  end
end
