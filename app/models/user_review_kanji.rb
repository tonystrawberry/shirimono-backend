# == Schema Information
#
# Table name: user_review_kanjis
#
#  id                                                                                         :bigint           not null, primary key
#  memorization_status(Memorization status of the user review)                                :integer          default("level_0"), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  kanji_exercise_id(KanjiExercise that the review belongs to)                                :bigint           not null
#  kanji_id(Kanji that the review belongs to)                                                 :bigint           not null
#  user_course_level_kanji_link_id(UserCourseLevelKanjiLink that the review belongs to)       :bigint           not null
#
# Indexes
#
#  index_user_review_kanjis_on_kanji_exercise_id                (kanji_exercise_id)
#  index_user_review_kanjis_on_kanji_id                         (kanji_id)
#  index_user_review_kanjis_on_user_course_level_kanji_link_id  (user_course_level_kanji_link_id)
#  index_user_review_kanjis_unique                              (user_course_level_kanji_link_id,kanji_exercise_id,kanji_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (kanji_exercise_id => kanji_exercises.id)
#  fk_rails_...  (kanji_id => kanjis.id)
#  fk_rails_...  (user_course_level_kanji_link_id => user_course_level_kanji_links.id)
#
class UserReviewKanji < ApplicationRecord
  belongs_to :user_course_level_kanji_link
  belongs_to :kanji_exercise
  belongs_to :kanji

  enum :memorization_status, {
    level_0: 0,
    level_1: 1,
    level_2: 2,
    level_3: 3,
    level_4: 4,
    level_5: 5,
    level_6: 6
  }, prefix: true

  validates :memorization_status, presence: true
  validates :next_review_at, presence: true
  validates :number_of_total_reviews, presence: true
  validates :number_of_correct_reviews, presence: true

  counter_culture :user_course_level_kanji_link
end
