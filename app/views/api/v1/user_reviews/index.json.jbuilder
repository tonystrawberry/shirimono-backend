json.user_review_kanjis @user_review_kanjis do |user_review_kanji|
  json.id user_review_kanji.id
  json.memorization_status user_review_kanji.memorization_status

  json.number_of_total_reviews user_review_kanji.number_of_total_reviews
  json.number_of_correct_reviews user_review_kanji.number_of_correct_reviews
  json.next_review_at user_review_kanji.next_review_at

  json.kanji_id user_review_kanji.kanji_exercise.kanji.id
end

json.user_review_vocabularies @user_review_vocabularies do |user_review_vocabulary|
  json.id user_review_vocabulary.id
  json.memorization_status user_review_vocabulary.memorization_status

  json.number_of_total_reviews user_review_vocabulary.number_of_total_reviews
  json.number_of_correct_reviews user_review_vocabulary.number_of_correct_reviews
  json.next_review_at user_review_vocabulary.next_review_at

  json.vocabulary_id user_review_vocabulary.vocabulary_exercise.vocabulary.id
end

json.user_review_grammars @user_review_grammars do |user_review_grammar|
  json.id user_review_grammar.id
  json.memorization_status user_review_grammar.memorization_status

  json.number_of_total_reviews user_review_grammar.number_of_total_reviews
  json.number_of_correct_reviews user_review_grammar.number_of_correct_reviews
  json.next_review_at user_review_grammar.next_review_at

  json.grammar_id user_review_grammar.grammar_exercise.grammar.id
end
