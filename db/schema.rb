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

ActiveRecord::Schema[8.0].define(version: 2025_03_31_120235) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "course_grammars", force: :cascade do |t|
    t.bigint "course_id", null: false, comment: "Course that the grammar belongs to"
    t.bigint "grammar_id", null: false, comment: "Grammar that belongs to the course"
    t.boolean "is_published", default: false, null: false, comment: "Whether the grammar is published or not"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_grammars_on_course_id"
    t.index ["grammar_id"], name: "index_course_grammars_on_grammar_id"
  end

  create_table "course_kanjis", force: :cascade do |t|
    t.bigint "course_id", null: false, comment: "Course that the kanji belongs to"
    t.bigint "kanji_id", null: false, comment: "Kanji that belongs to the course"
    t.boolean "is_published", default: false, null: false, comment: "Whether the kanji is published or not"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_kanjis_on_course_id"
    t.index ["kanji_id"], name: "index_course_kanjis_on_kanji_id"
  end

  create_table "course_levels", force: :cascade do |t|
    t.bigint "course_id", null: false, comment: "Course the level belongs to"
    t.integer "level", null: false, comment: "Level of the course"
    t.integer "point_type", default: 0, null: false, comment: "Type of the course point (e.g, 0: kanji, 1: vocabulary, 2: grammar)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "level", "point_type"], name: "index_course_levels_on_course_id_and_level_and_point_type", unique: true
    t.index ["course_id"], name: "index_course_levels_on_course_id"
  end

  create_table "course_translations", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", comment: "Title of the course (e.g. 'JLPT N5')"
    t.index ["course_id"], name: "index_course_translations_on_course_id"
    t.index ["locale"], name: "index_course_translations_on_locale"
  end

  create_table "course_vocabularies", force: :cascade do |t|
    t.bigint "course_id", null: false, comment: "Course that the vocabulary belongs to"
    t.bigint "vocabulary_id", null: false, comment: "Vocabulary that belongs to the course"
    t.boolean "is_published", default: false, null: false, comment: "Whether the vocabulary is published or not"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_vocabularies_on_course_id"
    t.index ["vocabulary_id"], name: "index_course_vocabularies_on_vocabulary_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "slug", comment: "Slug of the course (e.g, 'n5')"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "kanji_pairs", force: :cascade do |t|
    t.bigint "kanji_1_id", null: false, comment: "First kanji of the pair"
    t.bigint "kanji_2_id", null: false, comment: "Second kanji of the pair"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kanji_1_id"], name: "index_kanji_pairs_on_kanji_1_id"
    t.index ["kanji_2_id"], name: "index_kanji_pairs_on_kanji_2_id"
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

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "User the review belongs to"
    t.string "course_point_type", null: false
    t.bigint "course_point_id", null: false, comment: "Course point that the review belongs to"
    t.integer "memorization_status", default: 0, null: false, comment: "Memorization status of the user review"
    t.integer "number_of_total_reviews", default: 0, null: false, comment: "Number of reviews the user has made on the course point"
    t.integer "number_of_correct_reviews", default: 0, null: false, comment: "Number of correct reviews the user has made on the course point"
    t.datetime "next_review_at", comment: "Next review date for the user review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_point_type", "course_point_id"], name: "index_user_reviews_on_course_point"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
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

  create_table "vocabulary_pairs", force: :cascade do |t|
    t.bigint "vocabulary_1_id", null: false, comment: "First vocabulary of the pair"
    t.bigint "vocabulary_2_id", null: false, comment: "Second vocabulary of the pair"
    t.integer "type", default: 0, null: false, comment: "Type of the vocabulary pair (e.g, 0: synonym, 1: antonym)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vocabulary_1_id"], name: "index_vocabulary_pairs_on_vocabulary_1_id"
    t.index ["vocabulary_2_id"], name: "index_vocabulary_pairs_on_vocabulary_2_id"
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

  add_foreign_key "course_grammars", "courses"
  add_foreign_key "course_grammars", "grammars"
  add_foreign_key "course_kanjis", "courses"
  add_foreign_key "course_kanjis", "kanjis"
  add_foreign_key "course_levels", "courses"
  add_foreign_key "course_vocabularies", "courses"
  add_foreign_key "course_vocabularies", "vocabularies"
  add_foreign_key "kanji_pairs", "kanjis", column: "kanji_1_id"
  add_foreign_key "kanji_pairs", "kanjis", column: "kanji_2_id"
  add_foreign_key "user_reviews", "users"
  add_foreign_key "vocabulary_pairs", "vocabularies", column: "vocabulary_1_id"
  add_foreign_key "vocabulary_pairs", "vocabularies", column: "vocabulary_2_id"
end
