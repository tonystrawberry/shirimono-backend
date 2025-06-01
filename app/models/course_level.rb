# == Schema Information
#
# Table name: course_levels
#
#  id                                                        :bigint           not null, primary key
#  course_points_count(Number of course points in the level) :integer          default(0), not null
#  description(Description of the level)                     :text
#  point_type(Type of the course points in the level)        :integer          default("kanji"), not null
#  position(Position of the level in the course)             :integer          not null
#  title(Title of the level)                                 :string           not null
#  created_at                                                :datetime         not null
#  updated_at                                                :datetime         not null
#  course_id(Course the level belongs to)                    :bigint           not null
#
# Indexes
#
#  index_course_levels_on_course_id                              (course_id)
#  index_course_levels_on_course_id_and_position_and_point_type  (course_id,position,point_type) UNIQUE
#  index_course_levels_on_course_point_type_and_position         (course_id,point_type,position) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class CourseLevel < ApplicationRecord
  translates :title, :description

  belongs_to :course

  has_many :course_level_kanjis, dependent: :destroy
  has_many :kanjis, through: :course_level_kanjis
  has_many :kanji_exercises, through: :kanjis

  has_many :course_level_vocabularies, dependent: :destroy
  has_many :vocabularies, through: :course_level_vocabularies
  has_many :vocabulary_exercises, through: :vocabularies

  has_many :course_level_grammars, dependent: :destroy
  has_many :grammars, through: :course_level_grammars
  has_many :grammar_exercises, through: :grammars

  has_many :user_course_levels, dependent: :destroy
  has_many :user_courses, through: :user_course_levels

  enum :point_type, {
    kanji: 0,
    vocabulary: 1,
    grammar: 2
  }, prefix: true

  validates :title, presence: true
  validates :course_points_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :point_type, presence: true
  validates :position, presence: true, uniqueness: { scope: [:course_id, :point_type] }
end
