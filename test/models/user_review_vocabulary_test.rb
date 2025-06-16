# == Schema Information
#
# Table name: user_review_vocabularies
#
#  id                                                                                         :bigint           not null, primary key
#  memorization_status(Memorization status of the user review)                                :integer          default(0), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  course_level_vocabulary_id(CourseLevelVocabulary that the review belongs to)               :bigint           not null
#  user_course_level_id(UserCourseLevel that the review belongs to)                           :bigint           not null
#  vocabulary_exercise_id(VocabularyExercise that the review belongs to)                      :bigint           not null
#  vocabulary_id(Vocabulary that the review belongs to)                                       :bigint           not null
#
# Indexes
#
#  index_user_review_vocabularies_on_course_level_vocabulary_id  (course_level_vocabulary_id)
#  index_user_review_vocabularies_on_user_course_level_id        (user_course_level_id)
#  index_user_review_vocabularies_on_vocabulary_exercise_id      (vocabulary_exercise_id)
#  index_user_review_vocabularies_on_vocabulary_id               (vocabulary_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_vocabulary_id => course_level_vocabularies.id)
#  fk_rails_...  (user_course_level_id => user_course_levels.id)
#  fk_rails_...  (vocabulary_exercise_id => vocabulary_exercises.id)
#  fk_rails_...  (vocabulary_id => vocabularies.id)
#
require "test_helper"

class UserReviewVocabularyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
