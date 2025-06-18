all_vocab = Vocabulary.all.to_a
all_kana = all_vocab.map(&:kana).uniq
all_meanings = all_vocab.flat_map(&:meanings).uniq

Vocabulary.find_each do |vocabulary|
  # Reading exercise
  wrong_kana = (all_kana - [vocabulary.kana]).sample(2)
  VocabularyExercise.find_or_create_by!(vocabulary: vocabulary, exercise_type: :reading, question: "#{vocabulary.title}") do |exercise|
    exercise.question_types = [:text]
    exercise.accepted_answers = [vocabulary.kana]
    exercise.wrong_answers = wrong_kana
    exercise.unlock_mastery_level = :beginner
  end

  # Meaning exercise
  wrong_meanings = (all_meanings - (vocabulary.meanings || [])).sample(2)
  VocabularyExercise.find_or_create_by!(vocabulary: vocabulary, exercise_type: :meaning, question: "#{vocabulary.title}") do |exercise|
    exercise.question_types = [:text]
    exercise.accepted_answers = [vocabulary.meanings]
    exercise.wrong_answers = wrong_meanings
    exercise.unlock_mastery_level = :beginner
  end
end