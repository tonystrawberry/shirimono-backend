json.user_review do
  json.id @user_review.id
  json.memorization_status @user_review.memorization_status
  json.number_of_total_reviews @user_review.number_of_total_reviews
  json.number_of_correct_reviews @user_review.number_of_correct_reviews
  json.next_review_at @user_review.next_review_at

  json.course_point do
    json.id @user_review.course_point_id
    json.type @user_review.course_point_type
    json.title @user_review.course_point.title
    json.meanings @user_review.course_point.meanings

    case @user_review.course_point_type
    when "CourseKanji"
      json.kunyomi_readings @user_review.course_point.kunyomi_readings
      json.onyomi_readings @user_review.course_point.onyomi_readings
    when "CourseVocabulary"
      json.kana @user_review.course_point.kana
      json.types @user_review.course_point.types
    end
  end
end