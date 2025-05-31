json.course_level do
  json.extract! @course_level, :id, :title, :description, :position
  json.course do
    json.extract! @course, :id, :title, :slug
  end
end

json.kanjis @kanjis do |kanji|
  json.extract! kanji, :id, :title, :slug, :kunyomi_readings, :onyomi_readings
  json.meanings kanji.meanings

  json.exercises kanji.kanji_exercises.select { |ex| ex.unlock_mastery_level_beginner? } do |exercise|
    json.extract! exercise, :id, :question, :exercise_type, :question_types
    json.accepted_answers exercise.accepted_answers
    json.wrong_answers exercise.wrong_answers
  end
end