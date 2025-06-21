json.user_review_kanjis @user_review_kanjis do |user_review_kanji|
  json.id user_review_kanji.id
  json.memorization_status user_review_kanji.memorization_status

  json.number_of_total_reviews user_review_kanji.number_of_total_reviews
  json.number_of_correct_reviews user_review_kanji.number_of_correct_reviews
  json.next_review_at user_review_kanji.next_review_at

  json.kanji_id user_review_kanji.kanji_exercise.kanji.id
  json.kanji_exercise_id user_review_kanji.kanji_exercise.id
  json.user_course_level_kanji_link_id user_review_kanji.user_course_level_kanji_link.id

  json.course do
    json.extract! user_review_kanji.user_course_level_kanji_link.course_level_kanji.course, :id, :title, :slug
  end

  json.course_level_kanji do
    json.extract! user_review_kanji.user_course_level_kanji_link.course_level_kanji, :id, :title, :position
  end
end

json.user_review_vocabularies @user_review_vocabularies do |user_review_vocabulary|
  json.id user_review_vocabulary.id
  json.memorization_status user_review_vocabulary.memorization_status

  json.number_of_total_reviews user_review_vocabulary.number_of_total_reviews
  json.number_of_correct_reviews user_review_vocabulary.number_of_correct_reviews
  json.next_review_at user_review_vocabulary.next_review_at

  json.vocabulary_id user_review_vocabulary.vocabulary_exercise.vocabulary.id
  json.vocabulary_exercise_id user_review_vocabulary.vocabulary_exercise.id
  json.user_course_level_vocabulary_link_id user_review_vocabulary.user_course_level_vocabulary_link.id

  json.course do
    json.extract! user_review_vocabulary.user_course_level_vocabulary_link.course_level_vocabulary.course, :id, :title, :slug
  end

  json.course_level_vocabulary do
    json.extract! user_review_vocabulary.user_course_level_vocabulary_link.course_level_vocabulary, :id, :title, :position
  end
end

json.user_review_grammars @user_review_grammars do |user_review_grammar|
  json.id user_review_grammar.id
  json.memorization_status user_review_grammar.memorization_status

  json.number_of_total_reviews user_review_grammar.number_of_total_reviews
  json.number_of_correct_reviews user_review_grammar.number_of_correct_reviews
  json.next_review_at user_review_grammar.next_review_at

  json.grammar_id user_review_grammar.grammar_exercise.grammar.id
  json.grammar_exercise_id user_review_grammar.grammar_exercise.id
  json.user_course_level_grammar_link_id user_review_grammar.user_course_level_grammar_link.id

  json.course do
    json.extract! user_review_grammar.user_course_level_grammar_link.course_level_grammar.course, :id, :title, :slug
  end

  json.course_level_grammar do
    json.extract! user_review_grammar.user_course_level_grammar_link.course_level_grammar, :id, :title, :position
  end
end
