# == Schema Information
#
# Table name: course_level_grammars
#
#  id                                                    :bigint           not null, primary key
#  is_published(Whether the grammar is published or not) :boolean          default(FALSE), not null
#  created_at                                            :datetime         not null
#  updated_at                                            :datetime         not null
#  course_level_id                                       :bigint           not null
#  grammar_id(Grammar that belongs to the course)        :bigint           not null
#
# Indexes
#
#  index_course_level_grammars_on_course_level_id  (course_level_id)
#  index_course_level_grammars_on_grammar_id       (grammar_id)
#  index_course_level_grammars_unique              (course_level_id,grammar_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_level_id => course_levels.id)
#  fk_rails_...  (grammar_id => grammars.id)
#
class CourseLevelGrammar < ApplicationRecord
  belongs_to :course_level
  belongs_to :grammar

  validates :course_level_id, uniqueness: { scope: :grammar_id }
  validates :is_published, inclusion: { in: [true, false] }
end
