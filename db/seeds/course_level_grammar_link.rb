# db/seeds/course_level_grammar_link.rb
grammar_ids = Grammar.pluck(:id)
CourseLevelGrammar.find_each do |course_level_grammar|
  selected_grammar_ids = grammar_ids.sample(5)
  selected_grammar_ids.each do |grammar_id|
    CourseLevelGrammarLink.find_or_create_by!(course_level_grammar: course_level_grammar, grammar_id: grammar_id) do |course_level_grammar_link|
      course_level_grammar_link.is_published = true
    end
  end
end