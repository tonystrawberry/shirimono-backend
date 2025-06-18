course_level_grammars = [
  ['Core Grammar', 'The most important grammar points for this level.'],
  ['Conversational Grammar', 'Grammar used in everyday conversation.'],
  ['Complex Grammar', 'Advanced grammar for deeper understanding.']
]
Course.all.each do |course|
  course_level_grammars.each_with_index do |(title, description), index|
    CourseLevelGrammar.find_or_create_by!(course: course, position: index + 1) do |level|
      level.title = title
      level.description = description
      level.course_level_grammar_links_count = 0
    end
  end
end