# db/seeds/grammar_exercise.rb
unlock_levels = GrammarExercise.unlock_mastery_levels.keys
level_questions = {
  'beginner' => 'ご飯を食べ{placeholder}',
  'elementary' => '本を読む{placeholder}',
  'intermediate' => '友達と話す{placeholder}',
  'advanced' => '手紙を書い{placeholder}',
  'master' => '山に登っ{placeholder}'
}

Grammar.find_each do |grammar|
  unlock_levels.each do |level|
    question = level_questions[level]
    GrammarExercise.find_or_create_by!(grammar: grammar, exercise_type: :usage, unlock_mastery_level: level, question: question) do |exercise|
      exercise.question_types = [:text]
      exercise.accepted_answers = [grammar.title]
      exercise.wrong_answers = []
    end
  end
end