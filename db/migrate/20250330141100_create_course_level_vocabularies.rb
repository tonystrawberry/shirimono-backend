class CreateCourseLevelVocabularies < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_vocabularies do |t|
      t.references :course_level, null: false, foreign_key: true, comment: "Course level that the vocabulary belongs to"
      t.references :vocabulary, null: false, foreign_key: true, comment: "Vocabulary that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the vocabulary is published or not"

      t.timestamps
    end

    add_index :course_level_vocabularies, [:course_level_id, :vocabulary_id], unique: true
  end
end
