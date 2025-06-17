class CreateCourseLevelVocabularyLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :course_level_vocabulary_links do |t|
      t.references :course_level_vocabulary, null: false, foreign_key: true, comment: "Course level that the vocabulary belongs to"
      t.references :vocabulary, null: false, foreign_key: true, comment: "Vocabulary that belongs to the course"
      t.boolean :is_published, null: false, default: false, comment: "Whether the vocabulary is published or not"

      t.timestamps
    end

    add_index :course_level_vocabulary_links, [:course_level_vocabulary_id, :vocabulary_id], unique: true
  end
end
