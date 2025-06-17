class CreateCourseLevelKanjis < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_kanjis do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course the level belongs to"

      t.integer :position, null: false, comment: "Position of the level in the course"
      t.integer :kanjis_count, null: false, default: 0, comment: "Number of kanjis in the level"

      t.timestamps
    end

    add_index :course_level_kanjis, %i[course_id position], unique: true

    reversible do |dir|
      dir.up do
        CourseLevelKanji.create_translation_table!(
          :title => { type: :string, comment: "Title of the kanji level" },
          :description => { type: :text, comment: "Description of the kanji level" }
        )
      end

      dir.down do
        CourseLevelKanji.drop_translation_table!
      end
    end
  end
end
