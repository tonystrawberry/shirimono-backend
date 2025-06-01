json.course_level do
  json.extract! @course_level, :id, :title, :description, :position
  json.course do
    json.extract! @course, :id, :title, :slug
  end
end

json.kanjis @kanjis do |kanji|
  # Get exercises for this kanji
  kanji_exercises = @kanji_exercises.select { |ex| kanji.id == ex.kanji_id }

  # Only include this kanji if it has unreviewed exercises
  if kanji_exercises.present?
    json.extract! kanji, :id, :title, :slug, :kunyomi_readings, :onyomi_readings
    json.meanings kanji.meanings

    json.exercises kanji_exercises do |exercise|
      json.extract! exercise, :id, :question, :exercise_type, :question_types
      json.accepted_answers exercise.accepted_answers
      json.wrong_answers exercise.wrong_answers
    end
  end
end