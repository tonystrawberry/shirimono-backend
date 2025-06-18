# db/seeds/user_course_level_kanji_link.rb
UserCourseLevelKanji.find_each do |user_course_level_kanji|
  course_level_kanji_links = CourseLevelKanjiLink.where(course_level_kanji: user_course_level_kanji.course_level_kanji)
  course_level_kanji_links.each do |course_level_kanji_link|
    UserCourseLevelKanjiLink.find_or_create_by!(
      user_course_level_kanji: user_course_level_kanji,
      course_level_kanji_link: course_level_kanji_link
    ) do |user_course_level_kanji_link|
      user_course_level_kanji_link.status = :not_started
      user_course_level_kanji_link.user_review_kanjis_count = 0
    end
  end
end