class CreateUserCourseLevelGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :user_course_level_grammars do |t|
      t.references :user_course, null: false, foreign_key: true, comment: "UserCourse that the grammar belongs to"
      t.references :course_level_grammar, null: false, foreign_key: true, comment: "CourseLevelGrammar that the grammar belongs to"

      t.integer :status, null: false, default: 0, comment: "Status of the user course level grammar (e.g. not_started, partially_in_progress, all_in_progress, completed)"
      t.integer :user_reviews_grammars_count, null: false, default: 0, comment: "Number of user reviews for the user course level grammar"

      t.timestamps
    end
  end
end
