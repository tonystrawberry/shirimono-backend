# == Schema Information
#
# Table name: course_level_grammars
#
#  id                                                                :bigint           not null, primary key
#  course_level_grammar_links_count(Number of grammars in the level) :integer          default(0), not null
#  description(Description of the grammar level)                     :text
#  position(Position of the level in the course)                     :integer          not null
#  title(Title of the grammar level)                                 :string
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#  course_id(Course the level belongs to)                            :bigint           not null
#
# Indexes
#
#  index_course_level_grammars_on_course_id               (course_id)
#  index_course_level_grammars_on_course_id_and_position  (course_id,position) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseLevelGrammar < ApplicationRecord
  translates :title, :description

  belongs_to :course

  has_many :course_level_grammar_links, dependent: :destroy
  has_many :grammars, through: :course_level_grammar_links
  has_many :grammar_exercises, through: :grammars
  has_many :user_course_level_grammars, dependent: :destroy
  has_many :user_courses, through: :user_course_level_grammars

  validates :title, presence: true
  validates :course_level_grammar_links_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :position, presence: true, uniqueness: { scope: [:course_id] }
end
