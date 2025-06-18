UserCourseLevelGrammar.find_each do |user_course_level_grammar|
  course_level_grammar_links = CourseLevelGrammarLink.where(course_level_grammar: user_course_level_grammar.course_level_grammar)
  course_level_grammar_links.each do |course_level_grammar_link|
    UserCourseLevelGrammarLink.find_or_create_by!(
      user_course_level_grammar: user_course_level_grammar,
      course_level_grammar_link: course_level_grammar_link
    ) do |user_course_level_grammar_link|
      user_course_level_grammar_link.status = :not_started
      user_course_level_grammar_link.user_review_grammars_count = 0
    end
  end
end