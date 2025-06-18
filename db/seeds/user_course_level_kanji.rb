# db/seeds/user_course_level_kanji.rb
UserCourse.find_each do |user_course|
  CourseLevelKanji.where(course: user_course.course).find_each do |course_level_kanji|
    UserCourseLevelKanji.find_or_create_by!(user_course: user_course, course_level_kanji: course_level_kanji) do |user_course_level_kanji|
      user_course_level_kanji.status = :not_started
      user_course_level_kanji.user_course_level_kanji_links_count = 0
    end
  end
end