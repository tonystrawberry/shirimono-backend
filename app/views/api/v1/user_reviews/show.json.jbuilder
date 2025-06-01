json.user_review do
  json.id @user_review.id
  json.memorization_status @user_review.memorization_status
  json.number_of_total_reviews @user_review.number_of_total_reviews
  json.number_of_correct_reviews @user_review.number_of_correct_reviews
  json.next_review_at @user_review.next_review_at
  json.course_point_type @user_review.course_point_type
  json.course_point_id @user_review.course_point_id
  json.point_exercise_type @user_review.point_exercise_type
  json.point_exercise_id @user_review.point_exercise_id
  json.created_at @user_review.created_at
  json.updated_at @user_review.updated_at

  json.user_course do
    json.id @user_review.user_course.id
    json.course do
      json.id @user_review.user_course.course.id
      json.slug @user_review.user_course.course.slug
      json.title @user_review.user_course.course.title
    end
  end

  json.course_point do
    json.id @user_review.course_point_id
    json.type @user_review.course_point_type

    case @user_review.course_point_type
    when "CourseLevelKanji"
      json.title @user_review.course_point.kanji.title
      json.kunyomi_readings @user_review.course_point.kunyomi_readings
      json.onyomi_readings @user_review.course_point.onyomi_readings
    when "CourseLevelVocabulary"
      json.title @user_review.course_point.vocabulary.title
      json.kana @user_review.course_point.vocabulary.kana
      json.types @user_review.course_point.vocabulary.types
    when "CourseLevelGrammar"
      json.title @user_review.course_point.grammar.title
      json.meaning @user_review.course_point.grammar.meaning
      json.grammar_type @user_review.course_point.grammar.grammar_type
    end
  end

  json.point_exercise do
    json.id @user_review.point_exercise_id
    json.type @user_review.point_exercise_type
  end
end