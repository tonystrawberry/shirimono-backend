# == Schema Information
#
# Table name: course_level_grammar_links
#
#  id                                                                :bigint           not null, primary key
#  is_published(Whether the grammar is published or not)             :boolean          default(FALSE), not null
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#  course_level_grammar_id(Course level that the grammar belongs to) :bigint           not null
#  grammar_id(Grammar that belongs to the course)                    :bigint           not null
#
# Indexes
#
#  idx_on_course_level_grammar_id_grammar_id_77dfe26f72         (course_level_grammar_id,grammar_id) UNIQUE
#  index_course_level_grammar_links_on_course_level_grammar_id  (course_level_grammar_id)
#  index_course_level_grammar_links_on_grammar_id               (grammar_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_level_grammar_id => course_level_grammars.id)
#  fk_rails_...  (grammar_id => grammars.id)
#
class CourseLevelGrammarLink < ApplicationRecord
  belongs_to :course_level_grammar
  belongs_to :grammar

  has_many :user_course_level_grammars, dependent: :destroy

  validates :course_level_id, uniqueness: { scope: :grammar_id }
  validates :is_published, inclusion: { in: [true, false] }
end
