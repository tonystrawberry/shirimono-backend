class CreateUserCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_courses do |t|
      t.references :user, null: false, foreign_key: true, comment: 'User that the course belongs to'
      t.references :course, null: false, foreign_key: true, comment: 'Course that the user belongs to'

      t.integer :user_review_kanjis_count, default: 0, null: false, comment: 'Number of kanji user reviews'
      t.integer :user_review_vocabularies_count, default: 0, null: false, comment: 'Number of vocabulary user reviews'
      t.integer :user_review_grammars_count, default: 0, null: false, comment: 'Number of grammar user reviews'

      t.timestamps
    end
  end
end
