# db/seeds/user_review_grammar.rb
UserCourseLevelGrammarLink.find_each do |user_course_level_grammar_link|
  grammar = user_course_level_grammar_link.course_level_grammar_link.grammar
  grammar_exercises = GrammarExercise.where(grammar: grammar)
  grammar_exercises.each do |exercise|
    UserReviewGrammar.find_or_create_by!(
      user_course_level_grammar_link_id: user_course_level_grammar_link.id,
      grammar_exercise_id: exercise.id,
      grammar_id: grammar.id
    ) do |review|
      review.memorization_status = :level_0
      review.next_review_at = Time.now + 1.day
      review.number_of_total_reviews = 0
      review.number_of_correct_reviews = 0
    end
  end
end