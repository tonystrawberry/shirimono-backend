# Create exercises for each kanji
puts "Creating kanji exercises..."

Kanji.find_each do |kanji|
  next if kanji.kanji_exercises.any?

  # Reading exercise
  KanjiExercise.find_or_create_by!(
    kanji: kanji,
    question: kanji.title,
    exercise_type: :reading,
    question_types: [:multi],
    accepted_answers: kanji.kunyomi_readings + kanji.onyomi_readings,
    wrong_answers: (Kanji.where.not(id: kanji.id).pluck(:kunyomi_readings, :onyomi_readings).flatten - kanji.kunyomi_readings - kanji.onyomi_readings).sample(4),
    unlock_mastery_level: :beginner
  )

  # Meaning exercise
  KanjiExercise.find_or_create_by!(
    kanji: kanji,
    question: kanji.title,
    exercise_type: :meaning,
    question_types: [:multi],
    accepted_answers: kanji.meanings,
    wrong_answers: (Kanji.where.not(id: kanji.id).pluck(:meanings).flatten - kanji.meanings).sample(4),
    unlock_mastery_level: :beginner
  )
end

puts "Created #{KanjiExercise.count} kanji exercises"