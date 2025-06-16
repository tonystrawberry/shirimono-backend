# == Schema Information
#
# Table name: user_reviews
#
#  id                                                                                         :bigint           not null, primary key
#  course_point_type                                                                          :string           not null
#  memorization_status(Memorization status of the user review)                                :integer          default("level_0"), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  point_exercise_type                                                                        :string
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  course_point_id(Course point that the review belongs to)                                   :bigint           not null
#  point_exercise_id                                                                          :bigint
#  user_course_level_id(UserCourseLevel that the review belongs to)                           :bigint           not null
#
# Indexes
#
#  index_user_reviews_on_course_point    (course_point_type,course_point_id)
#  index_user_reviews_on_point_exercise  (point_exercise_type,point_exercise_id)
#  index_user_reviews_on_user_course_level_id  (user_course_level_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_course_level_id => user_course_levels.id)
#
class UserReview < ApplicationRecord
  belongs_to :user_course_level
  belongs_to :course_point, polymorphic: true
  belongs_to :point_exercise, polymorphic: true

  delegate :user, to: :user_course_level
  delegate :user_course, to: :user_course_level
  delegate :kanji, to: :course_point
  delegate :vocabulary, to: :course_point
  delegate :grammar, to: :course_point

  # counter_culture :user_course_level,
  #                column_name: proc { |model| model.course_point_type == "CourseLevelKanji" ? 'kanji_user_reviews_count' : nil },
  #                column_names: {
  #                  ["course_point_type = ?", "CourseLevelKanji"] => :kanji_user_reviews_count
  #                }
  #
  # counter_culture :user_course_level,
  #                column_name: proc { |model| model.course_point_type == "CourseLevelGrammar" ? 'grammar_user_reviews_count' : nil },
  #                column_names: {
  #                  ["course_point_type = ?", "CourseLevelGrammar"] => :grammar_user_reviews_count
  #                }
  #
  # counter_culture :user_course_level,
  #                column_name: proc { |model| model.course_point_type == "CourseLevelVocabulary" ? 'vocabulary_user_reviews_count' : nil },
  #                column_names: {
  #                  ["course_point_type = ?", "CourseLevelVocabulary"] => :vocabulary_user_reviews_count
  #                }

  enum :memorization_status, {
    level_0: 0,
    level_1: 1,
    level_2: 2,
    level_3: 3,
    level_4: 4,
    level_5: 5,
    level_6: 6,
  }, prefix: true
end
