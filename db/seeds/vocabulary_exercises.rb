# Create exercises for each vocabulary
puts "Creating vocabulary exercises..."

Vocabulary.find_each do |vocabulary|
  # Reading exercise
  VocabularyExercise.find_or_create_by!(
    vocabulary: vocabulary,
    question: vocabulary.title,
    exercise_type: :reading,
    question_types: [:multi],
    accepted_answers: [vocabulary.kana],
    wrong_answers: (Vocabulary.where.not(id: vocabulary.id).pluck(:kana).flatten - [vocabulary.kana]).sample(4),
    unlock_mastery_level: :beginner
  )

  # Meaning exercise
  VocabularyExercise.find_or_create_by!(
    vocabulary: vocabulary,
    question: vocabulary.title,
    exercise_type: :meaning,
    question_types: [:multi],
    accepted_answers: vocabulary.meanings,
    wrong_answers: (Vocabulary.where.not(id: vocabulary.id).pluck(:meanings).flatten - vocabulary.meanings).sample(4),
    unlock_mastery_level: :beginner
  )
end

puts "Created #{VocabularyExercise.count} vocabulary exercises"