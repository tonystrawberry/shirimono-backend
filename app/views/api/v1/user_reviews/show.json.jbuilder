json.user_review do
  json.id @user_review.id
  json.memorization_status @user_review.memorization_status
  json.number_of_total_reviews @user_review.number_of_total_reviews
  json.number_of_correct_reviews @user_review.number_of_correct_reviews
  json.next_review_at @user_review.next_review_at
end