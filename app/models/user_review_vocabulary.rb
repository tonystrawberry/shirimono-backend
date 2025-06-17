# == Schema Information
#
# Table name: user_review_vocabularies
#
#  id                                                                                         :bigint           not null, primary key
#  memorization_status(Memorization status of the user review)                                :integer          default("level_0"), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  user_course_level_vocabulary_id(UserCourseLevelVocabulary that the review belongs to)      :bigint           not null
#  vocabulary_exercise_id(VocabularyExercise that the review belongs to)                      :bigint           not null
#  vocabulary_id(Vocabulary that the review belongs to)                                       :bigint           not null
#
# Indexes
#
#  idx_on_user_course_level_vocabulary_id_8f3549ed48         (user_course_level_vocabulary_id)
#  index_user_review_vocabularies_on_vocabulary_exercise_id  (vocabulary_exercise_id)
#  index_user_review_vocabularies_on_vocabulary_id           (vocabulary_id)
#  index_user_review_vocabularies_unique                     (user_course_level_vocabulary_id,vocabulary_exercise_id,vocabulary_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_course_level_vocabulary_id => user_course_level_vocabularies.id)
#  fk_rails_...  (vocabulary_exercise_id => vocabulary_exercises.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
class UserReviewVocabulary < ApplicationRecord
  belongs_to :user_course_level_vocabulary
  belongs_to :vocabulary_exercise
  belongs_to :vocabulary

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

  counter_culture :user_course_level_vocabulary
end
