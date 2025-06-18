# db/seeds/user_review_vocabulary.rb
UserCourseLevelVocabularyLink.find_each do |user_course_level_vocabulary_link|
  vocabulary = user_course_level_vocabulary_link.course_level_vocabulary_link.vocabulary
  vocabulary_exercises = VocabularyExercise.where(vocabulary: vocabulary)
  vocabulary_exercises.each do |exercise|
    UserReviewVocabulary.find_or_create_by!(
      user_course_level_vocabulary_link_id: user_course_level_vocabulary_link.id,
      vocabulary_exercise_id: exercise.id,
      vocabulary_id: vocabulary.id
    ) do |review|
      review.memorization_status = :level_0
      review.next_review_at = Time.now + 1.day
      review.number_of_total_reviews = 0
      review.number_of_correct_reviews = 0
    end
  end
end