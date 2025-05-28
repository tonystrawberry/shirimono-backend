json.user_reviews @user_reviews do |review|
  json.id review.id
  json.memorization_status review.memorization_status
  json.number_of_total_reviews review.number_of_total_reviews
  json.number_of_correct_reviews review.number_of_correct_reviews
  json.next_review_at review.next_review_at

  json.course do
    json.id review.user_course.course.id
    json.title ["JLPT N4", "JLPT N5"].sample
  end

  json.course_point do
    json.id review.course_point_id
    json.type review.course_point_type
  end
end