json.course_level_kanji do
  json.extract! @course_level_kanji, :id, :title, :description, :position
  json.course do
    json.extract! @course, :id, :title, :slug
  end
end

json.kanjis @kanjis do |kanji|
  kanji_exercises = @kanji_exercises.select { |kanji_exercise| kanji.id == kanji_exercise.kanji_id }

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