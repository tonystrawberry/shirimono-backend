class CreateUserReviewGrammars < ActiveRecord::Migration[8.0]
  def change
    create_table :user_review_grammars do |t|
      t.references :user_course_level, null: false, foreign_key: true, comment: "UserCourseLevel that the review belongs to"
      t.references :course_level_grammar, null: false, foreign_key: true, comment: "CourseLevelGrammar that the review belongs to"
      t.references :grammar_exercise, null: false, foreign_key: true, comment: "GrammarExercise that the review belongs to"
      t.references :grammar, null: false, foreign_key: true, comment: "Grammar that the review belongs to"

      t.integer :memorization_status, null: false, default: 0, comment: "Memorization status of the user review"
      t.integer :number_of_total_reviews, null: false, default: 0, comment: "Number of reviews the user has made on the course point"
      t.integer :number_of_correct_reviews, null: false, default: 0, comment: "Number of correct reviews the user has made on the course point"
      t.datetime :next_review_at, comment: "Next review date for the user review"

      t.timestamps
    end
  end
end
