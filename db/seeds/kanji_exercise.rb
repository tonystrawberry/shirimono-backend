# db/seeds/kanji_exercise.rb
all_kanji = Kanji.all.to_a
all_kunyomi = all_kanji.flat_map(&:kunyomi_readings).uniq
all_meanings = all_kanji.flat_map(&:meanings).uniq

Kanji.find_each do |kanji|
  # Reading exercise
  wrong_readings = (all_kunyomi - (kanji.kunyomi_readings || [])).sample(2)
  KanjiExercise.find_or_create_by!(kanji: kanji, exercise_type: :reading, question: "#{kanji.title}") do |exercise|
    exercise.question_types = [:text]
    exercise.accepted_answers = kanji.kunyomi_readings
    exercise.wrong_answers = wrong_readings
    exercise.unlock_mastery_level = :beginner
  end

  # Meaning exercise
  wrong_meanings = (all_meanings - (kanji.meanings || [])).sample(2)
  KanjiExercise.find_or_create_by!(kanji: kanji, exercise_type: :meaning, question: "#{kanji.title}") do |exercise|
    exercise.question_types = [:text]
    exercise.accepted_answers = kanji.meanings
    exercise.wrong_answers = wrong_meanings
    exercise.unlock_mastery_level = :beginner
  end
end