class CreateUserReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :user_reviews do |t|
      t.references :user, null: false, foreign_key: true, comment: "User the review belongs to"
      t.references :course_point, null: false, polymorphic: true, comment: "Course point that the review belongs to"

      t.integer :memorization_status, null: false, default: 0, comment: "Memorization status of the user review"
      t.integer :number_of_total_reviews, null: false, default: 0, comment: "Number of reviews the user has made on the course point"
      t.integer :number_of_correct_reviews, null: false, default: 0, comment: "Number of correct reviews the user has made on the course point"
      t.datetime :next_review_at, comment: "Next review date for the user review"

      t.timestamps
    end
  end
end
