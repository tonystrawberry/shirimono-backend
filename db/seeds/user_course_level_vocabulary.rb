# db/seeds/user_course_level_vocabulary.rb
UserCourse.find_each do |user_course|
  CourseLevelVocabulary.where(course: user_course.course).find_each do |course_level_vocabulary|
    UserCourseLevelVocabulary.find_or_create_by!(user_course: user_course, course_level_vocabulary: course_level_vocabulary) do |user_course_level_vocabulary|
      user_course_level_vocabulary.status = :not_started
      user_course_level_vocabulary.user_course_level_vocabulary_links_count = 0
    end
  end
end