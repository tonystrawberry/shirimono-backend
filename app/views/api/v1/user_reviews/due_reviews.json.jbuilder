json.user_review_kanjis @user_review_kanjis do |user_review_kanji|
  json.id user_review_kanji.id
  json.memorization_status user_review_kanji.memorization_status

  json.number_of_total_reviews user_review_kanji.number_of_total_reviews
  json.number_of_correct_reviews user_review_kanji.number_of_correct_reviews
  json.next_review_at user_review_kanji.next_review_at

  json.kanji_exercise do
    json.id user_review_kanji.kanji_exercise.id
    json.question user_review_kanji.kanji_exercise.question
    json.exercise_type user_review_kanji.kanji_exercise.exercise_type
    json.question_types user_review_kanji.kanji_exercise.question_types
    json.accepted_answers user_review_kanji.kanji_exercise.accepted_answers
    json.wrong_answers user_review_kanji.kanji_exercise.wrong_answers
  end

  json.course do
    json.id user_review_kanji.user_course_level_kanji_link.user_course_level_kanji.course_level_kanji.course.id
    json.title user_review_kanji.user_course_level_kanji_link.user_course_level_kanji.course_level_kanji.course.title
    json.slug user_review_kanji.user_course_level_kanji_link.user_course_level_kanji.course_level_kanji.course.slug
  end

  json.course_level_kanji do
    json.id user_review_kanji.user_course_level_kanji_link.user_course_level_kanji.course_level_kanji.id
    json.position user_review_kanji.user_course_level_kanji_link.user_course_level_kanji.course_level_kanji.position
  end
end

json.user_review_vocabularies @user_review_vocabularies do |user_review_vocabulary|
  json.id user_review_vocabulary.id
  json.memorization_status user_review_vocabulary.memorization_status

  json.number_of_total_reviews user_review_vocabulary.number_of_total_reviews
  json.number_of_correct_reviews user_review_vocabulary.number_of_correct_reviews
  json.next_review_at user_review_vocabulary.next_review_at

  json.vocabulary_exercise do
    json.id user_review_vocabulary.vocabulary_exercise.id
    json.question user_review_vocabulary.vocabulary_exercise.question
    json.exercise_type user_review_vocabulary.vocabulary_exercise.exercise_type
    json.question_types user_review_vocabulary.vocabulary_exercise.question_types
    json.accepted_answers user_review_vocabulary.vocabulary_exercise.accepted_answers
    json.wrong_answers user_review_vocabulary.vocabulary_exercise.wrong_answers
  end

  json.course do
    json.id user_review_vocabulary.user_course_level_vocabulary_link.user_course_level_vocabulary.course_level_vocabulary.course.id
    json.title user_review_vocabulary.user_course_level_vocabulary_link.user_course_level_vocabulary.course_level_vocabulary.course.title
    json.slug user_review_vocabulary.user_course_level_vocabulary_link.user_course_level_vocabulary.course_level_vocabulary.course.slug
  end

  json.course_level_vocabulary do
    json.id user_review_vocabulary.user_course_level_vocabulary_link.user_course_level_vocabulary.course_level_vocabulary.id
    json.position user_review_vocabulary.user_course_level_vocabulary_link.user_course_level_vocabulary.course_level_vocabulary.position
  end
end

json.user_review_grammars @user_review_grammars do |user_review_grammar|
  json.id user_review_grammar.id
  json.memorization_status user_review_grammar.memorization_status

  json.number_of_total_reviews user_review_grammar.number_of_total_reviews
  json.number_of_correct_reviews user_review_grammar.number_of_correct_reviews
  json.next_review_at user_review_grammar.next_review_at

  json.grammar_exercise do
    json.id user_review_grammar.grammar_exercise.id
    json.question user_review_grammar.grammar_exercise.question
    json.exercise_type user_review_grammar.grammar_exercise.exercise_type
    json.question_types user_review_grammar.grammar_exercise.question_types
    json.accepted_answers user_review_grammar.grammar_exercise.accepted_answers
    json.wrong_answers user_review_grammar.grammar_exercise.wrong_answers
  end

  json.course do
    json.id user_review_grammar.user_course_level_grammar_link.user_course_level_grammar.course_level_grammar.course.id
    json.title user_review_grammar.user_course_level_grammar_link.user_course_level_grammar.course_level_grammar.course.title
    json.slug user_review_grammar.user_course_level_grammar_link.user_course_level_grammar.course_level_grammar.course.slug
  end

  json.course_level_grammar do
    json.id user_review_grammar.user_course_level_grammar_link.user_course_level_grammar.course_level_grammar.id
    json.position user_review_grammar.user_course_level_grammar_link.user_course_level_grammar.course_level_grammar.position
  end
end
