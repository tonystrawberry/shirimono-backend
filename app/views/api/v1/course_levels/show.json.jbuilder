json.course_level do
  json.id @course_level.id
  json.title @course_level.title
  json.description @course_level.description
  json.position @course_level.position
  json.point_type @point_type

  case @point_type
  when :kanji
    json.kanjis @points.select { |kanji| kanji.kanji_exercises.present? } do |kanji|
      json.id kanji.id
      json.title kanji.title
      json.meanings kanji.meanings
      json.kunyomi_readings kanji.kunyomi_readings
      json.onyomi_readings kanji.onyomi_readings

      json.exercises kanji.kanji_exercises do |exercise|
        json.id exercise.id
        json.question exercise.question
        json.exercise_type exercise.exercise_type
        json.question_types exercise.question_types
        json.accepted_answers exercise.accepted_answers
        json.wrong_answers exercise.wrong_answers
      end

      json.related_kanjis kanji.related_kanjis do |related_kanji|
        json.id related_kanji.id
        json.title related_kanji.title
        json.meanings related_kanji.meanings
      end

      json.example_sentences kanji.example_sentences do |sentence|
        json.id sentence.id
        json.sentence sentence.sentence
        json.sentence_html sentence.sentence_html
        json.translation sentence.translation
      end
    end
  when :vocabulary
    json.vocabularies @points.select { |vocabulary| vocabulary.vocabulary_exercises.present? } do |vocabulary|
      json.id vocabulary.id
      json.title vocabulary.title
      json.kana vocabulary.kana
      json.meanings vocabulary.meanings
      json.types vocabulary.types

      json.exercises vocabulary.vocabulary_exercises do |exercise|
        json.id exercise.id
        json.question exercise.question
        json.exercise_type exercise.exercise_type
        json.question_types exercise.question_types
        json.accepted_answers exercise.accepted_answers
        json.wrong_answers exercise.wrong_answers
      end

      json.synonyms vocabulary.synonyms do |synonym|
        json.id synonym.id
        json.title synonym.title
        json.kana synonym.kana
        json.meanings synonym.meanings
      end

      json.antonyms vocabulary.antonyms do |antonym|
        json.id antonym.id
        json.title antonym.title
        json.kana antonym.kana
        json.meanings antonym.meanings
      end

      json.example_sentences vocabulary.example_sentences do |sentence|
        json.id sentence.id
        json.sentence sentence.sentence
        json.sentence_html sentence.sentence_html
        json.translation sentence.translation
      end
    end
  when :grammar
    json.grammars @points.select { |grammar| grammar.grammar_exercises.present? } do |grammar|
      json.id grammar.id
      json.title grammar.title
      json.meanings grammar.meanings

      json.exercises grammar.grammar_exercises do |exercise|
        json.id exercise.id
        json.question exercise.question
        json.exercise_type exercise.exercise_type
        json.question_types exercise.question_types
        json.accepted_answers exercise.accepted_answers
        json.wrong_answers exercise.wrong_answers
      end

      json.example_sentences grammar.example_sentences do |sentence|
        json.id sentence.id
        json.sentence sentence.sentence
        json.sentence_html sentence.sentence_html
        json.translation sentence.translation
      end
    end
  end
end