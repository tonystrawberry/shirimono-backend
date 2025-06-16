# == Schema Information
#
# Table name: user_review_kanjis
#
#  id                                                                                         :bigint           not null, primary key
#  memorization_status(Memorization status of the user review)                                :integer          default(0), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  course_level_kanji_id(CourseLevelKanji that the review belongs to)                         :bigint           not null
#  kanji_exercise_id(KanjiExercise that the review belongs to)                                :bigint           not null
#  kanji_id(Kanji that the review belongs to)                                                 :bigint           not null
#  user_course_level_id(UserCourseLevel that the review belongs to)                           :bigint           not null
#
# Indexes
#
#  index_user_review_kanjis_on_course_level_kanji_id  (course_level_kanji_id)
#  index_user_review_kanjis_on_kanji_exercise_id      (kanji_exercise_id)
#  index_user_review_kanjis_on_kanji_id               (kanji_id)
#  index_user_review_kanjis_on_user_course_level_id   (user_course_level_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_kanji_id => course_level_kanjis.id)
#  fk_rails_...  (kanji_exercise_id => kanji_exercises.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#  fk_rails_...  (user_course_level_id => user_course_levels.id)
#
class UserReviewKanji < ApplicationRecord
end
