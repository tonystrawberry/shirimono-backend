class AddPointExerciseToUserReviews < ActiveRecord::Migration[8.0]
  def change
    add_reference :user_reviews, :point_exercise, polymorphic: true, null: true
  end
end
