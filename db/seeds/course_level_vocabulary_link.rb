# db/seeds/course_level_vocabulary_link.rb
vocabulary_ids = Vocabulary.pluck(:id)
CourseLevelVocabulary.find_each do |course_level_vocabulary|
  selected_vocabulary_ids = vocabulary_ids.sample(5)
  selected_vocabulary_ids.each do |vocabulary_id|
    CourseLevelVocabularyLink.find_or_create_by!(course_level_vocabulary: course_level_vocabulary, vocabulary_id: vocabulary_id) do |course_level_vocabulary_link|
      course_level_vocabulary_link.is_published = true
    end
  end
end