class CreateUserCourseLevelVocabularyLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :user_course_level_vocabulary_links do |t|
      t.references :user_course_level_vocabulary, null: false, foreign_key: true, comment: "UserCourseLevelVocabulary that the vocabulary belongs to"
      t.references :course_level_vocabulary_link, null: false, foreign_key: true, comment: "CourseLevelVocabulary that the vocabulary belongs to"

      t.integer :status, null: false, default: 0, comment: "Status of the user course level vocabulary (e.g. not_started, partially_in_progress, all_in_progress, completed)"
      t.integer :user_review_vocabularies_count, null: false, default: 0, comment: "Number of user reviews for the user course level vocabulary"

      t.timestamps
    end

    add_index :user_course_level_vocabulary_links, [:user_course_level_vocabulary_id, :course_level_vocabulary_link_id], unique: true, name: "index_user_course_level_vocabulary_links_unique"
  end
end
