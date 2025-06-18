course_level_vocabularies = [
  ['Starter Vocabulary', 'Essential words for beginners.'],
  ['Practical Vocabulary', 'Words for practical, everyday use.'],
  ['Advanced Vocabulary', 'Challenging words for advanced learners.']
]
Course.all.each do |course|
  course_level_vocabularies.each_with_index do |(title, description), index|
    CourseLevelVocabulary.find_or_create_by!(course: course, position: index + 1) do |level|
      level.title = title
      level.description = description
      level.vocabularies_count = 0
    end
  end
end