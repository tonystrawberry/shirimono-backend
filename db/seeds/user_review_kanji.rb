# db/seeds/user_review_kanji.rb
UserCourseLevelKanjiLink.find_each do |user_course_level_kanji_link|
  kanji = user_course_level_kanji_link.course_level_kanji_link.kanji
  kanji_exercises = KanjiExercise.where(kanji: kanji)
  kanji_exercises.each do |exercise|
    UserReviewKanji.find_or_create_by!(
      user_course_level_kanji_link_id: user_course_level_kanji_link.id,
      kanji_exercise_id: exercise.id,
      kanji_id: kanji.id
    ) do |review|
      review.memorization_status = :level_0
      review.next_review_at = Time.now + 1.day
      review.number_of_total_reviews = 0
      review.number_of_correct_reviews = 0
    end
  end
end