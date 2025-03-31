class CreateCourseVocabularies < ActiveRecord::Migration[8.0]
  def change
    create_table :course_vocabularies do |t|
      t.references :course, null: false, foreign_key: true, comment: "Course that the vocabulary belongs to"
      t.references :vocabulary, null: false, foreign_key: true, comment: "Vocabulary that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the vocabulary is published or not"

      t.timestamps
    end
  end
end
