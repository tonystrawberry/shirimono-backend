# db/seeds/course_level_kanji.rb
course_level_kanjis = [
  ['Basic Kanji', 'Covers the most fundamental kanji for this level.'],
  ['Everyday Kanji', 'Kanji used in daily life and common situations.'],
  ['Challenge Kanji', 'More difficult kanji to challenge your skills.']
]
Course.all.each do |course|
  course_level_kanjis.each_with_index do |(title, description), index|
    CourseLevelKanji.find_or_create_by!(course: course, position: index + 1) do |level|
      level.title = title
      level.description = description
      level.kanjis_count = 0
    end
  end
end