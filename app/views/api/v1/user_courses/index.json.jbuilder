json.user_courses @user_courses do |user_course|
  json.id user_course.id
  json.kanji_user_reviews_count user_course.kanji_user_reviews_count
  json.vocabulary_user_reviews_count user_course.vocabulary_user_reviews_count
  json.grammar_user_reviews_count user_course.grammar_user_reviews_count

  json.course do
    json.id user_course.course.id
    json.title user_course.course.title
    json.slug user_course.course.slug
  end
end