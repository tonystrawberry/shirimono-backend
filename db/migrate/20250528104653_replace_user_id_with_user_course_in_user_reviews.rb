class ReplaceUserIdWithUserCourseInUserReviews < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :user_reviews, :users
    remove_reference :user_reviews, :user

    add_reference :user_reviews, :user_course, null: false, foreign_key: true, comment: "UserCourse that the review belongs to"
  end
end
