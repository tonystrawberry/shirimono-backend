# == Schema Information
#
# Table name: user_course_level_grammars
#
#  id                                                                                                                    :bigint           not null, primary key
#  status(Status of the user course level grammar (e.g. not_started, partially_in_progress, all_in_progress, completed)) :integer          default("not_started"), not null
#  user_reviews_grammars_count(Number of user reviews for the user course level grammar)                                 :integer          default(0), not null
#  created_at                                                                                                            :datetime         not null
#  updated_at                                                                                                            :datetime         not null
#  course_level_grammar_id(CourseLevelGrammar that the grammar belongs to)                                               :bigint           not null
#  user_course_id(UserCourse that the grammar belongs to)                                                                :bigint           not null
#
# Indexes
#
#  index_user_course_level_grammars_on_course_level_grammar_id  (course_level_grammar_id)
#  index_user_course_level_grammars_on_user_course_id           (user_course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_grammar_id => course_level_grammars.id)
#  fk_rails_...  (user_course_id => user_courses.id)
#
class UserCourseLevelGrammar < ApplicationRecord
  belongs_to :user_course
  belongs_to :course_level_grammar

  has_many :user_review_grammars, dependent: :destroy

  enum :status, {
    not_started: 0,
    partially_in_progress: 1,
    all_in_progress: 2,
    completed: 3
  }, prefix: true
end
