class CreateCourseKanjis < ActiveRecord::Migration[8.0]
  def change
    create_table :course_kanjis do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course that the kanji belongs to"
      t.references :kanji, null: false, foreign_key: true, comment: "Kanji that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the kanji is published or not"

      t.timestamps
    end
  end
end
