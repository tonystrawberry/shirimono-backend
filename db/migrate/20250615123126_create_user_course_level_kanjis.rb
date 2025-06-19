class CreateUserCourseLevelKanjis < ActiveRecord::Migration[8.0]
  def change
    create_table :user_course_level_kanjis do |t|
      t.references :user_course, null: false, foreign_key: true, comment: "UserCourse that the kanji belongs to"
      t.references :course_level_kanji, null: false, foreign_key: true, comment: "CourseLevelKanji that the kanji belongs to"

      t.integer :status, null: false, default: 0, comment: "Status of the user course level kanji (e.g. not_started, partially_in_progress, all_in_progress, completed)"
      t.integer :user_course_level_kanji_links_count, null: false, default: 0, comment: "Number of user reviews for the user course level kanji"

      t.timestamps
    end

    add_index :user_course_level_kanjis, [:user_course_id, :course_level_kanji_id], unique: true, name: "index_user_course_level_kanjis_unique"
  end
end
