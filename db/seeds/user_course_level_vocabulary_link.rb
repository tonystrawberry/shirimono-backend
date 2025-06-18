UserCourseLevelVocabulary.find_each do |user_course_level_vocabulary|
  course_level_vocabulary_links = CourseLevelVocabularyLink.where(course_level_vocabulary: user_course_level_vocabulary.course_level_vocabulary)
  course_level_vocabulary_links.each do |course_level_vocabulary_link|
    UserCourseLevelVocabularyLink.find_or_create_by!(
      user_course_level_vocabulary: user_course_level_vocabulary,
      course_level_vocabulary_link: course_level_vocabulary_link
    ) do |user_course_level_vocabulary_link|
      user_course_level_vocabulary_link.status = :not_started
      user_course_level_vocabulary_link.user_review_vocabularies_count = 0
    end
  end
end