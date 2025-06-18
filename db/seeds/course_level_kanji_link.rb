# db/seeds/course_level_kanji_link.rb
kanji_ids = Kanji.pluck(:id)
CourseLevelKanji.find_each do |course_level_kanji|
  selected_kanji_ids = kanji_ids.sample(5)
  selected_kanji_ids.each do |kanji_id|
    CourseLevelKanjiLink.find_or_create_by!(course_level_kanji: course_level_kanji, kanji_id: kanji_id) do |course_level_kanji_link|
      course_level_kanji_link.is_published = true
    end
  end
end