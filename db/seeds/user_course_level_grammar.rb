# db/seeds/user_course_level_grammar.rb
UserCourse.find_each do |user_course|
  CourseLevelGrammar.where(course: user_course.course).find_each do |course_level_grammar|
    UserCourseLevelGrammar.find_or_create_by!(user_course: user_course, course_level_grammar: course_level_grammar) do |user_course_level_grammar|
      user_course_level_grammar.status = :not_ready
      user_course_level_grammar.user_course_level_grammar_links_count = 0
    end
  end
end