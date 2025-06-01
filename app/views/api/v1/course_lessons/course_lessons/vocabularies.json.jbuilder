json.course_level do
  json.extract! @course_level, :id, :title, :description, :position
  json.course do
    json.extract! @course, :id, :title, :slug
  end
end

json.vocabularies @vocabularies do |vocabulary|
  json.extract! vocabulary, :id, :title, :slug, :kana, :types
  json.meanings vocabulary.meanings

  json.exercises @vocabulary_exercises.select { |ex| ex.unlock_mastery_level_beginner? } do |exercise|
    json.extract! exercise, :id, :question, :exercise_type, :question_types
    json.accepted_answers exercise.accepted_answers
    json.wrong_answers exercise.wrong_answers
  end
end