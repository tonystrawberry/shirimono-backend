# == Schema Information
#
# Table name: course_grammars
#
#  id                                                    :bigint           not null, primary key
#  is_published(Whether the grammar is published or not) :boolean          default(FALSE), not null
#  created_at                                            :datetime         not null
#  updated_at                                            :datetime         not null
#  course_id(Course that the grammar belongs to)         :bigint           not null
#  grammar_id(Grammar that belongs to the course)        :bigint           not null
#
# Indexes
#
#  index_course_grammars_on_course_id   (course_id)
#  index_course_grammars_on_grammar_id  (grammar_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (grammar_id => grammars.id)
#
class CourseGrammar < ApplicationRecord
  belongs_to :course
  belongs_to :grammar
end
