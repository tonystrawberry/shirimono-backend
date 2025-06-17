class CreateCourseLevelVocabularies < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_vocabularies do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course the level belongs to"

      t.integer :position, null: false, comment: "Position of the level in the course"
      t.integer :vocabularies_count, null: false, default: 0, comment: "Number of vocabularies in the level"

      t.timestamps
    end

    add_index :course_level_vocabularies, %i[course_id position], unique: true

    reversible do |dir|
      dir.up do
        CourseLevelVocabulary.create_translation_table!(
          :title => { type: :string, comment: "Title of the vocabulary level" },
          :description => { type: :text, comment: "Description of the vocabulary level" }
        )
      end

      dir.down do
        CourseLevelVocabulary.drop_translation_table!
      end
    end
  end
end
