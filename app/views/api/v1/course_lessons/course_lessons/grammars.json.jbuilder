json.course_level do
  json.extract! @course_level, :id, :title, :description, :position
  json.course do
    json.extract! @course, :id, :title, :slug
  end
end

json.grammars @grammars do |grammar|
  grammar_exercises = @grammar_exercises.select { |ex| grammar.id == ex.grammar_id }

  if grammar_exercises.present?
    json.extract! grammar, :id, :title, :slug
    json.meanings grammar.meanings

    json.exercises grammar_exercises do |exercise|
      json.extract! exercise, :id, :question, :exercise_type, :question_types
      json.accepted_answers exercise.accepted_answers
      json.wrong_answers exercise.wrong_answers
    end
  end
end