# Create exercises for each grammar point
puts "Creating grammar exercises..."

Grammar.find_each do |grammar|
  # Usage exercise (fill in the blank)
  GrammarExercise.find_or_create_by!(
    grammar: grammar,
    question: "私は毎日学校に＿＿＿行きます。",
    exercise_type: :usage,
    question_types: [:multi],
    accepted_answers: [grammar.title],
    wrong_answers: (Grammar.where.not(id: grammar.id).pluck(:title).flatten - [grammar.title]).sample(4),
    unlock_mastery_level: :beginner
  )
end

puts "Created #{GrammarExercise.count} grammar exercises"