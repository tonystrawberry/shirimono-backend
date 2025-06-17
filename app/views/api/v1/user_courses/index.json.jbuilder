json.user_courses @user_courses do |user_course|
  json.id user_course.id
  json.kanji_user_reviews_count user_course.kanjis_count
  json.vocabulary_user_reviews_count user_course.vocabularies_count
  json.grammar_user_reviews_count user_course.grammars_count

  json.course_id user_course.course.id
end