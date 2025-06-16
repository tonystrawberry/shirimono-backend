# == Schema Information
#
# Table name: user_review_grammars
#
#  id                                                                                         :bigint           not null, primary key
#  memorization_status(Memorization status of the user review)                                :integer          default(0), not null
#  next_review_at(Next review date for the user review)                                       :datetime
#  number_of_correct_reviews(Number of correct reviews the user has made on the course point) :integer          default(0), not null
#  number_of_total_reviews(Number of reviews the user has made on the course point)           :integer          default(0), not null
#  created_at                                                                                 :datetime         not null
#  updated_at                                                                                 :datetime         not null
#  course_level_grammar_id(CourseLevelGrammar that the review belongs to)                     :bigint           not null
#  grammar_exercise_id(GrammarExercise that the review belongs to)                            :bigint           not null
#  grammar_id(Grammar that the review belongs to)                                             :bigint           not null
#  user_course_level_id(UserCourseLevel that the review belongs to)                           :bigint           not null
#
# Indexes
#
#  index_user_review_grammars_on_course_level_grammar_id  (course_level_grammar_id)
#  index_user_review_grammars_on_grammar_exercise_id      (grammar_exercise_id)
#  index_user_review_grammars_on_grammar_id               (grammar_id)
#  index_user_review_grammars_on_user_course_level_id     (user_course_level_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_grammar_id => course_level_grammars.id)
#  fk_rails_...  (grammar_exercise_id => grammar_exercises.id)
#  fk_rails_...  (grammar_id => grammars.id)
#  fk_rails_...  (user_course_level_id => user_course_levels.id)
#
require "test_helper"

class UserReviewGrammarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
