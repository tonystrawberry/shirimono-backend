class CreateCourseLevelKanjis < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_kanjis do |t|
      t.references :course_level, null: false, foreign_key: true, comment: "Course level that the kanji belongs to"
      t.references :kanji, null: false, foreign_key: true, comment: "Kanji that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the kanji is published or not"

      t.timestamps
    end

    add_index :course_level_kanjis, [:course_level_id, :kanji_id], unique: true
  end
end
